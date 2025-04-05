<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Church Management - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            display: flex;
            flex-direction: row;
            min-height: 100vh;
            background-color: #f8f9fa;
            margin: 0;
        }

        .top-bar {
            width: 100%;
            height: 60px;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .top-bar .title {
            font-size: 18px;
            font-weight: bold;
            color: black;
            display: flex;
            align-items: center;
        }

        .top-bar .icons {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .top-bar .icons i {
            font-size: 20px;
            cursor: pointer;
            color: black;
        }

        .top-bar .profile img {
            width: 40px;
            height: 30px;
            border-radius: 50%;
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(135deg, #444, #222);
            color: white;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.3);
            overflow-y: auto;
        }

        .sidebar a {
            color: white;
            padding: 12px 15px;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 18px;
            font-weight: bold;
            width: 100%;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateX(5px);
        }

        .sidebar .active {
            background: #6c757d;
            color: white;
        }

        .content {
            margin-left: 270px;
            padding: 20px;
            flex: 1;
            width: calc(100% - 270px);
            overflow-y: auto;
            margin-top: 80px;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); /* Reduced the min width */
            gap: 10px; /* Reduced gap between cards */
        }

        .card {
            border-radius: 15px; /* Slightly smaller border radius */
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15); /* Reduced shadow */
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 120px; /* Reduced the height */
            padding: 10px; /* Adjusted padding for better spacing */
        }


        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
        }

         .footer {
             background: #252a30;
             color: white;
             text-align: center;
             padding: 0 10px;
             height: 20px;
             position: fixed;
             bottom: 0;
             width: 100%;
             font-size: 14px;
             font-weight: bold;
         }
    </style>
</head>
<body>

    <div class="top-bar">
        <div class="title">⛪ Church Management System</div>
        <div class="icons">
            <i class="fas fa-bell"></i>
            <i class="fas fa-envelope"></i>
            <div class="profile">
                <img src="images/profile.jpg" alt="User">
            </div>
        </div>
    </div>

    <div class="sidebar">
        <a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="#"><i class="fas fa-church"></i> Church History</a>
        <a href="#"><i class="fas fa-calendar-alt"></i> Event Calendar</a>
        <a href="#"><i class="fas fa-users"></i> Member Directory</a>
        <a href="#"><i class="fas fa-hand-holding-heart"></i> Donations</a>
        <a href="#"><i class="fas fa-comments"></i> Communication</a>
        <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <h2>Welcome to the Basilica Regia Dashboard</h2>
        <p>Monitor key church activities and data efficiently.</p>
        <div class="dashboard-cards">
            <div class="card bg-primary"><i class="fas fa-users"></i><h4>Active Members</h4><h2>150</h2></div>
            <div class="card bg-success"><i class="fas fa-hand-holding-usd"></i><h4>Avg Donations</h4><h2>$500</h2></div>
            <div class="card bg-warning"><i class="fas fa-user-friends"></i><h4>Number of Donors</h4><h2>85</h2></div>
            <div class="card bg-danger"><i class="fas fa-book"></i><h4>Bible Study Groups</h4><h2>5</h2></div>
            <div class="card bg-info"><i class="fas fa-pray"></i><h4>Prayer Requests</h4><h2>20</h2></div>
            <div class="card bg-secondary"><i class="fas fa-chalkboard-teacher"></i><h4>Volunteers</h4><h2>30</h2></div>
            <div class="card bg-dark"><i class="fas fa-calendar-check"></i><h4>Upcoming Events</h4><h2>3</h2></div>
            <div class="card" style="background-color: #6f42c1; color: white;"><i class="fas fa-clock"></i><h4>Scheduling</h4><h2>10</h2></div>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2025 Basilica Regia. All Rights Reserved.</p>
    </footer>

</body>
</html>
