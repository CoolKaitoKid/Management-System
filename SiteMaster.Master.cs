using System;
using System.Web.UI;

namespace ChurchManagementSystem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["RegisteredEmail"] != null)
                {
                    lblUserName.Text = "Welcome, " + Session["RegisteredEmail"].ToString();
                }
                else
                {
                    lblUserName.Text = "Welcome, Guest!";
                    Response.Redirect("LogIn.aspx"); // Redirects to login if no user is logged in
                }
            }
        }
    }
}
