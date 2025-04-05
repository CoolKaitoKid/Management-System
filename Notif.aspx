<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f7f8fc, #eef2f7);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            animation: fadeIn 1s ease-in-out;
        }

        .container {
            max-width: 900px;
            margin: 100px auto;
            padding: 0;
            background: #fff;
            border-radius: 25px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
            overflow: hidden;
            animation: slideUp 0.8s ease forwards;
        }

        .header-bar {
            background: linear-gradient(135deg, #7a6f9b, #9b91b7); /* Gradient with #7a6f9b */
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #fff;
        }

        .header-bar h2 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 30px;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-bar h2 i {
            font-size: 26px;
        }

        .header-bar .clear-btn {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: #fff;
            padding: 8px 15px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .header-bar .clear-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }

        .notification-list {
            padding: 30px;
        }

        .notification-item {
            display: flex;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid rgba(122, 111, 155, 0.15); /* Adjusted to match #7a6f9b */
            gap: 25px;
            transition: all 0.3s ease;
            border-radius: 12px;
            background: #fff;
            position: relative;
        }

        .notification-item:last-child {
            border-bottom: none;
        }

        .notification-item:hover {
            background: linear-gradient(135deg, #fff, #f9f9ff);
            transform: translateX(8px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.06);
        }

        .notification-icon {
            background: linear-gradient(135deg, #7a6f9b, #9b91b7); /* Gradient with #7a6f9b */
            color: #fff;
            padding: 14px;
            font-size: 22px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            min-width: 52px;
            height: 52px;
            box-shadow: 0 4px 12px rgba(122, 111, 155, 0.3); /* Shadow based on #7a6f9b */
            transition: transform 0.3s ease;
        }

        .notification-item:hover .notification-icon {
            transform: scale(1.1);
        }

        .notification-content {
            flex: 1;
        }

        .notification-text {
            font-size: 16px;
            color: #3a3a5c;
            line-height: 1.5;
            margin: 0;
        }

        .notification-text strong {
            color: #7a6f9b; /* Main theme color for highlights */
            font-weight: 600;
        }

        .notification-time {
            font-size: 12px;
            color: #888;
            margin-top: 5px;
        }

        .back-btn {
            display: flex;
            align-items: center;
            font-size: 16px;
            font-weight: 500;
            color: #7a6f9b; /* Main theme color */
            cursor: pointer;
            padding: 15px 30px;
            transition: all 0.3s ease;
        }

        .back-btn i {
            margin-right: 10px;
            font-size: 18px;
        }

        .back-btn:hover {
            color: #9b91b7; /* Lighter shade on hover */
            transform: translateX(-10px);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                max-width: 100%;
                margin: 80px 15px;
            }

            .notification-list {
                padding: 20px;
            }

            .notification-item {
                padding: 15px;
                gap: 20px;
            }

            .notification-icon {
                min-width: 45px;
                height: 45px;
                font-size: 20px;
            }

            .notification-text {
                font-size: 15px;
            }

            .header-bar {
                padding: 15px 20px;
            }

            .header-bar h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header-bar">
        <h2><i class="fas fa-bell"></i> Notifications</h2>
        <button class="clear-btn" onclick="clearNotifications()">Clear All</button>
    </div>

    <div class="back-btn" onclick="goBack()">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
    </div>

    <div class="notification-list">
        <div class="notification-item">
            <div class="notification-icon"><i class="fas fa-user-plus"></i></div>
            <div class="notification-content">
                <p class="notification-text"><strong>John Doe</strong> joined the community.</p>
                <span class="notification-time">2 hours ago</span>
            </div>
        </div>

        <div class="notification-item">
            <div class="notification-icon"><i class="fas fa-calendar-alt"></i></div>
            <div class="notification-content">
                <p class="notification-text">New event scheduled for <strong>March 25th</strong>.</p>
                <span class="notification-time">Today, 10:30 AM</span>
            </div>
        </div>

        <div class="notification-item">
            <div class="notification-icon"><i class="fas fa-hand-holding-heart"></i></div>
            <div class="notification-content">
                <p class="notification-text"><strong>Jane Smith</strong> donated <strong>$200</strong>.</p>
                <span class="notification-time">Yesterday, 3:15 PM</span>
            </div>
        </div>

        <div class="notification-item">
            <div class="notification-icon"><i class="fas fa-bullhorn"></i></div>
            <div class="notification-content">
                <p class="notification-text"><strong>Admin</strong> posted a new announcement.</p>
                <span class="notification-time">2 days ago</span>
            </div>
        </div>

        <div class="notification-item">
            <div class="notification-icon"><i class="fas fa-comment-dots"></i></div>
            <div class="notification-content">
                <p class="notification-text"><strong>Anna</strong> commented on your post.</p>
                <span class="notification-time">3 days ago</span>
            </div>
        </div>
    </div>
</div>

<script>
    function goBack() {
        window.location.href = "Dashboard.aspx";
    }

    function clearNotifications() {
        const notificationList = document.querySelector('.notification-list');
        notificationList.innerHTML = '<p style="text-align: center; color: #888; padding: 20px;">No notifications available.</p>';
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>