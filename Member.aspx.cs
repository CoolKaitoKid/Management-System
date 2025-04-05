using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace ChurchManagement
{
    public partial class Member : System.Web.UI.Page
    {
        private class MemberInfo
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string MiddleName { get; set; }
        }

        private List<MemberInfo> GetAllMembers()
        {
            return new List<MemberInfo>
            {
                new MemberInfo { FirstName = "Joseph", LastName = "Martinez", MiddleName = "" },
                new MemberInfo { FirstName = "Antonio", LastName = "Ramirez", MiddleName = "" },
                new MemberInfo { FirstName = "Miguel", LastName = "Santos", MiddleName = "" },
                new MemberInfo { FirstName = "Gabriel", LastName = "Mendoza", MiddleName = "" },
                new MemberInfo { FirstName = "Elena", LastName = "Ramos", MiddleName = "" },
                new MemberInfo { FirstName = "Diego", LastName = "Bautista", MiddleName = "" },
                new MemberInfo { FirstName = "Juan", LastName = "Dela Cruz", MiddleName = "" },
                new MemberInfo { FirstName = "Ana", LastName = "Reyes", MiddleName = "" },
                new MemberInfo { FirstName = "Maria", LastName = "Lopez", MiddleName = "" },
                new MemberInfo { FirstName = "John", LastName = "Abellana", MiddleName = "Paul" },
                new MemberInfo { FirstName = "Mark", LastName = "Villarin", MiddleName = "Steven" },
                new MemberInfo { FirstName = "James", LastName = "Lauron", MiddleName = "Benedict" },
                new MemberInfo { FirstName = "Maria", LastName = "Dela Peña", MiddleName = "Lourdes" },
                new MemberInfo { FirstName = "Teresa", LastName = "Almonte", MiddleName = "Carmela" },
                new MemberInfo { FirstName = "Angela", LastName = "Dumlao", MiddleName = "Rosario" },
                new MemberInfo { FirstName = "Faith", LastName = "Castillo", MiddleName = "" },
                new MemberInfo { FirstName = "Cesar", LastName = "De Leon", MiddleName = "" },
                new MemberInfo { FirstName = "Ronald", LastName = "Lim", MiddleName = "" }
            };
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowSection("priests");
            }
        }

        private void ShowSection(string section)
        {
            var allMembers = GetAllMembers();
            litAllContent.Text = "";
            gvMembers.Visible = true;

            switch (section)
            {
                case "all":
                    litAllContent.Text = "<h3>All Lists</h3>" + string.Join("", allMembers.Select(m => $"<p>{m.FirstName} {m.MiddleName} {m.LastName}</p>"));
                    gvMembers.Visible = false;
                    break;
                case "priests":
                    gvMembers.DataSource = allMembers.Where(m => new[] { "Joseph", "Antonio", "Miguel" }.Contains(m.FirstName)).ToList();
                    break;
                case "choirs":
                    gvMembers.DataSource = allMembers.Where(m => new[] { "Gabriel", "Elena", "Diego" }.Contains(m.FirstName)).ToList();
                    break;
                case "youth":
                    gvMembers.DataSource = allMembers.Where(m => new[] { "Juan", "Ana", "Maria" }.Contains(m.FirstName)).ToList();
                    break;
                case "acolytes":
                    gvMembers.DataSource = allMembers.Where(m => new[] { "John", "Mark", "James" }.Contains(m.FirstName)).ToList();
                    break;
                case "nuns":
                    gvMembers.DataSource = allMembers.Where(m => new[] { "Maria", "Teresa", "Angela" }.Contains(m.FirstName)).ToList();
                    break;
                case "donors":
                    gvMembers.DataSource = allMembers.Where(m => new[] { "Faith", "Cesar", "Ronald" }.Contains(m.FirstName)).ToList();
                    break;
            }

            gvMembers.DataBind();
        }

        protected void btnAll_Click(object sender, EventArgs e) => ShowSection("all");
        protected void btnPriests_Click(object sender, EventArgs e) => ShowSection("priests");
        protected void btnChoirs_Click(object sender, EventArgs e) => ShowSection("choirs");
        protected void btnYouth_Click(object sender, EventArgs e) => ShowSection("youth");
        protected void btnAcolytes_Click(object sender, EventArgs e) => ShowSection("acolytes");
        protected void btnNuns_Click(object sender, EventArgs e) => ShowSection("nuns");
        protected void btnDonors_Click(object sender, EventArgs e) => ShowSection("donors");

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var searchValue = txtSearch.Text.Trim().ToLower();
            var allMembers = GetAllMembers();
            var result = allMembers.Where(m =>
                m.FirstName.ToLower().Contains(searchValue) ||
                m.LastName.ToLower().Contains(searchValue) ||
                m.MiddleName.ToLower().Contains(searchValue)).ToList();

            if (result.Any())
            {
                gvMembers.DataSource = result;
                gvMembers.DataBind();
                gvMembers.Visible = true;
                litAllContent.Text = "";
            }
            else
            {
                gvMembers.DataSource = null;
                gvMembers.DataBind();
                gvMembers.Visible = false;
                litAllContent.Text = "<p>No members found.</p>";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }
    }
}