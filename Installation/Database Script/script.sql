USE [master]
GO
/****** Object:  Database [ExaminationSystem]    Script Date: 2/9/2025 1:00:32 PM ******/
CREATE DATABASE [ExaminationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ExaminationSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExaminationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ExaminationSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExaminationSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExaminationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExaminationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExaminationSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExaminationSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExaminationSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExaminationSystem]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/9/2025 1:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[co_id] [int] IDENTITY(1,1) NOT NULL,
	[co_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[co_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Exam]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Exam](
	[ex_id] [int] NOT NULL,
	[co_id] [int] NOT NULL,
	[track_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ex_id] ASC,
	[co_id] ASC,
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ex_id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[duration] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ins_id] [int] IDENTITY(1,1) NOT NULL,
	[ins_name] [nvarchar](100) NOT NULL,
	[ins_email] [nvarchar](100) NOT NULL,
	[ins_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor_Course]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_Course](
	[ins_id] [int] NOT NULL,
	[co_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC,
	[co_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor_Track]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_Track](
	[ins_id] [int] NOT NULL,
	[track_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC,
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[op_id] [int] IDENTITY(1,1) NOT NULL,
	[op_text] [nvarchar](max) NOT NULL,
	[is_correct] [bit] NOT NULL,
	[q_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[op_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[q_id] [int] IDENTITY(1,1) NOT NULL,
	[q_type] [nvarchar](50) NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[grade] [int] NOT NULL,
	[ex_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[q_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[st_id] [int] IDENTITY(1,1) NOT NULL,
	[st_name] [nvarchar](100) NOT NULL,
	[st_email] [nvarchar](100) NOT NULL,
	[st_phoneNo] [nvarchar](15) NOT NULL,
	[track_id] [int] NOT NULL,
	[st_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Answer](
	[st_id] [int] NOT NULL,
	[q_id] [int] NOT NULL,
	[op_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC,
	[q_id] ASC,
	[op_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Exam_Attempt]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Exam_Attempt](
	[st_id] [int] NOT NULL,
	[ex_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC,
	[ex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[topic_id] [int] IDENTITY(1,1) NOT NULL,
	[topic_name] [nvarchar](100) NOT NULL,
	[co_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[track_id] [int] IDENTITY(1,1) NOT NULL,
	[track_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track_Course]    Script Date: 2/9/2025 1:00:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track_Course](
	[co_id] [int] NOT NULL,
	[track_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[co_id] ASC,
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (1, N'Object-Oriented Programming (OOP)')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (2, N'Structured Query Language (SQL)')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (3, N'Database Design')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (4, N'Mobile App Development Basics')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (5, N'Flutter Development')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (6, N'React Development')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (7, N'Node.js Development')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (8, N'Java Basics')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (9, N'Advanced Java Programming')
INSERT [dbo].[Course] ([co_id], [co_name]) VALUES (10, N'Web Development Fundamentals')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[Course_Exam] ([ex_id], [co_id], [track_id]) VALUES (1, 1, 1)
INSERT [dbo].[Course_Exam] ([ex_id], [co_id], [track_id]) VALUES (2, 2, 1)
INSERT [dbo].[Course_Exam] ([ex_id], [co_id], [track_id]) VALUES (3, 1, 3)
INSERT [dbo].[Course_Exam] ([ex_id], [co_id], [track_id]) VALUES (4, 5, 1)
INSERT [dbo].[Course_Exam] ([ex_id], [co_id], [track_id]) VALUES (5, 9, 5)
INSERT [dbo].[Course_Exam] ([ex_id], [co_id], [track_id]) VALUES (6, 1, 2)
INSERT [dbo].[Course_Exam] ([ex_id], [co_id], [track_id]) VALUES (6, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([ex_id], [start_date], [duration]) VALUES (1, CAST(N'2025-01-20T10:00:00.000' AS DateTime), 90)
INSERT [dbo].[Exam] ([ex_id], [start_date], [duration]) VALUES (2, CAST(N'2025-01-25T09:00:00.000' AS DateTime), 120)
INSERT [dbo].[Exam] ([ex_id], [start_date], [duration]) VALUES (3, CAST(N'2025-02-01T11:00:00.000' AS DateTime), 100)
INSERT [dbo].[Exam] ([ex_id], [start_date], [duration]) VALUES (4, CAST(N'2025-02-15T10:00:00.000' AS DateTime), 90)
INSERT [dbo].[Exam] ([ex_id], [start_date], [duration]) VALUES (5, CAST(N'2025-02-20T09:00:00.000' AS DateTime), 120)
INSERT [dbo].[Exam] ([ex_id], [start_date], [duration]) VALUES (6, CAST(N'2025-02-20T09:00:00.000' AS DateTime), 90)
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([ins_id], [ins_name], [ins_email], [ins_password]) VALUES (1, N'Ahmed Ali', N'ahmed.ali@example.com', N'password1')
INSERT [dbo].[Instructor] ([ins_id], [ins_name], [ins_email], [ins_password]) VALUES (2, N'Mona Hassan', N'mona.hassan@example.com', N'password2')
INSERT [dbo].[Instructor] ([ins_id], [ins_name], [ins_email], [ins_password]) VALUES (3, N'Khaled Mostafa', N'khaled.mostafa@example.com', N'password3')
INSERT [dbo].[Instructor] ([ins_id], [ins_name], [ins_email], [ins_password]) VALUES (4, N'Salma Youssef', N'salma.youssef@example.com', N'password4')
INSERT [dbo].[Instructor] ([ins_id], [ins_name], [ins_email], [ins_password]) VALUES (5, N'Omar Farouk', N'omar.farouk@example.com', N'password5')
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (1, 1)
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (1, 8)
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (2, 2)
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (3, 3)
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (4, 4)
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (4, 5)
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (5, 6)
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (5, 7)
INSERT [dbo].[Instructor_Course] ([ins_id], [co_id]) VALUES (5, 9)
GO
INSERT [dbo].[Instructor_Track] ([ins_id], [track_id]) VALUES (1, 1)
INSERT [dbo].[Instructor_Track] ([ins_id], [track_id]) VALUES (1, 2)
INSERT [dbo].[Instructor_Track] ([ins_id], [track_id]) VALUES (1, 3)
INSERT [dbo].[Instructor_Track] ([ins_id], [track_id]) VALUES (1, 4)
INSERT [dbo].[Instructor_Track] ([ins_id], [track_id]) VALUES (1, 5)
INSERT [dbo].[Instructor_Track] ([ins_id], [track_id]) VALUES (2, 1)
INSERT [dbo].[Instructor_Track] ([ins_id], [track_id]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (1, N'Hiding implementation details', 1, 1)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (2, N'Making all variables public', 0, 1)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (3, N'Allowing multiple inheritances', 0, 1)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (4, N'Overloading functions', 0, 1)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (5, N'Overloading functions', 1, 2)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (6, N'Using private constructors', 0, 2)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (7, N'Sharing code among classes', 0, 2)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (8, N'Creating standalone tables', 0, 2)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (9, N'Sharing code among classes', 1, 3)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (10, N'Creating standalone tables', 0, 3)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (11, N'Removing duplicates', 0, 3)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (12, N'Primary key references another table', 0, 3)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (13, N'Hiding implementation details', 1, 4)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (14, N'Making all variables public', 0, 4)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (15, N'Allowing multiple inheritances', 0, 4)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (16, N'Overloading functions', 0, 4)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (17, N'public', 1, 5)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (18, N'private', 1, 5)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (19, N'protected', 1, 5)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (20, N'static', 0, 5)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (21, N'True', 1, 6)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (22, N'False', 0, 6)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (23, N'True', 1, 7)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (24, N'False', 0, 7)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (25, N'True', 0, 8)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (26, N'False', 1, 8)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (27, N'True', 0, 9)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (28, N'False', 1, 9)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (29, N'True', 0, 10)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (30, N'False', 1, 10)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (31, N'WHERE', 1, 11)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (32, N'SELECT', 0, 11)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (33, N'FROM', 0, 11)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (34, N'GROUP BY', 0, 11)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (35, N'A key that references another table', 1, 12)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (36, N'A unique identifier for a table', 0, 12)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (37, N'A key that ensures uniqueness', 0, 12)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (38, N'A key that sorts records', 0, 12)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (39, N'CREATE TABLE', 1, 13)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (40, N'ALTER TABLE', 0, 13)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (41, N'DROP TABLE', 0, 13)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (42, N'INSERT INTO', 0, 13)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (43, N'To group rows with the same values', 1, 14)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (44, N'To filter rows', 0, 14)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (45, N'To sort rows', 0, 14)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (46, N'To join tables', 0, 14)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (47, N'COUNT', 1, 15)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (48, N'SUM', 1, 15)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (49, N'AVG', 1, 15)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (50, N'DELETE', 0, 15)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (51, N'True', 1, 16)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (52, N'False', 0, 16)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (53, N'True', 0, 17)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (54, N'False', 1, 17)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (55, N'True', 1, 18)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (56, N'False', 0, 18)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (57, N'True', 0, 19)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (58, N'False', 1, 19)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (59, N'True', 1, 20)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (60, N'False', 0, 20)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (61, N'class', 1, 21)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (62, N'struct', 0, 21)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (63, N'def', 0, 21)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (64, N'function', 0, 21)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (65, N'Function Overloading', 1, 22)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (66, N'Encapsulation', 0, 22)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (67, N'Abstraction', 0, 22)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (68, N'Inheritance', 0, 22)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (69, N'Binding data and methods together in a single unit', 1, 23)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (70, N'Providing access to private members', 0, 23)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (71, N'Allowing multiple inheritances', 0, 23)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (72, N'Creating multiple objects', 0, 23)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (73, N'private', 1, 24)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (74, N'public', 0, 24)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (75, N'protected', 0, 24)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (76, N'internal', 0, 24)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (77, N'Constructor', 1, 25)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (78, N'Destructor', 0, 25)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (79, N'Overloaded function', 0, 25)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (80, N'Static function', 0, 25)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (81, N'True', 1, 26)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (82, N'False', 0, 26)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (83, N'True', 1, 27)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (84, N'False', 0, 27)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (85, N'True', 1, 28)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (86, N'False', 0, 28)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (87, N'True', 1, 29)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (88, N'False', 0, 29)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (89, N'True', 1, 30)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (90, N'False', 0, 30)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (91, N'A JavaScript library for building user interfaces', 1, 31)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (92, N'A backend framework', 0, 31)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (93, N'A database management system', 0, 31)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (94, N'A programming language', 0, 31)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (95, N'A syntax extension for JavaScript', 1, 32)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (96, N'A state management library', 0, 32)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (97, N'A database query language', 0, 32)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (98, N'A testing framework', 0, 32)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (99, N'To manage dynamic data in a component', 1, 33)
GO
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (100, N'To define static data', 0, 33)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (101, N'To handle routing', 0, 33)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (102, N'To manage global state', 0, 33)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (103, N'A lightweight copy of the real DOM', 1, 34)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (104, N'A database', 0, 34)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (105, N'A state management tool', 0, 34)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (106, N'A testing framework', 0, 34)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (107, N'useState', 1, 35)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (108, N'useEffect', 1, 35)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (109, N'useContext', 1, 35)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (110, N'useRouter', 0, 35)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (111, N'To perform side effects in functional components', 1, 36)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (112, N'To define state', 0, 36)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (113, N'To handle routing', 0, 36)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (114, N'To manage global state', 0, 36)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (115, N'Props are immutable, state is mutable', 1, 37)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (116, N'State is passed from parent to child', 0, 37)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (117, N'Props are used for routing', 0, 37)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (118, N'State is immutable', 0, 37)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (119, N'A reusable piece of UI', 1, 38)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (120, N'A database table', 0, 38)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (121, N'A state management tool', 0, 38)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (122, N'A testing framework', 0, 38)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (123, N'To uniquely identify list items', 1, 39)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (124, N'To style list items', 0, 39)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (125, N'To manage state', 0, 39)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (126, N'To handle routing', 0, 39)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (127, N'To handle navigation in a React app', 1, 40)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (128, N'To manage state', 0, 40)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (129, N'To perform side effects', 0, 40)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (130, N'To define components', 0, 40)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (131, N'FALSE', 1, 41)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (132, N'TRUE', 0, 41)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (133, N'FALSE', 1, 42)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (134, N'TRUE', 0, 42)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (135, N'FALSE', 1, 43)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (136, N'TRUE', 0, 43)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (137, N'TRUE', 1, 44)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (138, N'FALSE', 0, 44)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (139, N'TRUE', 1, 45)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (140, N'FALSE', 0, 45)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (141, N'TRUE', 1, 46)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (142, N'FALSE', 0, 46)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (143, N'TRUE', 1, 47)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (144, N'FALSE', 0, 47)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (145, N'TRUE', 1, 48)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (146, N'FALSE', 0, 48)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (147, N'FALSE', 1, 49)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (148, N'TRUE', 0, 49)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (149, N'TRUE', 1, 50)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (150, N'FALSE', 0, 50)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (151, N'false', 1, 51)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (152, N'true', 0, 51)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (153, N'0', 0, 51)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (154, N'1', 0, 51)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (155, N'start()', 1, 52)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (156, N'run()', 0, 52)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (157, N'execute()', 0, 52)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (158, N'begin()', 0, 52)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (159, N'A runtime environment for executing Java bytecode', 1, 53)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (160, N'A compiler', 0, 53)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (161, N'A database', 0, 53)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (162, N'A testing framework', 0, 53)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (163, N'To prevent modification', 1, 54)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (164, N'To allow inheritance', 0, 54)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (165, N'To enable polymorphism', 0, 54)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (166, N'To define constants', 1, 54)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (167, N'ArrayList', 1, 55)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (168, N'HashMap', 1, 55)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (169, N'LinkedList', 1, 55)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (170, N'String', 0, 55)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (171, N'To ensure thread safety', 1, 56)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (172, N'To improve performance', 0, 56)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (173, N'To define constants', 0, 56)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (174, N'To enable inheritance', 0, 56)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (175, N'== compares references, .equals() compares contents', 1, 57)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (176, N'== compares contents, .equals() compares references', 0, 57)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (177, N'Both compare references', 0, 57)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (178, N'Both compare contents', 0, 57)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (179, N'To define class-level variables and methods', 1, 58)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (180, N'To define instance variables', 0, 58)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (181, N'To enable polymorphism', 0, 58)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (182, N'To prevent inheritance', 0, 58)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (183, N'A concise way to represent anonymous functions', 1, 59)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (184, N'A type of exception', 0, 59)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (185, N'A database query', 0, 59)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (186, N'A testing framework', 0, 59)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (187, N'To handle exceptions', 1, 60)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (188, N'To define constants', 0, 60)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (189, N'To enable inheritance', 0, 60)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (190, N'To improve performance', 0, 60)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (191, N'TRUE', 1, 61)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (192, N'FALSE', 0, 61)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (193, N'TRUE', 1, 62)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (194, N'FALSE', 0, 62)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (195, N'TRUE', 1, 63)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (196, N'FALSE', 0, 63)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (197, N'FALSE', 1, 64)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (198, N'TRUE', 0, 64)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (199, N'TRUE', 1, 65)
GO
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (200, N'FALSE', 0, 65)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (201, N'TRUE', 1, 66)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (202, N'FALSE', 0, 66)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (203, N'TRUE', 1, 67)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (204, N'FALSE', 0, 67)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (205, N'TRUE', 1, 68)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (206, N'FALSE', 0, 68)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (207, N'TRUE', 1, 69)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (208, N'FALSE', 0, 69)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (209, N'FALSE', 1, 70)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (210, N'TRUE', 0, 70)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (211, N'To hide the internal details and expose only necessary parts of the object', 1, 71)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (212, N'To allow multiple inheritance', 0, 71)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (213, N'To prevent polymorphism', 0, 71)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (214, N'To make the code run faster', 0, 71)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (215, N'Method overriding', 1, 72)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (216, N'Method overloading', 0, 72)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (217, N'Static methods', 0, 72)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (218, N'Constructors', 0, 72)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (219, N'Reuse code from another class', 1, 73)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (220, N'Create new objects', 0, 73)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (221, N'Define new classes without inheritance', 0, 73)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (222, N'Hide internal object details', 0, 73)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (223, N'An abstract class can have both abstract and concrete methods, while an interface can only have abstract methods', 1, 74)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (224, N'An interface can have both abstract and concrete methods, while an abstract class can only have abstract methods', 0, 74)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (225, N'Both abstract classes and interfaces cannot have concrete methods', 0, 74)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (226, N'There is no difference between them', 0, 74)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (227, N'To refer to the superclass constructor or methods', 1, 75)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (228, N'To refer to a method in the current class', 0, 75)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (229, N'To create a new instance of the current class', 0, 75)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (230, N'To make a method private', 0, 75)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (231, N'Global variables', 1, 76)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (232, N'Encapsulation', 0, 76)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (233, N'Polymorphism', 0, 76)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (234, N'Inheritance', 0, 76)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (235, N'NullPointerException', 1, 77)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (236, N'Nothing happens', 0, 77)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (237, N'The method executes normally', 0, 77)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (238, N'Compilation error', 0, 77)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (239, N'default', 1, 78)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (240, N'private', 0, 78)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (241, N'protected', 0, 78)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (242, N'public', 0, 78)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (243, N'Defining multiple methods with the same name but different parameters', 1, 79)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (244, N'Defining multiple methods with the same name and parameters', 0, 79)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (245, N'Changing the method return type', 0, 79)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (246, N'Method overloading is not supported in OOP', 0, 79)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (247, N'A subclass redefining a method inherited from a superclass', 1, 80)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (248, N'Changing the return type of a method', 0, 80)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (249, N'Overloading a method with the same name and parameters', 0, 80)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (250, N'Method overriding is not supported in Java', 0, 80)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (251, N'FALSE', 1, 81)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (252, N'TRUE', 0, 81)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (253, N'TRUE', 1, 82)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (254, N'FALSE', 0, 82)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (255, N'TRUE', 1, 83)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (256, N'FALSE', 0, 83)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (257, N'TRUE', 1, 84)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (258, N'FALSE', 0, 84)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (259, N'FALSE', 1, 85)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (260, N'TRUE', 0, 85)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (261, N'FALSE', 1, 86)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (262, N'TRUE', 0, 86)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (263, N'TRUE', 1, 87)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (264, N'FALSE', 0, 87)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (265, N'FALSE', 1, 88)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (266, N'TRUE', 0, 88)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (267, N'FALSE', 1, 89)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (268, N'TRUE', 0, 89)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (269, N'FALSE', 1, 90)
INSERT [dbo].[Option] ([op_id], [op_text], [is_correct], [q_id]) VALUES (270, N'TRUE', 0, 90)
SET IDENTITY_INSERT [dbo].[Option] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (1, N'MCQ', N'What is encapsulation in OOP?', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (2, N'MCQ', N'What is polymorphism in OOP?', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (3, N'MCQ', N'What is inheritance in OOP?', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (4, N'MCQ', N'What is abstraction in OOP?', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (5, N'MCQ', N'Which of the following are access modifiers in Java?', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (6, N'TF', N'An object is an instance of a class.', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (7, N'TF', N'In OOP, a class defines the blueprint of an object.', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (8, N'TF', N'Java supports multiple inheritance using classes.', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (9, N'TF', N'A constructor can return a value.', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (10, N'TF', N'Abstraction and encapsulation are the same thing.', 5, 1)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (11, N'MCQ', N'Which SQL clause is used to filter records?', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (12, N'MCQ', N'What is a foreign key in SQL?', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (13, N'MCQ', N'Which command is used to create a table in SQL?', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (14, N'MCQ', N'What is the purpose of the GROUP BY clause?', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (15, N'MCQ', N'Which of the following are SQL aggregate functions?', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (16, N'TF', N'SQL is used to interact with databases.', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (17, N'TF', N'A primary key can contain NULL values.', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (18, N'TF', N'The WHERE clause is used to filter rows.', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (19, N'TF', N'The DELETE command removes a table from the database.', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (20, N'TF', N'The UPDATE command modifies existing records.', 4, 2)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (21, N'MCQ', N'Which of the following is used to define a class in C++?', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (22, N'MCQ', N'Which concept allows multiple functions with the same name but different parameters?', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (23, N'MCQ', N'What is encapsulation in Object-Oriented Programming?', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (24, N'MCQ', N'Which access specifier restricts access to within the same class only?', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (25, N'MCQ', N'Which function is called when an object is created?', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (26, N'TF', N'A destructor is called automatically when an object goes out of scope.', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (27, N'TF', N'Inheritance allows a class to use properties and methods of another class.', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (28, N'TF', N'Polymorphism allows objects to be treated as instances of their parent class.', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (29, N'TF', N'Abstraction focuses on hiding implementation details from the user.', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (30, N'TF', N'A class in C++ can have multiple constructors.', 5, 3)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (31, N'MCQ', N'What is React?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (32, N'MCQ', N'What is JSX?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (33, N'MCQ', N'What is the purpose of state in React?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (34, N'MCQ', N'What is the virtual DOM?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (35, N'MCQ', N'Which of the following are React hooks?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (36, N'MCQ', N'What is the purpose of useEffect in React?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (37, N'MCQ', N'What is the difference between props and state?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (38, N'MCQ', N'What is a React component?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (39, N'MCQ', N'What is the purpose of keys in React lists?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (40, N'MCQ', N'What is React Router used for?', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (41, N'TF', N'React is a backend framework.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (42, N'TF', N'JSX is mandatory for writing React components.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (43, N'TF', N'State in React is immutable.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (44, N'TF', N'The virtual DOM improves performance.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (45, N'TF', N'useState is a React hook.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (46, N'TF', N'useEffect runs after every render by default.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (47, N'TF', N'Props are used to pass data from parent to child components.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (48, N'TF', N'A functional component can have state.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (49, N'TF', N'React Router is used for state management.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (50, N'TF', N'Keys help React identify which items have changed in a list.', 5, 4)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (51, N'MCQ', N'What is the default value of a boolean in Java?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (52, N'MCQ', N'Which method is used to start a thread in Java?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (53, N'MCQ', N'What is a Java Virtual Machine?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (54, N'MCQ', N'What is the purpose of the final keyword in Java?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (55, N'MCQ', N'Which of the following are Java collections?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (56, N'MCQ', N'What is the purpose of the synchronized keyword in Java?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (57, N'MCQ', N'What is the difference between == and .equals() in Java?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (58, N'MCQ', N'What is the purpose of the static keyword in Java?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (59, N'MCQ', N'What is a lambda expression in Java?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (60, N'MCQ', N'What is the purpose of the try-catch block in Java?', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (61, N'TF', N'Java supports multiple inheritance using interfaces.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (62, N'TF', N'Java is platform-independent.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (63, N'TF', N'A final class cannot be subclassed.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (64, N'TF', N'The static keyword can be used with local variables.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (65, N'TF', N'Lambda expressions are only available in Java 8 and later.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (66, N'TF', N'The synchronized keyword is used for thread safety.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (67, N'TF', N'The == operator compares object references.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (68, N'TF', N'The .equals() method compares object contents.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (69, N'TF', N'A try-catch block is used for exception handling.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (70, N'TF', N'Java collections are thread-safe by default.', 5, 5)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (71, N'MCQ', N'What is the purpose of encapsulation in OOP?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (72, N'MCQ', N'Which of the following is an example of polymorphism in OOP?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (73, N'MCQ', N'In OOP, what does inheritance allow you to do?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (74, N'MCQ', N'What is the difference between an abstract class and an interface?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (75, N'MCQ', N'What is the purpose of the super keyword in Java?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (76, N'MCQ', N'Which of the following is NOT a feature of object-oriented programming?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (77, N'MCQ', N'What is the output of calling a method on an object reference that is null?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (78, N'MCQ', N'Which access modifier allows a class member to be accessible only within the same package?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (79, N'MCQ', N'What does method overloading refer to in OOP?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (80, N'MCQ', N'What is method overriding in Java?', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (81, N'TF', N'A constructor can be overridden in Java.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (82, N'TF', N'A class can implement multiple interfaces in Java.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (83, N'TF', N'In OOP, polymorphism allows different objects to respond to the same method in different ways.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (84, N'TF', N'An interface can have concrete methods in Java 8 and later.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (85, N'TF', N'Private methods can be inherited in Java.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (86, N'TF', N'A class can inherit from multiple classes in Java.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (87, N'TF', N'Encapsulation hides the internal state of an object and only exposes behavior.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (88, N'TF', N'In Java, a subclass can access private methods of its superclass.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (89, N'TF', N'Polymorphism is only achieved by inheritance in OOP.', 5, 6)
INSERT [dbo].[Question] ([q_id], [q_type], [text], [grade], [ex_id]) VALUES (90, N'TF', N'Abstract classes can be instantiated in Java.', 5, 6)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (1, N'Mohamed Youssef', N'mohamed.youssef@example.com', N'0123456789', 1, N'password1')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (2, N'Hanaa Ibrahim', N'hanaa.ibrahim@example.com', N'0123456790', 1, N'password2')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (3, N'Youssef Tamer', N'youssef.tamer@example.com', N'0123456791', 1, N'password3')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (4, N'Aya Samir', N'aya.samir@example.com', N'0123456792', 1, N'password4')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (5, N'Amr Adel', N'amr.adel@example.com', N'0123456793', 1, N'password5')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (6, N'Dina Salah', N'dina.salah@example.com', N'0123456794', 1, N'password6')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (7, N'Ali Mahmoud', N'ali.mahmoud@example.com', N'0123456795', 1, N'password7')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (8, N'Laila Ahmed', N'laila.ahmed@example.com', N'0123456796', 1, N'password8')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (9, N'Salem Gamal', N'salem.gamal@example.com', N'0123456797', 2, N'password9')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (10, N'Noura Hassan', N'noura.hassan@example.com', N'0123456798', 2, N'password10')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (11, N'Omar Elmasry', N'omar.elmasry@example.com', N'0123456799', 2, N'password11')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (12, N'Hend Elshahawy', N'hend.elshahawy@example.com', N'0123456800', 2, N'password12')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (13, N'Mahmoud Tarek', N'mahmoud.tarek@example.com', N'0123456801', 2, N'password13')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (14, N'Fatma Ali', N'fatma.ali@example.com', N'0123456802', 2, N'password14')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (15, N'Yara Hossam', N'yara.hossam@example.com', N'0123456803', 2, N'password15')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (16, N'Khaled Fathy', N'khaled.fathy@example.com', N'0123456804', 2, N'password16')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (17, N'Sarah Lotfy', N'sarah.lotfy@example.com', N'0123456805', 3, N'password17')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (18, N'Tamer Nabil', N'tamer.nabil@example.com', N'0123456806', 3, N'password18')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (19, N'Ramy Essam', N'ramy.essam@example.com', N'0123456807', 3, N'password19')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (20, N'Nesma Ibrahim', N'nesma.ibrahim@example.com', N'0123456808', 3, N'password20')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (21, N'Mohamed Adel', N'mohamed.adel@example.com', N'0123456809', 3, N'password21')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (22, N'Rana Sameh', N'rana.sameh@example.com', N'0123456810', 3, N'password22')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (23, N'Hossam Khaled', N'hossam.khaled@example.com', N'0123456811', 3, N'password23')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (24, N'Yasmine Salah', N'yasmine.salah@example.com', N'0123456812', 3, N'password24')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (25, N'Hisham Gamal', N'hisham.gamal@example.com', N'0123456813', 4, N'password25')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (26, N'Sally Mohamed', N'sally.mohamed@example.com', N'0123456814', 4, N'password26')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (27, N'Fady Anwar', N'fady.anwar@example.com', N'0123456815', 4, N'password27')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (28, N'Reem Ahmed', N'reem.ahmed@example.com', N'0123456816', 4, N'password28')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (29, N'Mina Samir', N'mina.samir@example.com', N'0123456817', 4, N'password29')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (30, N'Lama Hany', N'lama.hany@example.com', N'0123456818', 4, N'password30')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (31, N'Adham Hossam', N'adham.hossam@example.com', N'0123456819', 4, N'password31')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (32, N'Nada Fathy', N'nada.fathy@example.com', N'0123456820', 4, N'password32')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (33, N'Mostafa Sayed', N'mostafa.sayed@example.com', N'0123456821', 5, N'password33')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (34, N'Yasmin Hamed', N'yasmin.hamed@example.com', N'0123456822', 5, N'password34')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (35, N'Ahmed Sherif', N'ahmed.sherif@example.com', N'0123456823', 5, N'password35')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (36, N'Nourhan Salah', N'nourhan.salah@example.com', N'0123456824', 5, N'password36')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (37, N'Karim Atef', N'karim.atef@example.com', N'0123456825', 5, N'password37')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (38, N'Nada Khalil', N'nada.khalil@example.com', N'0123456826', 5, N'password38')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (39, N'Hassan Ramy', N'hassan.ramy@example.com', N'0123456827', 5, N'password39')
INSERT [dbo].[Student] ([st_id], [st_name], [st_email], [st_phoneNo], [track_id], [st_password]) VALUES (40, N'Rehab Samy', N'rehab.samy@example.com', N'0123456828', 5, N'password40')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 1, 1)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 2, 5)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 3, 10)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 4, 13)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 5, 17)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 6, 21)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 7, 23)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 8, 25)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 9, 28)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 10, 30)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 11, 31)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 12, 35)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 13, 40)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 14, 43)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 15, 47)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 16, 51)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 17, 54)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 18, 55)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 19, 58)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (1, 20, 59)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 1, 2)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 2, 5)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 3, 9)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 4, 14)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 5, 19)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 6, 21)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 7, 24)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 8, 26)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 9, 27)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 10, 29)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 11, 32)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 12, 35)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 13, 39)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 14, 44)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 15, 49)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 16, 51)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 17, 53)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 18, 56)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 19, 57)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (2, 20, 59)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 1, 1)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 2, 6)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 3, 9)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 4, 16)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 5, 18)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 6, 22)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 7, 23)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 8, 26)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 9, 28)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 10, 29)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 11, 31)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 12, 38)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 13, 39)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 14, 45)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 15, 47)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 16, 51)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 17, 54)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 18, 55)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 19, 57)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (3, 20, 60)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 1, 3)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 2, 5)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 3, 12)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 4, 13)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 5, 17)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 6, 21)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 7, 24)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 8, 25)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 9, 27)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 10, 30)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 11, 33)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 12, 35)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 13, 39)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 14, 46)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 15, 49)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 16, 52)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 17, 53)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 18, 55)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 19, 58)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (4, 20, 59)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 1, 1)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 2, 8)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 3, 9)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 4, 15)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 5, 19)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 6, 22)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 7, 23)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 8, 26)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 9, 27)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 10, 30)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 11, 31)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 12, 37)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 13, 42)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 14, 43)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 15, 48)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 16, 51)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 17, 54)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 18, 55)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 19, 57)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (5, 20, 59)
GO
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 1, 1)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 2, 5)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 3, 11)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 4, 13)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 5, 18)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 6, 21)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 7, 24)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 8, 26)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 9, 28)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 10, 29)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 11, 31)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 12, 35)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 13, 41)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 14, 43)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 15, 50)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 16, 52)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 17, 54)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 18, 56)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 19, 57)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (6, 20, 59)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 1, 4)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 2, 5)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 3, 9)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 4, 16)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 5, 20)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 6, 22)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 7, 23)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 8, 25)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 9, 28)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 10, 30)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 11, 34)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 12, 36)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 13, 39)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 14, 43)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 15, 48)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 16, 51)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 17, 53)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 18, 55)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 19, 58)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (7, 20, 59)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 1, 1)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 2, 7)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 3, 9)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 4, 13)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 5, 17)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 6, 22)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 7, 23)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 8, 26)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 9, 27)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 10, 29)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 11, 31)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 12, 35)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 13, 40)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 14, 44)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 15, 47)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 16, 52)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 17, 54)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 18, 55)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 19, 58)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (8, 20, 60)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 21, 61)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 22, 65)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 23, 69)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 24, 74)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 25, 77)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 26, 81)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 27, 83)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 28, 86)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 29, 87)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (17, 30, 89)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 21, 63)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 22, 66)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 23, 70)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 24, 73)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 25, 77)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 26, 81)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 27, 84)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 28, 85)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 29, 88)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (18, 30, 90)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 21, 61)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 22, 65)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 23, 72)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 24, 73)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 25, 80)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 26, 82)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 27, 84)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 28, 86)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 29, 87)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (19, 30, 90)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 21, 62)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 22, 67)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 23, 69)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 24, 75)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 25, 77)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 26, 82)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 27, 84)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 28, 86)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 29, 87)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (20, 30, 89)
GO
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 21, 64)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 22, 65)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 23, 71)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 24, 73)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 25, 79)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 26, 81)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 27, 83)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 28, 85)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 29, 88)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (21, 30, 89)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 21, 61)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 22, 65)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 23, 69)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 24, 73)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 25, 77)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 26, 82)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 27, 84)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 28, 85)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 29, 87)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (22, 30, 89)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 21, 62)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 22, 68)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 23, 70)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 24, 76)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 25, 77)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 26, 81)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 27, 84)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 28, 86)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 29, 88)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (23, 30, 90)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 21, 63)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 22, 65)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 23, 69)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 24, 73)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 25, 77)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 26, 81)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 27, 84)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 28, 86)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 29, 87)
INSERT [dbo].[Student_Answer] ([st_id], [q_id], [op_id]) VALUES (24, 30, 89)
GO
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (1, 1)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (1, 2)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (2, 1)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (2, 2)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (3, 1)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (3, 2)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (4, 1)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (4, 2)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (5, 1)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (5, 2)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (6, 1)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (6, 2)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (7, 1)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (7, 2)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (8, 1)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (8, 2)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (17, 3)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (18, 3)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (19, 3)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (20, 3)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (21, 3)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (22, 3)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (23, 3)
INSERT [dbo].[Student_Exam_Attempt] ([st_id], [ex_id]) VALUES (24, 3)
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (1, N'Encapsulation', 1)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (2, N'Polymorphism', 1)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (3, N'Inheritance', 1)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (4, N'Abstraction', 1)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (5, N'SQL Basics', 2)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (6, N'Database Normalization', 3)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (7, N'Flutter Widgets', 5)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (8, N'React Components', 6)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (9, N'Node.js Modules', 7)
INSERT [dbo].[Topic] ([topic_id], [topic_name], [co_id]) VALUES (10, N'Java Threads', 9)
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET IDENTITY_INSERT [dbo].[Track] ON 

