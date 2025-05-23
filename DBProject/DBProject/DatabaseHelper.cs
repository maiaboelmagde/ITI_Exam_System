﻿using Microsoft.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using System;

namespace InstructorPart
{
    internal class DatabaseHelper
    {
        string connectionString = "Server=localhost\\SQLEXPRESS;Database=ExaminationSystem;Integrated Security=True;TrustServerCertificate=True;"; public DataTable GetExamName(int examId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT C.co_name AS examName FROM Course C JOIN Course_Exam CE ON C.co_id = CE.co_id WHERE CE.ex_id = @ExamId;", conn);
                cmd.Parameters.AddWithValue("@ExamId", examId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable GetStudentCorrectAnswers(int examId)
        {
            DataTable dt = new DataTable();
            string query = @"

            WITH Grade AS (
                SELECT 
                    s.st_id,
                    s.st_name,
                    q.q_id,
                    CASE 
                        WHEN NOT EXISTS (
                            -- Ensure all correct options for the question are selected
                            SELECT 1
                            FROM [Option] o2
                            LEFT JOIN Student_Answer sa2 
                                ON o2.op_id = sa2.op_id AND sa2.st_id = s.st_id
                            WHERE o2.q_id = q.q_id
                            AND o2.is_correct = 1
                            AND sa2.op_id IS NULL
                        )
                        AND NOT EXISTS (
                            -- Ensure no incorrect options were selected
                            SELECT 1
                            FROM Student_Answer sa3
                            JOIN [Option] o3 ON sa3.op_id = o3.op_id
                            WHERE sa3.q_id = q.q_id
                            AND sa3.st_id = s.st_id
                            AND o3.is_correct = 0
                        )
                    THEN q.grade ELSE 0 
                    END AS EarnedGrade
                FROM Student s
                JOIN Student_Exam_Attempt sea ON s.st_id = sea.st_id
                CROSS JOIN (SELECT DISTINCT q_id, grade FROM Question WHERE ex_id = @examId) q
                LEFT JOIN Student_Answer sa 
                    ON s.st_id = sa.st_id 
                    AND sa.q_id = q.q_id
                WHERE sea.ex_id = @examId
            )

            SELECT 
                s.st_name AS StudentName,
                COALESCE(SUM(ca.EarnedGrade), 0) AS TotalGrade
            FROM Student s
            JOIN Student_Exam_Attempt sea ON s.st_id = sea.st_id 
            LEFT JOIN Grade ca ON s.st_id = ca.st_id
            WHERE sea.ex_id = @examId
            GROUP BY s.st_name
            ORDER BY TotalGrade DESC;"
            ;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@examId", examId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                catch (Exception ex)
                {
                    CustomMessageBox customMessageBox = new CustomMessageBox(
$"Error fetching student correct answers: \" + ex.Message", // Message
"Error", // Title
MessageBoxIcon.Warning // Icon
);
                    customMessageBox.ShowDialog();
                    //MessageBox.Show("Error fetching student correct answers: " + ex.Message);
                }
            }

            return dt;
        }

        public DataTable GetQuestions(int examId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Question WHERE ex_id = @ExamId", conn);
                cmd.Parameters.AddWithValue("@ExamId", examId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable GetOptions(int questionId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Option] WHERE q_id = @QuestionId", conn);
                cmd.Parameters.AddWithValue("@QuestionId", questionId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public string GetCourseName(int examId)
        {
            string courseName = null;
            string query = @"
        SELECT C.co_name AS CourseName
        FROM Course C
        JOIN Course_Exam E ON C.co_id = E.co_id
        WHERE E.ex_id = @ExamId;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ExamId", examId);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        courseName = reader["CourseName"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    //  MessageBox.Show("Error fetching course name: " + ex.Message);
                    CustomMessageBox customMessageBox = new CustomMessageBox(
$"Error fetching course name: \" + ex.Message", // Message
"Error", // Title
MessageBoxIcon.Warning // Icon
);
                    customMessageBox.ShowDialog();
                }
            }

            return courseName;
        }

    }
}