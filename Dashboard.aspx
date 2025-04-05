<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Church Management - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

        /* Top Bar */
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

        /* Sidebar */
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

        /* Main Content */
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
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 50px;
        }

        .card {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .card i {
            font-size: 40px;
            color: #e07a5f;
            margin-bottom: 15px;
        }

        .card h4 {
            font-size: 18px;
            color: #3d8165;
            margin-bottom: 10px;
        }

        .card h2 {
            font-size: 30px;
            font-weight: 600;
            color: #e07a5f;
        }

        .card p {
            font-size: 14px;
            color: #6b5e4f;
        }

        .increase {
            color: #10b981;
            font-weight: 500;
        }

        /* Charts */
        .charts-wrapper {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }

        .chart-card {
            background: #fff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .chart-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .chart-card h4 {
            font-size: 20px;
            color: #3d8165;
            text-align: center;
            margin-bottom: 20px;
        }

        .chart-card canvas {
            width: 100% !important;
            max-height: 280px;
        }

        /* Footer */
        footer.footer {
            background: #3d8165;
            color: #fff;
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
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .main-content {
            animation: fadeIn 0.5s ease-in-out;
        }

        .card, .chart-card {
            animation: slideUp 0.6s ease-in-out forwards;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .charts-wrapper {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 80px;
                padding: 15px;
            }

            .sidebar a {
                justify-content: center;
                padding: 12px;
                font-size: 0;
            }

            .sidebar a i {
                margin: 0;
                font-size: 20px;
            }

            .main-content {
                margin-left: 80px;
                padding: 80px 20px 20px;
            }

            .header {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- Top Bar -->
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

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="Dashboard.aspx" class="active"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a>
        <a href="Event.aspx"><i class="fas fa-calendar-alt"></i><span>Events</span></a>
        <a href="Member.aspx"><i class="fas fa-users"></i><span>Members</span></a>
        <a href="Donations.aspx"><i class="fas fa-hand-holding-heart"></i><span>Donations</span></a>
        <a href="Feedback.aspx"><i class="fas fa-comments"></i><span>Feedback</span></a>
        <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <div>
                <h1>Welcome to Your Dashboard</h1>
                <p>Real-time insights into church operations and community engagement</p>
            </div>
        </div>

        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <div class="card">
                <i class="fas fa-users"></i>
                <h4>Total Members</h4>
                <h2>320</h2>
                <p>Updated: 3 mins ago</p>
            </div>
            <div class="card">
                <i class="fas fa-user-check"></i>
                <h4>Weekly Attendance</h4>
                <h2>185</h2>
                <p>Last Service: Mar 17</p>
            </div>
            <div class="card">
                <i class="fas fa-donate"></i>
                <h4>Monthly Donations</h4>
                <h2>₱17,420</h2>
                <p><span class="increase">+12%</span> from last month</p>
            </div>
            <div class="card">
                <i class="fas fa-hands-helping"></i>
                <h4>Active Volunteers</h4>
                <h2>46</h2>
                <p>+3 this week</p>
            </div>
        </div>

        <!-- Charts -->
        <div class="charts-wrapper">
            <div class="chart-card">
                <h4>Donation Trends</h4>
                <canvas id="donationChart"></canvas>
            </div>
            <div class="chart-card">
                <h4>Weekly Attendance</h4>
                <canvas id="attendanceChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>© 2025 Basilica Regia. All Rights Reserved.</p>
    </footer>

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
                    <button type="button" class="btn btn-danger" onclick="logout()">Logout</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            new Chart(document.getElementById("donationChart"), {
                type: 'line',
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr"],
                    datasets: [{
                        label: "Monthly Donations",
                        data: [5400, 6200, 7400, 8000],
                        borderColor: "#e07a5f",
                        backgroundColor: "rgba(224, 122, 95, 0.1)",
                        tension: 0.4
                    }]
                },
                options: {
                    scales: {
                        y: { beginAtZero: true }
                    }
                }
            });

            new Chart(document.getElementById("attendanceChart"), {
                type: 'bar',
                data: {
                    labels: ["Week 1", "Week 2", "Week 3", "Week 4"],
                    datasets: [{
                        label: "Weekly Attendance",
                        data: [160, 180, 185, 200],
                        backgroundColor: "#e07a5f"
                    }]
                },
                options: {
                    scales: {
                        y: { beginAtZero: true }
                    }
                }
            });
        });

        function logout() {
            window.location.href = "LogIn.aspx";
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>