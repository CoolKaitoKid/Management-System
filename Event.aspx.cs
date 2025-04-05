using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChurchManagement
{
    public partial class Event : Page
    {
        // Simulated in-memory storage for events (replace with database in production)
        private static List<dynamic> EventList
        {
            get
            {
                if (Session["EventList"] == null)
                {
                    Session["EventList"] = new List<dynamic>();
                }
                return (List<dynamic>)Session["EventList"];
            }
            set
            {
                Session["EventList"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEvents();
            }
        }

        private void BindEvents()
        {
            rptEvents.DataSource = EventList;
            rptEvents.DataBind();
        }

        protected void btnSubmitEvent_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string address = txtAddress.Text.Trim();
            string eventType = ddlEventType.SelectedValue;
            string price = txtPrice.Text;
            string eventDate = txtEventDate.Text;
            string referenceNumber = "REF" + DateTime.Now.Ticks.ToString().Substring(0, 8);

            // Create event object
            var eventData = new
            {
                FullName = fullName,
                Phone = phone,
                Address = address,
                EventType = eventType,
                Price = price,
                EventDate = eventDate,
                ReferenceNumber = referenceNumber
            };

            // Add to event list (simulated database)
            EventList.Add(eventData);

            // Populate receipt for display
            litReceipt.Text = $@"
                <div class='text-center'>
                    <h5>Church Event Booking Receipt</h5>
                    <p><strong>Full Name:</strong> {fullName}</p>
                    <p><strong>Phone:</strong> {phone}</p>
                    <p><strong>Address:</strong> {address}</p>
                    <p><strong>Event Type:</strong> {eventType}</p>
                    <p><strong>Price:</strong> {price}</p>
                    <p><strong>Event Date:</strong> {eventDate}</p>
                    <p><strong>Reference Number:</strong> {referenceNumber}</p>
                </div>
            ";

            // Clear form fields
            txtFullName.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            ddlEventType.SelectedIndex = 0;
            txtPrice.Text = "";
            txtEventDate.Text = "";

            // Rebind events to update the Repeater
            BindEvents();

            // Trigger receipt modal
            ScriptManager.RegisterStartupScript(this, GetType(), "showReceiptModal", "showReceiptModal();", true);
        }

        protected void btnViewReceipt_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string referenceNumber = btn.CommandArgument;

            // Find the event by reference number
            var eventData = EventList.Find(ev => ev.ReferenceNumber == referenceNumber);
            if (eventData != null)
            {
                // Populate receipt for display
                litReceipt.Text = $@"
                    <div class='text-center'>
                        <h5>Church Event Booking Receipt</h5>
                        <p><strong>Full Name:</strong> {eventData.FullName}</p>
                        <p><strong>Phone:</strong> {eventData.Phone}</p>
                        <p><strong>Address:</strong> {eventData.Address}</p>
                        <p><strong>Event Type:</strong> {eventData.EventType}</p>
                        <p><strong>Price:</strong> {eventData.Price}</p>
                        <p><strong>Event Date:</strong> {eventData.EventDate}</p>
                        <p><strong>Reference Number:</strong> {eventData.ReferenceNumber}</p>
                    </div>
                ";

                // Show receipt modal
                ScriptManager.RegisterStartupScript(this, GetType(), "showReceiptModal", "showReceiptModal();", true);
            }
            else
            {
                // Handle case where event is not found
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Receipt not found.');", true);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}