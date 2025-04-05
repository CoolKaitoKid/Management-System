<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="ChurchManagementSystem.Event" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events - Church Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f9f1e9;
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        .top-bar {
            height: 70px;
            background: linear-gradient(90deg, #3d8165, #5ea98b);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            color: #fff;
        }

        .top-bar .title {
            font-size: 24px;
            font-weight: 600;
            display: flex;
            align-items: center;
        }

        .top-bar .title img.logo {
            width: 45px;
            height: 45px;
            margin-right: 15px;
            transition: transform 0.4s ease;
        }

        .top-bar .title img.logo:hover {
            transform: rotate(360deg);
        }

        .top-bar .profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .top-bar .profile img:hover {
            transform: scale(1.15);
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.8);
        }

        .sidebar {
            width: 70px;
            background: #fff;
            color: #3d8165;
            padding: 20px 10px;
            height: 100vh;
            position: fixed;
            top: 70px;
            left: 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
            transition: width 0.4s cubic-bezier(0.68, -0.55, 0.27, 1.55);
            overflow: hidden;
            border-radius: 0 15px 15px 0;
        }

        .sidebar:hover {
            width: 250px;
            background: linear-gradient(135deg, #fff, #f0f7f4);
        }

        .sidebar a {
            color: #3d8165;
            padding: 15px;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 16px;
            font-weight: 400;
            border-radius: 8px;
            margin-bottom: 10px;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            opacity: 0.7;
        }

        .sidebar a i {
            margin-right: 10px;
            font-size: 20px;
            min-width: 20px;
            transition: transform 0.3s ease;
        }

        .sidebar a span {
            opacity: 0;
            transform: translateX(-20px);
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        .sidebar:hover a span {
            opacity: 1;
            transform: translateX(0);
        }

        .sidebar a:hover {
            background: #e6f0e9;
            color: #3d8165;
            opacity: 1;
            transform: scale(1.05);
        }

        .sidebar a:hover i {
            transform: rotate(20deg) scale(1.2);
            animation: iconBounce 0.5s ease infinite;
        }

        .sidebar .active {
            background: #3d8165;
            color: #fff;
            font-weight: 600;
            opacity: 1;
            animation: pulse 1.5s infinite;
        }

        .sidebar a::before {
            content: '';
            position: absolute;
            left: -100%;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(224, 122, 95, 0.1);
            transition: left 0.3s ease;
            z-index: -1;
        }

        .sidebar a:hover::before {
            left: 0;
        }

        .main-content {
            margin-left: 70px;
            padding: 100px 40px 80px;
            flex: 1;
            transition: margin-left 0.4s ease;
        }

        .sidebar:hover ~ .main-content {
            margin-left: 250px;
        }

        footer.footer {
            background: #3d8165;
            color: #fff;
            text-align: center;
            padding: 10px;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 36px;
            font-weight: 600;
            color: #3d8165;
            margin-bottom: 10px;
        }

        .header p {
            color: #6b5e4f;
            font-size: 18px;
            font-weight: 300;
        }

        .card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .event-list .card {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .event-list .card .event-details {
            flex: 1;
        }

        .event-list .card .event-actions {
            display: flex;
            gap: 10px;
        }

        .floating-button {
            position: fixed;
            bottom: 60px;
            right: 30px;
            background: #e07a5f;
            color: white;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .floating-button:hover {
            transform: scale(1.1);
            background: #d16647;
        }

        .modal-content {
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            background: #3d8165;
            color: #fff;
            border-radius: 15px 15px 0 0;
        }

        .form-control:focus {
            border-color: #3d8165;
            box-shadow: 0 0 5px rgba(61, 129, 101, 0.5);
        }

        .receipt-content {
            font-family: 'Courier New', Courier, monospace;
            background: #fff;
            padding: 20px;
            border: 2px dashed #3d8165;
            border-radius: 10px;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(61, 129, 101, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(61, 129, 101, 0); }
            100% { box-shadow: 0 0 0 0 rgba(61, 129, 101, 0); }
        }

        @keyframes iconBounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 60px;
                padding: 80px 20px 80px;
            }

            .sidebar:hover ~ .main-content {
                margin-left: 200px;
            }

            .event-list .card {
                flex-direction: column;
                text-align: center;
            }

            .event-list .card .event-actions {
                margin-top: 10px;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="top-bar">
            <div class="title">
                <img src="Images/church.png" alt="Logo" class="logo"> Church Management
            </div>
            <div class="profile">
                <a href="Profile.aspx">
                    <img src="images/profile.jpg" alt="User">
                </a>
            </div>
        </div>

        <div class="sidebar">
            <a href="Dashboard.aspx"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a>
            <a href="Event.aspx" class="active"><i class="fas fa-calendar-alt"></i><span>Events</span></a>
            <a href="Member.aspx"><i class="fas fa-users"></i><span>Members</span></a>
            <a href="Donations.aspx"><i class="fas fa-hand-holding-heart"></i><span>Donations</span></a>
            <a href="Feedback.aspx"><i class="fas fa-comments"></i><span>Feedback</span></a>
            <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Church Events</h1>
                <p>Manage and book your church events with ease</p>
            </div>

            <div class="event-list">
                <asp:Repeater ID="rptEvents" runat="server">
                    <ItemTemplate>
                        <div class="card">
                            <div class="event-details">
                                <h5><%# Eval("EventType") %></h5>
                                <p>Date: <%# Eval("EventDate", "{0:MMMM dd, yyyy}") %> | Ref: <%# Eval("ReferenceNumber") %></p>
                            </div>
                            <div class="event-actions">
                                <asp:Button ID="btnViewReceipt" runat="server" CssClass="btn btn-sm btn-primary" Text="View Receipt" CommandArgument='<%# Eval("ReferenceNumber") %>' OnClick="btnViewReceipt_Click" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div class="floating-button" data-bs-toggle="modal" data-bs-target="#eventModal">+</div>

        <!-- Event Booking Modal -->
        <div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="eventModalLabel">Schedule New Event</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter full name" Required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter phone number" TextMode="Phone" Required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter address" Required="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Event Type</label>
                            <asp:DropDownList ID="ddlEventType" runat="server" CssClass="form-control" onchange="updatePrice(this)" Required="true">
                                <asp:ListItem Text="Select Event Type" Value="" />
                                <asp:ListItem Text="Wedding - ₱5000" Value="Wedding" data-price="5000" />
                                <asp:ListItem Text="Baptism/Christening - ₱3000" Value="Baptism/Christening" data-price="3000" />
                                <asp:ListItem Text="Funeral - ₱4000" Value="Funeral" data-price="4000" />
                                <asp:ListItem Text="House Blessing - ₱2800" Value="House Blessing" data-price="2800" />
                                <asp:ListItem Text="Quinceañera/Debut Mass - ₱3500" Value="Quinceañera/Debut Mass" data-price="3500" />
                                <asp:ListItem Text="Renewal of Vows - ₱3200" Value="Renewal of Vows" data-price="3200" />
                                <asp:ListItem Text="Reconciliation - ₱2000" Value="Reconciliation" data-price="2000" />
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price</label>
                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Select event type to see price" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Event Date</label>
                            <asp:TextBox ID="txtEventDate" runat="server" CssClass="form-control" TextMode="Date" Required="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnSubmitEvent" runat="server" CssClass="btn btn-success" Text="Book Event" OnClick="btnSubmitEvent_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Receipt Modal -->
        <div class="modal fade" id="receiptModal" tabindex="-1" aria-labelledby="receiptModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="receiptModalLabel">Event Receipt</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="receipt-content" id="receiptContent">
                            <asp:Literal ID="litReceipt" runat="server"></asp:Literal>
                        </div>
                        <p class="mt-3 text-muted text-center">Please pay at the church receptionist within 8 hours to confirm your booking.</p>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnDownloadReceipt" runat="server" CssClass="btn btn-primary" Text="Download as PNG" OnClientClick="downloadReceipt(); return false;" />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Logout Modal -->
        <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to log out?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-danger" Text="Logout" OnClick="btnLogout_Click" />
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <p>© 2025 Basilica Regia. All Rights Reserved.</p>
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script>
        function updatePrice(ddl) {
            var selected = ddl.options[ddl.selectedIndex];
            var price = selected.getAttribute('data-price');
            document.getElementById('<%= txtPrice.ClientID %>').value = price ? '₱' + price : '';
        }

        function showReceiptModal() {
            var receiptModal = new bootstrap.Modal(document.getElementById('receiptModal'));
            receiptModal.show();
        }

        function downloadReceipt() {
            html2canvas(document.getElementById('receiptContent')).then(canvas => {
                var link = document.createElement('a');
                link.download = 'event-receipt.png';
                link.href = canvas.toDataURL('image/png');
                link.click();
            });
        }
    </script>
</body>
</html>