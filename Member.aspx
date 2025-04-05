<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="ChurchManagement.Member" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Directory - Church Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        /* Same styles as before */
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
            padding: 100px 40px 40px;
            flex: 1;
            transition: margin-left 0.4s ease;
        }

        .sidebar:hover ~ .main-content {
            margin-left: 250px;
        }

        .header {
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 32px;
            font-weight: 600;
            color: #3d8165;
        }

        .header p {
            color: #6b5e4f;
            font-size: 16px;
        }

        .search-bar {
            margin-bottom: 20px;
        }

        .section-buttons button {
            margin: 5px;
            background: #e07a5f;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .section-buttons button:hover {
            background: #d16647;
            transform: translateY(-2px);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background: #3d8165;
            color: #fff;
        }

        tr:hover {
            background: #f9f9f9;
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

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(61, 129, 101, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(61, 129, 101, 0); }
            100% { box-shadow: 0 0 0 0 rgba(61, 129, 101, 0); }
        }

        @keyframes iconBounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .main-content {
            animation: fadeIn 0.5s ease-in-out;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 60px;
            }

            .sidebar:hover {
                width: 200px;
            }

            .main-content {
                margin-left: 60px;
                padding: 80px 20px 20px;
            }

            .sidebar:hover ~ .main-content {
                margin-left: 200px;
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
            <a href="Event.aspx"><i class="fas fa-calendar-alt"></i><span>Events</span></a>
            <a href="Member.aspx" class="active"><i class="fas fa-users"></i><span>Members</span></a>
            <a href="Donations.aspx"><i class="fas fa-hand-holding-heart"></i><span>Donations</span></a>
            <a href="Feedback.aspx"><i class="fas fa-comments"></i><span>Feedback</span></a>
            <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Member Directory</h1>
                <p>View and manage church members</p>
            </div>

            <div class="search-bar d-flex justify-content-end">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control w-25 me-2" placeholder="Search by First Name"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
            </div>

            <div class="section-buttons">
                <asp:Button ID="btnAll" runat="server" Text="All Lists" OnClick="btnAll_Click" />
                <asp:Button ID="btnPriests" runat="server" Text="Priests" OnClick="btnPriests_Click" />
                <asp:Button ID="btnChoirs" runat="server" Text="Choirs" OnClick="btnChoirs_Click" />
                <asp:Button ID="btnYouth" runat="server" Text="Youth Ministry" OnClick="btnYouth_Click" />
                <asp:Button ID="btnAcolytes" runat="server" Text="Acolytes" OnClick="btnAcolytes_Click" />
                <asp:Button ID="btnNuns" runat="server" Text="Nuns" OnClick="btnNuns_Click" />
                <asp:Button ID="btnDonors" runat="server" Text="Donors" OnClick="btnDonors_Click" />
            </div>

            <asp:Panel ID="pnlContent" runat="server">
                <asp:Literal ID="litAllContent" runat="server"></asp:Literal>
                <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="False" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>

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
        </div>

        <footer class="footer">
            <p>© 2025 Basilica Regia. All Rights Reserved.</p>
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>