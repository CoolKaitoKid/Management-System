<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="ChurchPratice.HomePage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basilica Regia - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Same styles as in your HTML home page -->
    <style>
        /* Copy the entire <style> block from your HTML home page here */
        body { margin: 0; font-family: 'Segoe UI', sans-serif; background: url('Images/pastel.jpg') no-repeat center center fixed; background-size: cover; color: #333; overflow-x: hidden; }
        .navbar { background: rgba(255, 255, 255, 0.3); padding: 12px 20px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); position: sticky; top: 0; z-index: 1000; transition: 0.4s ease; }
        .navbar .logo { display: flex; align-items: center; }
        .navbar .logo img { height: 45px; margin-right: 15px; }
        .navbar a { color: #4b2e4e; text-decoration: none; font-weight: bold; margin: 0 12px; font-size: 1.1rem; transition: 0.3s ease; }
        .navbar a:hover { color: #b5679c; text-shadow: 0 0 10px rgba(181, 103, 156, 0.8); }
        .btn-primary { background: linear-gradient(135deg, #b5679c, #a1548e); border: none; border-radius: 15px; padding: 12px 22px; font-size: 16px; font-weight: bold; transition: 0.3s ease; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); }
        .btn-primary:hover { background: linear-gradient(135deg, #a1548e, #913b79); box-shadow: 0 0 15px rgba(181, 103, 156, 0.8); }
        .hero { text-align: center; padding: 120px 20px 60px; opacity: 0; transform: translateY(-50px); animation: fadeInUp 1s ease-out forwards; }
        .hero h1 { font-size: 3.5rem; font-weight: bold; color: #4b2e4e; text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3); animation: glowText 2s infinite alternate; }
        .hero p { font-size: 1.3rem; margin-top: 15px; opacity: 0; animation: fadeIn 1.2s ease-in forwards 0.5s; }
        .btn-container { margin-top: 25px; }
        .section { background: rgba(255, 255, 255, 0.3); backdrop-filter: blur(15px); padding: 50 
   
px 30px; border-radius: 25px; max-width: 1000px; margin: 60px auto 50px; color: #2b2b2b; box-shadow: 0 0 30px rgba(0, 0, 0, 0.2); opacity: 0; transform: translateY(30px); transition: opacity 0.6s ease, transform 0.6s ease; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; }
        .section.show { opacity: 1; transform: translateY(0); }
        .section h2 { font-size: 32px; margin-bottom: 20px; color: #5c3d6b; }
        .section p, .section ul { font-size: 18px; line-height: 1.6; }
        .footer { background: #b5679c; color: white; padding: 1px 10px; text-align: center; font-size: 12px; position: fixed; bottom: 0; width: 100%; height: 25px; line-height: 25px; }
        .hidden { display: none; }
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(50px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
        @keyframes glowText { from { text-shadow: 2px 2px 10px rgba(255, 255, 255, 0.3); } to { text-shadow: 2px 2px 15px rgba(255, 255, 255, 0.6); } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar">
            <div class="logo">
                <img src="Images/church.png" alt="Church Logo">
                <a href="#" onclick="showSection('home')">Home</a>
                <a href="#" onclick="showSection('about')">About</a>
                <a href="#" onclick="showSection('services')">Services</a>
                <a href="#" onclick="showSection('contact')">Contact</a>
            </div>
            <div>
                <asp:Button ID="btnRegister" runat="server" Text="Join Church" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
            </div>
        </nav>

        <div id="home" class="hero section show">
            <h1>Salvation Is Here - Join Our Community</h1>
            <p>Become a part of a bigger movement that is changing lives.</p>
            <div class="btn-container">
                <asp:Button ID="btnJoin" runat="server" Text="Join Church" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
            </div>
        </div>

        <div id="about" class="section hidden">
            <h2>About Us</h2>
            <p>Basilica Regia is a vibrant faith-based community built on love, service, and spirituality...</p>
        </div>

        <div id="services" class="section hidden">
            <h2>Our Services</h2>
            <ul>
                <li>Sunday Worship Services</li>
                <li>Bible Study & Prayer Meetings</li>
                <li>Youth & Children’s Ministries</li>
                <li>Marriage & Family Counseling</li>
                <li>Community Outreach Programs</li>
            </ul>
        </div>

        <div id="contact" class="section hidden">
            <h2>Contact Us</h2>
            <p>Email: info@basilicaregia.org</p>
            <p>Phone: +123-456-7890</p>
            <p>Location: 123 Argao, Cebu, Philippines</p>
        </div>

        <div class="footer">
            <p>&copy; 2025 Basilica Regia. All Rights Reserved.</p>
        </div>
    </form>

    <script>
        function showSection(sectionId) {
            document.querySelectorAll('.section').forEach(sec => sec.classList.add('hidden'));
            document.getElementById(sectionId).classList.remove('hidden');
            setTimeout(() => document.getElementById(sectionId).classList.add('show'), 50);
        }
    </script>
</body>
</html>