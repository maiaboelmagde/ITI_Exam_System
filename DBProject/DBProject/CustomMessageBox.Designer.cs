﻿//using Microsoft.VisualBasic.Devices;

//partial class CustomMessageBox
//{
//    private System.ComponentModel.IContainer components = null;
//    private System.Windows.Forms.Label lblMessage;
//    private System.Windows.Forms.PictureBox pictureBoxIcon;
//    private System.Windows.Forms.Button btnOK;

//    protected override void Dispose(bool disposing)
//    {
//        if (disposing && (components != null))
//        {
//            components.Dispose();
//        }
//        base.Dispose(disposing);
//    }
//    private Size baseFormSize = new Size(650, 350); // Initialize baseFormSize with the initial form size

//    private void InitializeComponent()
//    {
//        this.lblMessage = new System.Windows.Forms.Label();
//        this.pictureBoxIcon = new System.Windows.Forms.PictureBox();
//        this.btnOK = new System.Windows.Forms.Button();
//        ((System.ComponentModel.ISupportInitialize)(this.pictureBoxIcon)).BeginInit();
//        this.SuspendLayout();

//        // lblMessage
//        this.lblMessage.AutoSize = false;
//        this.lblMessage.Font = new System.Drawing.Font("Courier New", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0);
//        this.lblMessage.Name = "lblMessage";
//        //this.lblMessage.Size = new System.Drawing.Size(0, 21);
//        this.lblMessage.TabIndex = 0;
//        this.lblMessage.FlatStyle = FlatStyle.Flat;
//        Size textSize = TextRenderer.MeasureText(lblMessage.Text, new Font("Courier New", 12, FontStyle.Regular));

//        int factor = textSize.Width / 400;
//        int optionHeight = (factor >= 1) ? 40 * (factor + 1) : 40; // Adjust height if text is long
//        this.lblMessage.Size = new System.Drawing.Size(450, optionHeight+50);
//        this.lblMessage.Location = new System.Drawing.Point(200, 90);

//        // pictureBoxIcon
//        this.pictureBoxIcon.Location = new System.Drawing.Point(20, 30);
//        this.pictureBoxIcon.Name = "pictureBoxIcon";
//        this.pictureBoxIcon.Size = new System.Drawing.Size(60, 60);
//        this.pictureBoxIcon.TabIndex = 1;
//        this.pictureBoxIcon.TabStop = false;
//        pictureBoxIcon.SizeMode = PictureBoxSizeMode.StretchImage;

//        // btnOK 
//        ///
//        ///  Button courseButton = new Button
//        //{
//        //    Text = course.CourseName,
//        //            Location = new Point(x, y),
//        //            Size = new Size(buttonWidth, buttonHeight),
//        //            Font = new Font("Courier New", 12, FontStyle.Regular, GraphicsUnit.Point, 0),
//        //            BackColor = Color.Teal,
//        //            ForeColor = Color.White,
//        //            FlatStyle = FlatStyle.Flat
//        //        };
//        ///
//        this.btnOK.Location = new System.Drawing.Point(120, 80);
//        this.btnOK.Name = "btnOK";
//        this.btnOK.Font = new Font("Courier New", 13F, FontStyle.Bold, GraphicsUnit.Point, 0);
//        this.btnOK.Size = new System.Drawing.Size(100, 50);
//        this.btnOK.TabIndex = 2;
//        this.btnOK.BackColor = Color.Teal;
//        this.btnOK.ForeColor = Color.White;
//        this.btnOK.FlatStyle = FlatStyle.Flat;

//        this.btnOK.Text = "OK";
//        this.btnOK.Click += new System.EventHandler(this.btnOK_Click);

//        // CustomMessageBox
//        this.ClientSize = new System.Drawing.Size(300, 120);
//        this.Controls.Add(this.btnOK);
//        this.Controls.Add(this.pictureBoxIcon);
//        this.Controls.Add(this.lblMessage);
//        this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
//        this.MaximizeBox = false;
//        this.MinimizeBox = false;
//        this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
//        this.Text = "CustomMessageBox";
//        ((System.ComponentModel.ISupportInitialize)(this.pictureBoxIcon)).EndInit();
//        this.ResumeLayout(false);
//        this.PerformLayout();
//        // Form1
//        AllowDrop = true;
//        AutoScaleDimensions = new SizeF(10F, 25F);
//        AutoScaleMode = AutoScaleMode.None; // Disable auto-scaling
//        ClientSize = baseFormSize; // Set initial form size
//        //Controls.Add(label2);
//        //Controls.Add(label1);
//        Name = "Form1";
//        Text = "Student Test";
//        //Load += Form1_Load;     
//        MaximizeBox = false;
//        MinimizeBox = false;
//        StartPosition = FormStartPosition.CenterScreen;
//        this.FormBorderStyle = FormBorderStyle.FixedDialog;

//        //     Resize += Form1_Resize; // Add Resize event handler
//        ResumeLayout(false);
//        PerformLayout();
//    }

