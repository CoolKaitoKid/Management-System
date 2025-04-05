using System;
using System.Web;
using System.Web.UI;

namespace ChurchManagementSystem
{
    public partial class History : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: Check if user is logged in
                if (Session["LoggedInUser"] == null)
                {
                    Response.Redirect("History.aspx"); // Redirect guest users to login page
                    Context.ApplicationInstance.CompleteRequest();
                }

                // Any additional logic for page load
            }
        }
    }
}