INSERT [dbo].[Track] ([track_id], [track_name]) VALUES (1, N'Mobile Development(Cross-Platforms)')
INSERT [dbo].[Track] ([track_id], [track_name]) VALUES (2, N'Android Mobile Development')
INSERT [dbo].[Track] ([track_id], [track_name]) VALUES (3, N'Web Development (Full-Stack)')
INSERT [dbo].[Track] ([track_id], [track_name]) VALUES (4, N'MERN')
INSERT [dbo].[Track] ([track_id], [track_name]) VALUES (5, N'Java')
SET IDENTITY_INSERT [dbo].[Track] OFF
GO
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (1, 1)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (1, 2)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (1, 3)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (1, 4)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (1, 5)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (2, 1)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (2, 2)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (2, 3)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (3, 3)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (3, 4)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (4, 1)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (4, 2)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (5, 1)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (5, 2)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (6, 3)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (6, 4)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (7, 4)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (8, 5)
INSERT [dbo].[Track_Course] ([co_id], [track_id]) VALUES (9, 5)
GO
ALTER TABLE [dbo].[Course_Exam]  WITH CHECK ADD FOREIGN KEY([co_id])
REFERENCES [dbo].[Course] ([co_id])
GO
ALTER TABLE [dbo].[Course_Exam]  WITH CHECK ADD FOREIGN KEY([ex_id])
REFERENCES [dbo].[Exam] ([ex_id])
GO
ALTER TABLE [dbo].[Course_Exam]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[Instructor_Course]  WITH CHECK ADD FOREIGN KEY([co_id])
REFERENCES [dbo].[Course] ([co_id])
GO
ALTER TABLE [dbo].[Instructor_Course]  WITH CHECK ADD FOREIGN KEY([ins_id])
REFERENCES [dbo].[Instructor] ([ins_id])
GO
ALTER TABLE [dbo].[Instructor_Track]  WITH CHECK ADD FOREIGN KEY([ins_id])
REFERENCES [dbo].[Instructor] ([ins_id])
GO
ALTER TABLE [dbo].[Instructor_Track]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD FOREIGN KEY([q_id])
REFERENCES [dbo].[Question] ([q_id])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([ex_id])
REFERENCES [dbo].[Exam] ([ex_id])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD FOREIGN KEY([op_id])
REFERENCES [dbo].[Option] ([op_id])
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[Student] ([st_id])
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD FOREIGN KEY([q_id])
REFERENCES [dbo].[Question] ([q_id])
GO
ALTER TABLE [dbo].[Student_Exam_Attempt]  WITH CHECK ADD FOREIGN KEY([ex_id])
REFERENCES [dbo].[Exam] ([ex_id])
GO
ALTER TABLE [dbo].[Student_Exam_Attempt]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[Student] ([st_id])
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD FOREIGN KEY([co_id])
REFERENCES [dbo].[Course] ([co_id])
GO
ALTER TABLE [dbo].[Track_Course]  WITH CHECK ADD FOREIGN KEY([co_id])
REFERENCES [dbo].[Course] ([co_id])
GO
ALTER TABLE [dbo].[Track_Course]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Track] ([track_id])
GO
USE [master]
GO
ALTER DATABASE [ExaminationSystem] SET  READ_WRITE 
GO
