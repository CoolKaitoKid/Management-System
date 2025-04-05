using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChurchPractice
{
    public partial class Feedback : System.Web.UI.Page
    {
        // Feedback model class
        public class FeedbackEntry
        {
            public string Name { get; set; }
            public string Stars { get; set; }
            public string Comment { get; set; }
        }

        // Static list to store feedbacks (persists during app runtime)
        protected static List<FeedbackEntry> feedbackList = new List<FeedbackEntry>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load sample feedbacks only once
                if (feedbackList.Count == 0)
                {
                    feedbackList.Add(new FeedbackEntry { Name = "Maria Santos", Stars = "★★★★☆", Comment = "Such a peaceful and welcoming community. God bless!" });
                    feedbackList.Add(new FeedbackEntry { Name = "Juan Dela Cruz", Stars = "★★★★★", Comment = "I love attending the events. Very organized and heartwarming!" });
                    feedbackList.Add(new FeedbackEntry { Name = "Ana Villanueva", Stars = "★★★☆☆", Comment = "Overall good experience, but hoping for more youth programs." });
                }

                BindFeedbacks(); // Show existing feedbacks on initial load
            }
        }

        // Submit button click event handler
        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            string name = "You"; // You can change this to use a name textbox if desired
            string stars = GetStarString(RatingList.SelectedValue);
            string comment = txtFeedback.Text.Trim();

            if (!string.IsNullOrEmpty(comment) && !string.IsNullOrEmpty(stars))
            {
                // Add new feedback
                feedbackList.Add(new FeedbackEntry
                {
                    Name = name,
                    Stars = stars,
                    Comment = comment
                });

                // Clear form inputs
                txtFeedback.Text = "";
                RatingList.ClearSelection();

                // Re-bind updated list
                BindFeedbacks();
            }
        }

        // Bind feedback list to repeater
        private void BindFeedbacks()
        {
            rptFeedbacks.DataSource = feedbackList;
            rptFeedbacks.DataBind();
        }

        // Convert rating value to star string
        private string GetStarString(string rating)
        {
            int rate = int.TryParse(rating, out int r) ? r : 0;
            string filled = new string('★', rate);
            string empty = new string('☆', 5 - rate);
            return filled + empty;
        }
    }
}
