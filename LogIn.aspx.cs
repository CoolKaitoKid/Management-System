using System;
using System.Drawing; // Required for setting label color
using System.Text.RegularExpressions;
using System.Web.UI;

namespace ChurchPractcice

{
    public partial class LogIn : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblError.Text = ""; // Clears previous error messages
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // ✅ Ensure email and password fields are not empty
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowError("❌ Please enter both email and password!");
                return;
            }

            // ✅ Ensure email contains "@" and follows a valid format
            if (!email.Contains("@") || !Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                ShowError("❌ Invalid email format! Please include '@' and a valid domain.");
                return;
            }

            // ✅ Check if user credentials exist in Session
            if (Session["RegisteredEmail"] == null || Session["RegisteredPassword"] == null)
            {
                ShowError("❌ No registered users found! Please register first.");
                return;
            }

            string registeredEmail = Session["RegisteredEmail"].ToString();
            string registeredPassword = Session["RegisteredPassword"].ToString();

            // ✅ Validate user login credentials
            if (email == registeredEmail && password == registeredPassword)
            {
                ShowSuccess("✅ Login successful! Redirecting...");
                Session["UserEmail"] = email;
                Response.Redirect("Dashboard.aspx"); // Redirect to Dashboard after login
            }
            else
            {
                ShowError("❌ Invalid email or password!");
            }
        }

        private void ShowError(string message)
        {
            lblError.Text = message;
            lblError.ForeColor = Color.Red;
        }

        private void ShowSuccess(string message)
        {
            lblError.Text = message;
            lblError.ForeColor = Color.Green;
        }
    }
}
