<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="ChurchPractice.Forgot" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Church Management - Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('Images/pastel.jpg') no-repeat center center;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
            position: relative;
        }

        /* Back Button - Upper Left */
        .btn-back {
               position: absolute;
                top: 20px;
                left: 40px;
                color: white;
                font-weight: bold;
                text-decoration: none;
                background-color: rgba(0, 0, 0, 0.4);
                padding: 8px 15px;
                border-radius: 8px;
                transition: background 0.3s;
                z-index: 100;
        }

        .btn-back:hover {
            background: rgba(255, 255, 255, 0.4);
            color: #a1548e;
        }

        .card {
            width: 90%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 0 25px rgba(187, 127, 185, 0.5);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 2px solid rgba(255, 255, 255, 0.25);
            text-align: center;
            color: #4b2e4e;
        }

        .form-label {
            font-weight: 600;
        }

        .form-control {
            border-radius: 12px;
            padding: 12px;
            font-size: 16px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background: linear-gradient(135deg, #b5679c, #a1548e);
            border: none;
            font-weight: bold;
            border-radius: 15px;
            padding: 12px;
            font-size: 17px;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #a1548e, #913b79);
        }
    </style>
</head>
<body>
    <a href="LogIn.aspx" class="btn-back">← Back</a>

    <form id="form1" runat="server">
        <div class="card">
            <h2 class="mb-3">Forgot Password</h2>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <!-- Email Input -->
            <div id="divEmail" runat="server">
                <label class="form-label">Enter your email address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter your email"></asp:TextBox>
                <asp:Button ID="btnReset" runat="server" Text="Send Code" CssClass="btn btn-primary w-100 mt-3" OnClick="btnReset_Click" />
            </div>

            <!-- Verification Code Input -->
            <div id="divVerification" runat="server" visible="false">
                <label class="form-label mt-3">Enter Verification Code</label>
                <asp:TextBox ID="txtVerificationCode" runat="server" CssClass="form-control" Placeholder="Enter code"></asp:TextBox>
                <asp:Button ID="btnVerify" runat="server" Text="Verify Code" CssClass="btn btn-primary w-100 mt-3" OnClick="btnVerify_Click" />
            </div>

            <!-- Password Reset Fields -->
            <div id="divResetPassword" runat="server" visible="false">
                <label class="form-label mt-3">Enter New Password</label>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="New password"></asp:TextBox>
                
                <label class="form-label mt-3">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm password"></asp:TextBox>
                
                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-primary w-100 mt-3" OnClick="btnChangePassword_Click" />
            </div>
        </div>
    </form>
</body>
</html>
