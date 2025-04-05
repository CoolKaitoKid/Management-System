<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ChurchManagementSystem.Register" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Church Management - Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('Images/pastel.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            width: 480px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 25px;
            padding: 25px 30px; /* slightly reduced */
            box-shadow: 0 0 40px rgba(187, 127, 185, 0.4);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1.5px solid rgba(255, 255, 255, 0.2);
        }

        .card h2 {
            font-family: Stencil;
            font-size: 32px; /* slightly reduced */
            font-weight: bold;
            font-variant: small-caps;
            text-decoration: underline overline;
            color: #5c3d6b;
            margin-bottom: 8px;
        }

        .card h4 {
            font-family: 'Sitka Banner';
            font-size: 16px;
            font-style: oblique;
            font-weight: bold;
            color: #754d7f;
            margin-bottom: 18px;
        }

        .form-label {
            font-weight: 600;
            color: #4b2e4e;
            font-size: 14px;
            margin-bottom: 4px;
        }

        .form-control {
            border-radius: 10px;
            padding: 8px;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.85);
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .btn-primary {
            background-color: #b5679c;
            border: none;
            font-weight: bold;
            border-radius: 12px;
            padding: 10px;
            font-size: 15px;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #a1548e;
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
            gap: 15px;
            margin-bottom: 10px;
        }

        .form-col {
            flex: 1;
        }

        .text-link {
            color: #6b3e75;
            font-weight: bold;
            font-size: 13px;
            text-decoration: none;
        }

        .text-link:hover {
            text-decoration: underline;
        }

        .asp-button-wrapper {
            margin-top: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Back Button -->
        <a href="Page.aspx" class="back-btn">&#8592; Back</a>

        <div class="card text-center">
            <h2>Register</h2>
          
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <div class="card-body text-start">
                <div class="form-row">
                    <div class="form-col">
                        <label class="form-label">First Name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" Placeholder="First Name"></asp:TextBox>
                    </div>
                    <div class="form-col">
                        <label class="form-label">Last Name</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" Placeholder="Last Name"></asp:TextBox>
                    </div>
                </div>

                <label class="form-label">Contact Number</label>
                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" Placeholder="Enter Contact Number"></asp:TextBox>

                <label class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>

                <label class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>

                <label class="form-label">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirm Password"></asp:TextBox>

                <div class="asp-button-wrapper">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary w-100" OnClick="btnRegister_Click" />
                </div>

                <div class="text-center">
                    <a href="login.aspx" class="text-link">Already have an account? Log in</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
