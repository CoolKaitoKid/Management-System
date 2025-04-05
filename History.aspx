<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Church History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">

    <style>
        body {
        display: flex;
        flex-direction: row;
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
        .content {
            margin-left: 270px;
            padding: 30px;
            flex: 1;
            width: calc(100% - 270px);
            margin-top: 50px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .intro-section {
            background: rgba(255, 255, 255, 0.7);
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            text-align: center;
            margin-bottom: 40px;
        }

        .intro-section h2 {
            font-size: 32px;
            font-weight: bold;
            color: #333;
        }

        .intro-section p {
            font-size: 16px;
            color: #555;
            margin-top: 10px;
        }

        .card-container {

            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .history-card {
            width: 220px;
            height: 280px;
            background: linear-gradient(135deg, #b8c1ec, #a0b4d4);
            backdrop-filter: blur(10px);
            padding: 15px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            cursor: pointer;
        }

        .history-card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .history-card img {
            width: 100%;
            height: 180px;
            border-radius: 12px;
            font-weight: bold;
            color: black;
            object-fit: cover;
        }

        .history-card h4 {
            margin-top: 10px;
            font-size: 18px;
            font-weight: 300;
            color: black;
            font-family: 'Playfair Display', serif;
        }


        .history-details {
            display: none;
            background: linear-gradient(135deg, #b8c1ec, #a0b4d4);
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            animation: fadeIn 0.6s ease;
            margin-top: 10px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        .history-details img {
            width: 100%;
            max-width: 300px;
            border-radius: 12px;
            margin-bottom: 15px;
        }

        .history-details h4 {
            font-size: 22px;
            font-weight: bold;
            font-family: 'Georgia', serif;
            margin-bottom: 10px;
        }

        .history-details p {
            font-size: 16px;
            color: #333;
            line-height: 1.6;
            margin-top: 10px;
        }

        .back-btn {
            margin-top: 10px;
            padding: 10px 15px;
            background: #7a6f9b;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background: #5a4d7a;
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
         @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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


    <div class="sidebar">
        <a href="Dashboard.aspx"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
        <a href="History.aspx" class="active"><i class="fas fa-church me-2"></i> Church History</a>
        <a href="Event.aspx"><i class="fas fa-calendar-alt me-2"></i>Event Handling</a>
        <a href="Member.aspx"><i class="fas fa-users me-2"></i>Member Directory</a>
        <a href="Donations.aspx"><i class="fas fa-hand-holding-heart me-2"></i>Donations</a>
        <a href="Feedback.aspx"><i class="fas fa-comments me-2"></i>Feedbacks</a>
        <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
    </div>

    <div class="content">
    <div class="card-container">
        <div class="history-card" onclick="showDetails('origins')">
            <img src="Images/cath.jpg" alt="Origins" style="height: 200px">
            <h4>Origins</h4>
        </div>
        <div class="history-card" onclick="showDetails('myths')">
            <img src="Images/achitecture.jpg" alt="Myths"  style="height: 200px">
            <h4>Legends & Myths</h4>
        </div>
        <div class="history-card" onclick="showDetails('events')">
            <img src="Images/event.jpg" alt="Events"  style="height: 200px">
            <h4>Significant Events</h4>
        </div>
        <div class="history-card" onclick="showDetails('milestones')">
            <img src="Images/mile.jpg" alt="Milestones"  style="height: 200px">
            <h4>Milestones</h4>
        </div>
        <div class="history-card" onclick="showDetails('impact')">
            <img src="Images/dev.jpg" alt="Impact"  style="height: 200px">
            <h4>Community Impact</h4>
        </div>
        <div class="history-card" onclick="showDetails('architecture')">
            <img src="Images/struc.jpg" alt="Architecture"  style="height: 200px">
            <h4>Architectural Evolution</h4>
        </div>
        <div class="history-card" onclick="showDetails('leadership')">
            <img src="Images/lead.jpg" alt="Leadership"  style="height: 200px">
            <h4>Church Leadership</h4>
        </div>
        <div class="history-card" onclick="showDetails('outreach')">
            <img src="Images/reach.jpg" alt="Outreach"  style="height: 200px">
            <h4>Mission & Outreach</h4>
        </div>
    </div>


        <div class="history-details" id="details" style="width: 800px">
            <img id="details-image" src="" alt="Details Image" style="width: 100%; max-width: 300px; height: 250px; border-radius: 10px; margin-bottom: 15px;">
           <h4 id="details-title" style="font-family: 'Georgia', serif; font-size: 22px; text-align= center; font-weight: bold;"></h4>
            <p id="details-text" style="font-family: 'Arial', sans-serif; font-size: 16px; text-align: left;"></p>
            <button class="back-btn" onclick="hideDetails()">Back</button>
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
                    <button type="button" class="btn btn-danger" onclick="logout()">Logout</button>
                </div>
            </div>
        </div>
    </div>


    <script>
        const detailsContent = {
            origins:{
                
                title: "The Origins of Basilica Regia",
                image: "Images/cath.jpg",
                text: "The Basilica Regia was founded in 1805 by missionaries seeking to create a sanctuary for the growing Christian population. According to historical records, early settlers believed that a divine light appeared on the site, guiding the missionaries to build the church there."
              },
            myths: {
                title: "Legends and Myths",
                image: "Images/achitecture.jpg",
                text: "Over the centuries, several myths have surrounded the Basilica Regia: \n📜 The Crying Bell – A legend says that during a great storm in 1850, the church’s newly installed bell rang by itself, warning the town of an impending disaster.Many believe it was an act of divine intervention. \n📜 The Hidden Crypts – Some old writings speak of hidden underground tunnels beneath the church, where religious relics and sacred texts were kept safe during times of war.\n📜 The Guardian Monk – Villagers claim that a hooded figure is sometimes seen near the altar late at night, said to be the spirit of a devoted monk who watches over the church."
              },
            events: {
                title: "Significant Events",
                image: "Images/event.jpg",
                    text: "📌 1920 – Restoration After the Earthquake \n A massive earthquake caused damage to the church, cracking its walls and shattering its stained glass windows. The community came together to restore it, with some claiming they saw a miraculous glow over the ruins.\n📌 1995 – Declared a Heritage Site \n Recognized for its historical and cultural value, Basilica Regia was officially named a heritage site, preserving its architectural beauty for future generations.\n📌 2020 – 215th Anniversary Celebration \n In a grand celebration, thousands of pilgrims gathered to commemorate the church’s enduring legacy, proving that faith and tradition continue to thrive."
            },
            milestones: {
                title: "Milestones",
                image: "Images/mile.jpg",
                text: "✩1805 - Church established \n✩1850 - Expansion and addition of bell tower \n✩1920 - Restoration after a major earthquake.\n✩1995 - Declared a heritage site\n✩2020 - 215th anniversary celebration"
            },
            impact: {
                title: "Community Impact",
                image: "Images/dev.jpg",
                text: "Over the years, our church has served as a center for spiritual guidance, education, and charity work."
            },
            architecture: {
                title: "Architectural Evolution",
                image: "Images/struc.jpg",
                text: "From humble beginnings with thatched roofs to the grand stone arches we see today, the church's architecture has evolved significantly. The 1900s brought stained glass artistry, while the 2000s saw eco-conscious renovations. Each structural change reflects the era's values and the congregation’s growing needs."
            },
            leadership: {
                title: "Church Leadership",
                image: "Images/lead.jpg",
                text: "Throughout history, visionary leaders have shepherded our congregation with wisdom and devotion. From Father Elijah, who laid the church’s spiritual foundation, to Reverend Maria, who modernized outreach programs, each leader has left an indelible mark on the church’s journey."
            },
            outreach: {
                title: "Mission & Outreach",
                image: "Images/reach.jpg",
                text: "Our church’s heart beats for service. Mission trips to remote areas, free medical clinics, food drives, and education programs have touched countless lives. Spreading hope and compassion beyond the church walls remains one of our proudest legacies."
            }


        };

        function showDetails(section) {
            document.getElementById("details-title").innerText = detailsContent[section].title;
            document.getElementById("details-text").innerText = detailsContent[section].text;
            document.getElementById("details-image").src = detailsContent[section].image;
            document.querySelector(".card-container").style.display = "none";
            document.getElementById("details").style.display = "block";
        }

        function hideDetails() {
            document.getElementById("details").style.display = "none";
            document.querySelector(".card-container").style.display = "flex";
        }
        function logout() {
            window.location.href = "LogIn.aspx";
        }

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <footer class="footer">
     <p>&copy; 2025 Basilica Regia. All Rights Reserved.</p>
        </footer>
</body>
</html>
