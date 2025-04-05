using System;
using System.Web.UI;

public partial class logout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Clear session
        Session.Abandon();
        Session.Clear();

        // Redirect to Register.aspx after logout
        Response.Redirect("Register.aspx");
    }
}
