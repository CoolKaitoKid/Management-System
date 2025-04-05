using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace ChurchManagementSystem
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = ""; // Clear any previous messages
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // ✅ Ensure email contains "@"
            if (!email.Contains("@") || !Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblMessage.Text = "❌ Invalid email format! Please include '@' and a valid domain.";
                return;
            }

            // ✅ Ensure passwords match
            if (password != confirmPassword)
            {
                lblMessage.Text = "❌ Passwords do not match!";
                return;
            }

            // ✅ Store user credentials in Session (For demonstration)
            Session["RegisteredEmail"] = email;
            Session["RegisteredPassword"] = password;

            lblMessage.Text = "✅ Registration successful! You can now log in.";
            Response.Redirect("LogIn.aspx");
        }
    }
}