//    private void CustomMessageBox_Load(object sender, EventArgs e)
//    {
//       CenterControls(); // Center the controls when the form loads
//    }

//    private void CenterControls()
//    {
//        // Center the PictureBox horizontally
//        pictureBoxIcon.Location = new Point((this.ClientSize.Width - pictureBoxIcon.Width) / 5, this.ClientSize.Height/3);

//        // Center the Label horizontally below the PictureBox
//        lblMessage.Location = new Point((this.ClientSize.Width - lblMessage.Width) / 3, this.ClientSize.Height / 3-20);

//        // Center the Button horizontally below the Label
//        btnOK.Location = new Point((this.ClientSize.Width - btnOK.Width) / 2, lblMessage.Bottom + 150);
//    }
//}

partial class CustomMessageBox
{
    private System.ComponentModel.IContainer components = null;
    private System.Windows.Forms.Label lblMessage;
    private System.Windows.Forms.PictureBox pictureBoxIcon;
    private System.Windows.Forms.Button btnOK;

    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    private void InitializeComponent()
    {
        this.lblMessage = new System.Windows.Forms.Label();
        this.pictureBoxIcon = new System.Windows.Forms.PictureBox();
        this.btnOK = new System.Windows.Forms.Button();
        ((System.ComponentModel.ISupportInitialize)(this.pictureBoxIcon)).BeginInit();
        this.SuspendLayout();

        // lblMessage
        this.lblMessage.AutoSize = false;
        this.lblMessage.Font = new System.Drawing.Font("Courier New", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0);
        this.lblMessage.Name = "lblMessage";
        this.lblMessage.TabIndex = 0;
        this.lblMessage.FlatStyle = FlatStyle.Flat;
        this.lblMessage.TextAlign = ContentAlignment.MiddleCenter;
        Size textSize = TextRenderer.MeasureText(lblMessage.Text, new Font("Courier New", 13, FontStyle.Bold));

        int factor = textSize.Width / 430;
        int optionHeight = (factor >= 1) ? 40 * (factor + 1) : 40; // Adjust height if text is long
        this.lblMessage.Size = new System.Drawing.Size(430, optionHeight+70); // Adjust size as needed
        this.lblMessage.Location = new System.Drawing.Point(200, 115);

        // pictureBoxIcon
        this.pictureBoxIcon.Location = new System.Drawing.Point(20, 30);
        this.pictureBoxIcon.Name = "pictureBoxIcon";
        this.pictureBoxIcon.Size = new System.Drawing.Size(60, 60);
        this.pictureBoxIcon.TabIndex = 1;
        this.pictureBoxIcon.TabStop = false;
        this.pictureBoxIcon.SizeMode = PictureBoxSizeMode.StretchImage;

        // btnOK
        this.btnOK.Location = new System.Drawing.Point(250, 200);
        this.btnOK.Name = "btnOK";
        this.btnOK.Font = new Font("Courier New", 13F, FontStyle.Bold, GraphicsUnit.Point, 0);
        this.btnOK.Size = new System.Drawing.Size(100, 50);
        this.btnOK.TabIndex = 2;
        this.btnOK.BackColor = Color.Teal;
        this.btnOK.ForeColor = Color.White;
        this.btnOK.FlatStyle = FlatStyle.Flat;
        this.btnOK.Text = "OK";
        this.btnOK.Click += new System.EventHandler(this.btnOK_Click);

        // CustomMessageBox
        this.ClientSize = new System.Drawing.Size(650, 350);
        this.Controls.Add(this.btnOK);
        this.Controls.Add(this.pictureBoxIcon);
        this.Controls.Add(this.lblMessage);
        this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
        this.MaximizeBox = false;
        this.MinimizeBox = false;
        this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
        this.Text = "CustomMessageBox";
        this.Load += new System.EventHandler(this.CustomMessageBox_Load);
        ((System.ComponentModel.ISupportInitialize)(this.pictureBoxIcon)).EndInit();
        this.ResumeLayout(false);
        this.PerformLayout();
    }

    private void CustomMessageBox_Load(object sender, EventArgs e)
    {
        CenterControls(); // Center the controls when the form loads
    }

    private void CenterControls()
    {
        // Center the PictureBox horizontally
        pictureBoxIcon.Location = new Point((this.ClientSize.Width - pictureBoxIcon.Width) / 5, this.ClientSize.Height / 3);

        // Center the Label horizontally below the PictureBox
       lblMessage.Location = new Point((this.ClientSize.Width - lblMessage.Width) / 3+ (this.ClientSize.Width - pictureBoxIcon.Width) / 5, this.ClientSize.Height / 3 - 20);

        // Center the Button horizontally below the Label
        btnOK.Location = new Point((this.ClientSize.Width - btnOK.Width) / 2, lblMessage.Bottom + 50);
    }

    //private void btnOK_Click(object sender, EventArgs e)
    //{
    //    this.Close(); // Close the message box when OK is clicked
    //}
}
