using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace ChurchPractice
{
    public partial class Forgot : Page
    {
        private static string verificationCode;
        private static string userEmail;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            userEmail = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(userEmail))
            {
                lblMessage.Text = "Please enter your email address.";
                return;
            }

            // Generate a 6-digit verification code
            Random random = new Random();
            verificationCode = random.Next(100000, 999999).ToString();

            // Send the code to the user's email
            bool emailSent = SendVerificationEmail(userEmail, verificationCode);

            if (emailSent)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "A verification code has been sent to your email.";
                txtEmail.Enabled = false;
                btnReset.Visible = false;
                divVerification.Visible = true;
            }
            else
            {
                lblMessage.Text = "Failed to send email. Please try again.";
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string enteredCode = txtVerificationCode.Text.Trim();

            if (enteredCode == verificationCode)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Verification successful. Please enter a new password.";
                divVerification.Visible = false;
                divResetPassword.Visible = true;
            }
            else
            {
                lblMessage.Text = "Invalid verification code. Please try again.";
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.Text = "Please enter your new password.";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match. Try again.";
                return;
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Password successfully changed! You can now log in.";

            divResetPassword.Visible = false;
        }

        private bool SendVerificationEmail(string email, string code)
        {
            try
            {
                string smtpServer = "smtp.gmail.com";
                int smtpPort = 587;
                string smtpUser = "princess.a.petancio@gmail.com"; // Your email
                string smtpPass = "iekv yefm bdpj agqs"; // Replace with App Password

                MailMessage mail = new MailMessage
                {
                    From = new MailAddress(smtpUser),
                    Subject = "Password Reset Verification Code",
                    Body = $"Your password reset verification code is: {code}",
                    IsBodyHtml = false
                };

                mail.To.Add(email);

                SmtpClient smtp = new SmtpClient(smtpServer, smtpPort)
                {
                    Credentials = new NetworkCredential(smtpUser, smtpPass),
                    EnableSsl = true
                };

                smtp.Send(mail);
                return true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                return false;
            }
        }
    }
}
