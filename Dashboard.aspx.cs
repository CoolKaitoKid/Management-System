using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace ChurchManagementSystem
{
    public partial class Dashboard : Page
    {
        // Connection string - update with your actual database details
        private string connectionString = "Data Source=YOUR_SERVER;Initial Catalog=ChurchDB;User ID=YOUR_USER;Password=YOUR_PASSWORD";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in
                if (Session["Username"] == null)
                {
                    Response.Redirect("Dashboard.aspx"); // Redirect to login if not authenticated
                }

                // Load dashboard data
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Total Members
                    string memberQuery = "SELECT COUNT(*) FROM Members";
                    using (SqlCommand cmd = new SqlCommand(memberQuery, conn))
                    {
                        int totalMembers = (int)cmd.ExecuteScalar();
                        lblTotalMembers.Text = totalMembers.ToString();
                        lblMembersUpdate.Text = "Updated: " + DateTime.Now.ToString("t"); // e.g., "3:45 PM"
                    }

                    // Weekly Attendance (example: latest service)
                    string attendanceQuery = "SELECT TOP 1 AttendanceCount, ServiceDate FROM Attendance ORDER BY ServiceDate DESC";
                    using (SqlCommand cmd = new SqlCommand(attendanceQuery, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lblWeeklyAttendance.Text = reader["AttendanceCount"].ToString();
                                lblLastService.Text = "Last Service: " + Convert.ToDateTime(reader["ServiceDate"]).ToString("MMM dd");
                            }
                        }
                    }

                    // Monthly Donations (example: current month)
                    string donationQuery = "SELECT SUM(Amount) FROM Donations WHERE MONTH(DonationDate) = MONTH(GETDATE()) AND YEAR(DonationDate) = YEAR(GETDATE())";
                    using (SqlCommand cmd = new SqlCommand(donationQuery, conn))
                    {
                        object result = cmd.ExecuteScalar();
                        decimal totalDonations = result != DBNull.Value ? Convert.ToDecimal(result) : 0;
                        lblMonthlyDonations.Text = "₱" + totalDonations.ToString("N2");

                        // Calculate increase from last month
                        string lastMonthQuery = "SELECT SUM(Amount) FROM Donations WHERE MONTH(DonationDate) = MONTH(DATEADD(MONTH, -1, GETDATE())) AND YEAR(DonationDate) = YEAR(DATEADD(MONTH, -1, GETDATE()))";
                        using (SqlCommand lastCmd = new SqlCommand(lastMonthQuery, conn))
                        {
                            object lastResult = lastCmd.ExecuteScalar();
                            decimal lastMonthDonations = lastResult != DBNull.Value ? Convert.ToDecimal(lastResult) : 0;
                            if (lastMonthDonations > 0)
                            {
                                decimal increase = ((totalDonations - lastMonthDonations) / lastMonthDonations) * 100;
                                lblDonationIncrease.Text = (increase >= 0 ? "+" : "") + increase.ToString("N0") + "%";
                            }
                            else
                            {
                                lblDonationIncrease.Text = "N/A";
                            }
                        }
                    }

                    // Active Volunteers
                    string volunteerQuery = "SELECT COUNT(*) FROM Volunteers WHERE IsActive = 1";
                    using (SqlCommand cmd = new SqlCommand(volunteerQuery, conn))
                    {
                        int activeVolunteers = (int)cmd.ExecuteScalar();
                        lblActiveVolunteers.Text = activeVolunteers.ToString();

                        // New volunteers this week
                        string newVolunteerQuery = "SELECT COUNT(*) FROM Volunteers WHERE JoinDate >= DATEADD(WEEK, -1, GETDATE()) AND IsActive = 1";
                        using (SqlCommand newCmd = new SqlCommand(newVolunteerQuery, conn))
                        {
                            int newVolunteers = (int)newCmd.ExecuteScalar();
                            lblVolunteerUpdate.Text = "+" + newVolunteers + " this week";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception in a real application
                Response.Write("<script>alert('Error loading dashboard data: " + ex.Message + "');</script>");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login page
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Dashboard.aspx");
        }
    }
}