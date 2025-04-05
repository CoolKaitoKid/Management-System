<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ChurchPractice.LogIn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Church Management - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('Images/pastel.jpg') no-repeat center top;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
            overflow: hidden;
        }

        .card {
            width: 90%;
            max-width: 850px; /* Wider container */
            background: rgba(255, 255, 255, 0.1);
            border-radius: 28px;
            padding: 40px 50px;
            box-shadow: 0 0 50px rgba(187, 127, 185, 0.5);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 2px solid rgba(255, 255, 255, 0.25);
            animation: floatCard 6s ease-in-out infinite alternate;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: scale(1.01);
            box-shadow: 0 0 60px rgba(176, 112, 163, 0.7);
        }

        @keyframes floatCard {
            0% { transform: translateY(0); }
            100% { transform: translateY(-8px); }
        }

        .card h2 {
            font-family: 'Sitka Banner';
            font-size: 16px;
            font-style: oblique;
            font-weight: bold;
            color: #754d7f;
            margin-bottom: 18px;
        }

        .card h4 {
            font-weight: 600;
            font-size: 20px;
            color: #8b5e8e;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 600;
            font-size: 14px;
            color: #4b2e4e;
        }

        .form-control {
            border-radius: 12px;
            padding: 12px;
            font-size: 16px;
            background-color: rgba(255, 255, 255, 0.85);
            border: 1px solid #ccc;
        }

        .btn-primary {
            background-color: #b5679c;
            border: none;
            font-weight: bold;
            border-radius: 15px;
            padding: 14px;
            font-size: 17px;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #a1548e;
        }

        .text-link {
            color: #6b3e75;
            font-weight: bold;
            font-size: 14px;
            text-decoration: none;
        }

        .text-link:hover {
            text-decoration: underline;
        }

        .back-btn {
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

        .back-btn:hover {
            background-color: #ffeaa7;
            color: black;
        }

        .form-row {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
        }

        .form-col {
            flex: 1 1 48%;
        }

        @media (max-width: 768px) {
            .form-col {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <a href="Page.aspx" class="back-btn">&#8592; Back</a>

        <div class="card shadow text-center">
            <h2 style="font-family: Stencil; font-size: 30px; font-weight: bold; font-variant: small-caps; text-decoration: underline overline; color: #5c3d6b; margin-bottom: 8px;">
    Log In
</h2>


            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

            <div class="form-row text-start mb-4">
                <div class="form-col">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                </div>

                <div class="form-col">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>
                </div>
            </div>

            <div class="mb-4 d-flex justify-content-between align-items-center flex-wrap">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe" style="font-size: 14px;">Remember me</label>
                </div>
                <a href="Forgot.aspx" class="text-link">Forgot Password?</a>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn btn-primary w-100 mb-3" OnClick="btnLogin_Click" />

            <p class="text-link">Don't have an account? <a href="Register.aspx" class="text-link">Register</a></p>
        </div>
    </form>
</body>
</html>
