<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="ChurchPractice.Feedback" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            display: flex;
            min-height: 100vh;
            background: linear-gradient(to right, #f3f4f9, #eaf0f6);
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .top-bar {
            width: 100%;
            height: 60px;
            background-color: rgba(255, 255, 255, 0.95);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }

        .top-bar .title {
            font-size: 20px;
            font-weight: bold;
            color: #4b4b4b;
        }

        .top-bar .icons {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .top-bar .icons i {
            font-size: 20px;
            color: #4b4b4b;
            transition: transform 0.3s ease;
        }

        .top-bar .icons i:hover {
            transform: scale(1.2);
            color: #7a6f9b;
        }

        .top-bar .profile img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            border: 2px solid #ccc;
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(135deg, #b8c1ec, #a0b4d4);
            color: #2f2f2f;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.15);
            padding-top: 80px;
            z-index: 999;
        }

        .sidebar a {
            color: #2f2f2f;
            padding: 12px 15px;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 17px;
            font-weight: 500;
            width: 100%;
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.5);
            transform: translateX(5px);
        }

        .sidebar .active {
            background: #7a6f9b;
            color: white !important;
        }

        .content-container {
            margin-left: 270px;
            padding-top: 80px;
            padding: 20px;
            width: calc(100% - 270px);
        }
        footer.footer {
             background: linear-gradient(135deg, #b8c1ec, #a0b4d4);
             color: black;
             text-align: center;
             padding: 4px 10px;
             font-size: 13px;
             font-weight: 500;
             font-display: inherit;
             height: 25px;
             position: fixed;
             bottom: 0;
             left: 0;
             width: 100%;
             z-index: 1000;
        }

        /* Animations */
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(10px);}
            to {opacity: 1; transform: translateY(0);}
        }

        @keyframes slideUp {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }


        .feedback-container {
            background: linear-gradient(135deg, #b8c1ec, #a0b4d4);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-left: 100px;
            margin-top: 30px;
            width: 800px; /* Ensures spacing from sidebar and some margin */
        }


    .feedback-form {
        background: #f9f9fc;
        border-left: 5px solid #7a6f9b;
    }

    .star-rating input[type="radio"] {
        display: none;
    }

    .star-rating label {
        font-size: 25px;
        color: #ccc;
        cursor: pointer;
        margin-right: 5px;
        transition: color 0.3s ease;
    }

    .star-rating input:checked ~ label,
    .star-rating label:hover,
    .star-rating label:hover ~ label {
        color: #ffc107;
    }

    .feedback-card {
        background: white;
        color: #2f2f2f;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }

    .feedback-card strong {
        font-size: 16px;
    }

    .feedback-card .text-warning {
        font-size: 18px;
    }

    </style>
</head>
<body>

       <div class="top-bar">
    <div class="title">⛪ Church Management System</div>
    <div class="icons">
        <a href="Notif.aspx"><i class="fas fa-bell"></i></a>
        <a href="Message.aspx"><i class="fas fa-envelope"></i></a>
        
        <div class="profile">
            <a href="Profile.aspx">
                <img src="images/profile.jpg" alt="User">
            </a>
        </div>
    </div>
</div>


    <!-- Sidebar -->
    <div class="sidebar">
        <a href="Dashboard.aspx"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
        <a href="History.aspx"><i class="fas fa-church me-2"></i>Church History</a>
        <a href="Event.aspx"><i class="fas fa-calendar-alt me-2"></i>Event Handling</a>
        <a href="Member.aspx"><i class="fas fa-users me-2"></i>Member Directory</a>
        <a href="Donations.aspx"><i class="fas fa-hand-holding-heart me-2"></i>Donations</a>
        <a href="Feedback.aspx" class="active"><i class="fas fa-comments me-2"></i>Feedback</a>
        <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
    </div>

    <!-- Main Content Area -->
    <form id="form1" runat="server">
        <div class="content-container">
            <h2 class="mb-4">Feedback</h2>
            <!-- Add your feedback form and cards here -->
            <!-- Example placeholder -->
            <div class="feedback-container">
 
    <!-- Feedback Form -->
    <div class="feedback-form mb-5 p-4 shadow-sm rounded-4">
    <h4 class="mb-3">Leave Your Feedback</h4>

    <div class="rating mb-3">
        <span class="me-2">Rate us:</span>
        <div class="star-rating d-inline-flex">
            <asp:RadioButtonList ID="RatingList" runat="server" RepeatDirection="Horizontal" CssClass="form-check-inline star-rating">
                <asp:ListItem Value="1" Text="★" />
                <asp:ListItem Value="2" Text="★" />
                <asp:ListItem Value="3" Text="★" />
                <asp:ListItem Value="4" Text="★" />
                <asp:ListItem Value="5" Text="★" />
            </asp:RadioButtonList>
        </div>
    </div>

        <div class="mb-3">
            <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Write your feedback here..."></asp:TextBox>
        </div>
        <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" CssClass="btn btn-primary rounded-pill px-4" OnClick="btnSubmitFeedback_Click" />
    </div>

    <!-- Feedback Cards Section -->
    

        <asp:Repeater ID="rptFeedbacks" runat="server">
            <ItemTemplate>
                <div class="feedback-card p-3 mb-3 rounded-4">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <strong><%# Eval("Name") %></strong>
                        <div class="text-warning"><%# Eval("Stars") %></div>
                    </div>
                    <p class="mb-0"><%# Eval("Comment") %></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
   
      
    </form>
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
                <button type="button" class="btn btn-danger" onclick="logout()">Logout</button>
            </div>
        </div>
    </div>
</div>
    <script>
        function logout() {
            window.location.href = "LogIn.aspx";
        }
    </script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
