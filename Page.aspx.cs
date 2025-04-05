using System;
using System.Web.UI;

namespace ChurchPratice

{
    public partial class HomePage : Page // Renamed from Page to HomePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any server-side logic can be handled here if needed
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Page.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
