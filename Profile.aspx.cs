using System;
using System.IO;
using System.Web.UI.WebControls;

namespace ChurchPractice
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileData();
                pnlView.Visible = true;
                pnlEdit.Visible = false;
            }
        }

        private void LoadProfileData()
        {
            // Load Session values or default if not set
            lblViewFullName.Text = Session["FullName"] != null ? Session["FullName"].ToString() : "Juan Dela Cruz";
            lblViewEmail.Text = Session["Email"] != null ? Session["Email"].ToString() : "juan@example.com";
            lblViewPhone.Text = Session["Phone"] != null ? Session["Phone"].ToString() : "0917-123-4567";
            lblViewBio.Text = Session["Bio"] != null ? Session["Bio"].ToString() : "I love serving the church community and connecting with people.";
            lblViewHobbies.Text = Session["Hobbies"] != null ? Session["Hobbies"].ToString() : "Reading, Gardening, Volunteering";
            imgViewProfile.ImageUrl = Session["ProfileImage"] != null ? Session["ProfileImage"].ToString() : "~/images/default-profile.png";

            // Also update the editable fields for edit mode
            txtFullName.Text = lblViewFullName.Text;
            txtEmail.Text = lblViewEmail.Text;
            txtPhone.Text = lblViewPhone.Text;
            txtBio.Text = lblViewBio.Text;
            txtHobbies.Text = lblViewHobbies.Text;
            txtPassword.Attributes["value"] = "password123"; // Simulated password
            imgProfile.ImageUrl = imgViewProfile.ImageUrl;
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            pnlView.Visible = false;
            pnlEdit.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadProfileData();
            pnlEdit.Visible = false;
            pnlView.Visible = true;
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            // Save input values to session
            Session["FullName"] = txtFullName.Text;
            Session["Email"] = txtEmail.Text;
            Session["Phone"] = txtPhone.Text;
            Session["Bio"] = txtBio.Text;
            Session["Hobbies"] = txtHobbies.Text;

            // Update Viewer Mode Labels immediately
            lblViewFullName.Text = txtFullName.Text;
            lblViewEmail.Text = txtEmail.Text;
            lblViewPhone.Text = txtPhone.Text;
            lblViewBio.Text = txtBio.Text;
            lblViewHobbies.Text = txtHobbies.Text;

            // Handle image upload
            if (FileUploadProfile.HasFile)
            {
                string fileName = Path.GetFileName(FileUploadProfile.FileName);
                string savePath = Server.MapPath("~/images/" + fileName);
                FileUploadProfile.SaveAs(savePath);
                string relativePath = "~/images/" + fileName;

                Session["ProfileImage"] = relativePath;

                imgProfile.ImageUrl = relativePath;       // Update Edit View image
                imgViewProfile.ImageUrl = relativePath;   // Update Viewer image
            }

            // Return to viewer mode
            pnlEdit.Visible = false;
            pnlView.Visible = true;
        }
    }
}
