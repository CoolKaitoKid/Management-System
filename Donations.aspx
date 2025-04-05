<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        .container {
            display: flex;
            flex-direction: row;
            gap: 20px;
            align-items: flex-start;
            max-width: 900px;
            width: 100%;
            margin-left: 300px;
        }
        .donation-container, .donation-list {
           
            background:linear-gradient(135deg, #b8c1ec, #a0b4d4);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
           
            margin-top: 150px;
            height: 350px;
            
            margin-right: 30px;
        }
        .donation-list {
            border-top: 5px solid #000000;
            overflow-y: auto;
            width: 600px;
        }
        .donation-container {
            border-top: 5px solid #000000;
            width:400px;
        }
        .btn-primary {
            background-color: #b5679c;
            border-color: #b5679c;
        }
        .btn-primary:hover {
            background-color: #9b4e85;
            border-color: #9b4e85;
        }
        .table-dark {
            background-color: #b5679c !important;
        }
        .payment-option {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }
        .payment-option img {
            width: 30px;
            height: 30px;
        }
        
        
        .footer {
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
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(10px);}
            to {opacity: 1; transform: translateY(0);}
        }

        @keyframes slideUp {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
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
            <a href="History.aspx"><i class="fas fa-church me-2"></i>Church History</a>
            <a href="Event.aspx"><i class="fas fa-calendar-alt me-2"></i>Event Handling</a>
            <a href="Member.aspx"><i class="fas fa-users me-2"></i>Member Directory</a>
            <a href="Donations.aspx" class="active"><i class="fas fa-hand-holding-heart me-2"></i>Donations</a>
            <a href="Feedback.aspx"><i class="fas fa-comments me-2"></i>Feedbacks</a>
            <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
        </div>

    <div class="container">
        <div class="donation-list">
            <h3 class="text-center">Recent Donations</h3>
            <table class="table table-bordered mt-3" id="donationTable">
                <thead class="table-dark text-white">
                    <tr>
                        <th>Reference No.</th>
                        <th>Name</th>
                        <th>Amount</th>
                        <th>Payment Method</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>123456789</td>
                        <td>John Doe</td>
                        <td>₱5000</td>
                        <td>GCash</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="donation-container">
            <h2 class="text-center">Make a Donation</h2>
            <form id="donationForm">
                <input type="text" id="donorName" class="form-control mt-2" placeholder="Full Name" required>
                <input type="number" id="donationAmount" class="form-control mt-2" placeholder="Amount (PHP)" required>
                <select id="paymentMethod" class="form-control mt-2" required>
                    <option value="">Select Payment Method</option>
                    <option value="GCash">GCash</option>
                    <option value="PayMaya">PayMaya</option>
                </select>
                
                <button type="submit" class="btn btn-primary mt-2 w-100">Donate</button>
                <p class="mt-3 text-muted text-center fst-italic small">Every Gift Counts — Make a Difference Today.</p>
            </form>
        </div>
    </div>
    
    <div class="modal fade" id="receiptModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="border-radius: 15px; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);">
            <div class="modal-header" style="background: linear-gradient(135deg, #6d5ba8, #8e7cc3); border-bottom: none; padding: 20px;">
                <h5 class="modal-title" style="font-family: 'Playfair Display', serif; color: #fff; font-size: 24px;">
                    <i class="fas fa-receipt me-2"></i> Donation Receipt
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="filter: brightness(0) invert(1);"></button>
            </div>
            <div class="modal-body" style="padding: 25px; background: #fff; font-family: 'Poppins', sans-serif;">
                <div style="text-align: center; margin-bottom: 20px;">
                    <i class="fas fa-check-circle" style="font-size: 40px; color: #4caf50;"></i>
                    <p style="color: #666; font-size: 14px; margin-top: 10px;">Thank you for your generous contribution!</p>
                </div>
                <div style="background: #f9f9ff; padding: 15px; border-radius: 10px; border: 1px solid rgba(109, 91, 168, 0.1);">
                    <p style="margin: 10px 0; color: #3a3a5c;"><strong>Reference Number:</strong> <span id="refNumber" style="color: #6d5ba8; font-weight: 500;"></span></p>
                    <p style="margin: 10px 0; color: #3a3a5c;"><strong>Donor Name:</strong> <span id="receiptName" style="color: #6d5ba8; font-weight: 500;"></span></p>
                    <p style="margin: 10px 0; color: #3a3a5c;"><strong>Amount:</strong> ₱<span id="receiptAmount" style="color: #6d5ba8; font-weight: 500;"></span></p>
                    <p style="margin: 10px 0; color: #3a3a5c;"><strong>Payment Method:</strong> <span id="receiptMethod" style="color: #6d5ba8; font-weight: 500;"></span></p>
                    <p style="margin: 10px 0; color: #3a3a5c;"><strong>Date:</strong> <span id="receiptDate" style="color: #6d5ba8; font-weight: 500;"></span></p>
                </div>
            </div>
            <div class="modal-footer" style="border-top: none; padding: 15px 25px; background: #fff;">
                <button type="button" class="btn" data-bs-dismiss="modal" style="background: #6d5ba8; color: #fff; padding: 10px 20px; border-radius: 8px; font-weight: 500; transition: all 0.3s ease;">
                    Okay
                </button>
            </div>
        </div>
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
     <footer class="footer">
     <p>&copy; 2025 Basilica Regia. All Rights Reserved.</p>
     </footer>
    
    <script>
        function logout() {
            window.location.href = "LogIn.aspx";
        }
        document.getElementById("donationForm").addEventListener("submit", function (event) {
            event.preventDefault();
            const donorName = document.getElementById("donorName").value;
            const donationAmount = document.getElementById("donationAmount").value;
            const paymentMethod = document.getElementById("paymentMethod").value;
            const refNumber = Math.floor(Math.random() * 1000000000);
            const currentDate = new Date().toLocaleString();

            const table = document.getElementById("donationTable").getElementsByTagName('tbody')[0];
            const newRow = table.insertRow();
            newRow.innerHTML = `<td>${refNumber}</td><td>${donorName}</td><td>₱${donationAmount}</td><td>${paymentMethod}</td>`;

            document.getElementById("receiptName").textContent = donorName;
            document.getElementById("receiptAmount").textContent = donationAmount;
            document.getElementById("receiptMethod").textContent = paymentMethod;
            document.getElementById("receiptDate").textContent = currentDate;
            document.getElementById("refNumber").textContent = refNumber;

            new bootstrap.Modal(document.getElementById('receiptModal')).show();

            document.getElementById("donationForm").reset();
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
