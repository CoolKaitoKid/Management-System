<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ChurchPractice.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <titlea href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet" />
    <title>User Profile - Church Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #2c3e50, #34495e);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow-y: auto;
            animation: bgFade 5s infinite alternate;
        }

        @keyframes bgFade {
            0% { background: linear-gradient(135deg, #2c3e50, #34495e); }
            100% { background: linear-gradient(135deg, #34495e, #2c3e50); }
        }

        .profile-container {
            max-width: 1000px;
            width: 90%;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            padding: 60px;
            position: relative;
            transition: all 0.4s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .profile-container:hover {
            transform: translateY(-10px);
            box-shadow: 0 25px 70px rgba(0, 0, 0, 0.4);
        }

        .profile-picture {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            border: 10px solid rgba(255, 255, 255, 0.9);
            object-fit: cover;
            margin: 0 auto 30px;
            display: block;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            transition: transform 0.5s ease, box-shadow 0.5s ease;
        }

        .profile-picture:hover {
            transform: scale(1.1) rotate(5deg);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.5);
        }

        h2 {
            font-size: 34px;
            font-weight: 700;
            color: #fff;
            text-align: center;
            margin-bottom: 25px;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        .section-title {
            font-size: 22px;
            font-weight: 600;
            color: #ecf0f1;
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 2px solid rgba(236, 240, 241, 0.3);
            display: flex;
            align-items: center;
            gap: 12px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

        .section-title i {
            font-size: 24px;
            color: #e74c3c;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        .profile-info {
            margin-top: 35px;
        }

        .profile-info label {
            font-weight: 600;
            font-size: 18px;
            color: #ecf0f1;
            margin-bottom: 10px;
            display: block;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        }

        .info-value {
            font-size: 16px;
            background: rgba(255, 255, 255, 0.15);
            padding: 14px 20px;
            border-radius: 15px;
            color: #fff;
            margin-bottom: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .info-value:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: translateY(-3px);
        }

        .edit-field {
            width: 100%;
            padding: 14px 20px;
            font-size: 16px;
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            margin-bottom: 25px;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            box-shadow: inset 0 2px 8px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .edit-field:focus {
            border-color: #e74c3c;
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 12px rgba(231, 76, 60, 0.5);
            outline: none;
        }

        .btn {
            padding: 14px 35px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: all 0.4s ease;
            margin: 15px 10px 0 0;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-primary {
            background: linear-gradient(90deg, #e74c3c, #c0392b);
            color: #fff;
            box-shadow: 0 6px 20px rgba(231, 76, 60, 0.5);
        }

        .btn-primary:hover {
            background: linear-gradient(90deg, #c0392b, #e74c3c);
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(231, 76, 60, 0.7);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.2);
            color: #ecf0f1;
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-5px);
            color: #fff;
        }

        .back-button {
            position: absolute;
            top: 25px;
            right: 35px;
        }

        .back-button a {
            text-decoration: none;
            background: rgba(255, 255, 255, 0.2);
            color: #ecf0f1;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 15px;
            font-weight: 600;
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
        }

        .back-button a:hover {
            background: #e74c3c;
            color: #fff;
            border-color: #e74c3c;
            transform: scale(1.05);
        }

        .change-photo {
            text-align: center;
            margin: 30px 0;
        }

        .change-photo label {
            font-size: 18px;
            color: #ecf0f1;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        }

        .divider {
            border-top: 1px solid rgba(236, 240, 241, 0.3);
            margin: 35px 0;
        }

        @media (max-width: 768px) {
            .profile-container {
                padding: 40px;
                margin: 20px;
            }

            .profile-picture {
                width: 160px;
                height: 160px;
            }

            h2 {
                font-size: 28px;
            }

            .btn {
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="profile-container">
            <div class="back-button">
                <a href="Dashboard.aspx">← Back to Dashboard</a>
            </div>

            <asp:Panel ID="pnlView" runat="server" Visible="true">
                <asp:Image ID="imgViewProfile" runat="server" CssClass="profile-picture" />
                <h2><asp:Label ID="lblViewFullName" runat="server" Text="Juan Dela Cruz"></asp:Label></h2>
                <div class="divider"></div>
                <div class="profile-info">
                    <div class="section-title"><i>📧</i> Email</div>
                    <div class="info-value"><asp:Label ID="lblViewEmail" runat="server" /></div>

                    <div class="section-title"><i>📞</i> Phone</div>
                    <div class="info-value"><asp:Label ID="lblViewPhone" runat="server" /></div>

                    <div class="section-title"><i>📜</i> Bio</div>
                    <div class="info-value"><asp:Label ID="lblViewBio" runat="server" /></div>

                    <div class="section-title"><i>🎯</i> Hobbies</div>
                    <div class="info-value"><asp:Label ID="lblViewHobbies" runat="server" /></div>
                </div>
                <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile" CssClass="btn btn-primary" OnClick="btnUpdateProfile_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlEdit" runat="server" Visible="false">
                <asp:Image ID="imgProfile" runat="server" CssClass="profile-picture" />
                <div class="change-photo">
                    <asp:Label ID="lblChangePhoto" runat="server" Text="Change Profile Photo:" Font-Bold="true"></asp:Label><br />
                    <asp:FileUpload ID="FileUploadProfile" runat="server" CssClass="edit-field" />
                </div>

                <div class="profile-info">
                    <label>Full Name:</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="edit-field" />

                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="edit-field" />

                    <label>Phone Number:</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="edit-field" />

                    <label>Bio:</label>
                    <asp:TextBox ID="txtBio" runat="server" CssClass="edit-field" TextMode="MultiLine" Rows="3" />

                    <label>Hobbies:</label>
                    <asp:TextBox ID="txtHobbies" runat="server" CssClass="edit-field" />

                    <label>Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="edit-field" TextMode="Password" />
                </div>
                <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="btnSaveChanges_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>