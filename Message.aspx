<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f7f8fc, #eef2f7);
            min-height: 100vh;
            margin: 0;
            padding: 20px 0;
            animation: fadeIn 1s ease-in-out;
        }

        .messaging-wrapper {
            display: flex;
            max-width: 1200px; /* Slightly wider */
            height: 90vh; /* Taller */
            margin: 0 auto;
            background: #fff;
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 12px 45px rgba(0, 0, 0, 0.12);
            animation: slideUp 0.8s ease forwards;
        }

        /* Chat List */
        .chat-list-container {
            width: 35%;
            background: #fafafa;
            border-right: 1px solid rgba(122, 111, 155, 0.15);
            overflow-y: auto;
            position: relative;
        }

        .chat-header {
            padding: 25px;
            background: linear-gradient(135deg, #7a6f9b, #9b91b7);
            color: #fff;
            font-size: 22px;
            font-weight: 700;
            font-family: 'Playfair Display', serif;
            display: flex;
            align-items: center;
            gap: 12px;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .chat-item {
            display: flex;
            align-items: center;
            padding: 18px 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }

        .chat-item:hover {
            background: #f5f5f5;
            transform: translateX(8px);
        }

        .chat-item.active {
            background: linear-gradient(135deg, #e8e8f0, #f0f0f5);
            border-left: 5px solid #7a6f9b;
        }

        .chat-item img {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            margin-right: 15px;
            border: 3px solid #7a6f9b;
            transition: transform 0.3s ease;
        }

        .chat-item:hover img {
            transform: scale(1.1);
        }

        .chat-item .chat-info {
            flex: 1;
        }

        .chat-item p {
            margin: 0;
            font-size: 16px;
            color: #3a3a5c;
            font-weight: 500;
        }

        .chat-item small {
            color: #888;
            font-size: 12px;
            display: block;
            margin-top: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px;
        }

        .chat-item .unread-count {
            background: #7a6f9b;
            color: #fff;
            font-size: 12px;
            padding: 4px 8px;
            border-radius: 12px;
            position: absolute;
            right: 25px;
            top: 50%;
            transform: translateY(-50%);
            transition: all 0.3s ease;
        }

        /* Message Area */
        .message-area {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .message-header {
            padding: 25px;
            background: linear-gradient(135deg, #7a6f9b, #9b91b7);
            color: #fff;
            font-weight: 700;
            font-size: 20px;
            font-family: 'Playfair Display', serif;
            display: flex;
            align-items: center;
            gap: 12px;
            justify-content: space-between;
        }

        .message-header .actions {
            display: flex;
            gap: 15px;
        }

        .message-header .action-btn {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: #fff;
            padding: 6px 12px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .message-header .action-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }

        .chat-box {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
            background: #fff;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .bubble {
            max-width: 70%;
            padding: 14px 20px;
            border-radius: 25px;
            font-size: 15px;
            line-height: 1.5;
            position: relative;
            animation: bubbleIn 0.4s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        .bubble .timestamp {
            font-size: 11px;
            color: #ccc;
            margin-top: 6px;
            text-align: right;
        }

        .sent {
            background: linear-gradient(135deg, #7a6f9b, #9b91b7);
            color: #fff;
            align-self: flex-end;
            border-bottom-right-radius: 8px;
        }

        .received {
            background: #e8ecef;
            color: #333;
            border-bottom-left-radius: 8px;
        }

        .typing-indicator {
            font-size: 13px;
            color: #888;
            font-style: italic;
            align-self: flex-start;
            margin-bottom: 15px;
            display: none;
            animation: pulse 1.5s infinite;
        }

        .input-box {
            padding: 25px;
            display: flex;
            gap: 20px;
            border-top: 1px solid rgba(122, 111, 155, 0.15);
            background: #fafafa;
        }

        .input-box input {
            flex: 1;
            padding: 14px 25px;
            border-radius: 30px;
            border: 1px solid #ccc;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        .input-box input:focus {
            border-color: #7a6f9b;
            box-shadow: 0 0 10px rgba(122, 111, 155, 0.3);
            outline: none;
        }

        .input-box button {
            padding: 14px 30px;
            background: #7a6f9b;
            color: #fff;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .input-box button:hover {
            background: #9b91b7;
            transform: scale(1.05);
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            font-size: 15px;
            margin-bottom: 30px;
            padding: 10px 20px;
            border-radius: 12px;
            font-weight: 500;
            color: #7a6f9b;
            background: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .back-button:hover {
            background: #f0f0f5;
            color: #9b91b7;
            transform: translateX(-8px);
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

        @keyframes bubbleIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { opacity: 0.6; }
            50% { opacity: 1; }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .messaging-wrapper {
                flex-direction: column;
                height: auto;
                max-width: 100%;
                margin: 20px 10px;
            }

            .chat-list-container {
                width: 100%;
                max-height: 40vh;
            }

            .message-area {
                height: auto;
            }

            .chat-box {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <a href="Dashboard.aspx" class="back-button">
            <i class="fas fa-arrow-left me-2"></i> Back to Dashboard
        </a>
    </div>

    <div class="messaging-wrapper">
        <!-- Chat List -->
        <div class="chat-list-container">
            <div class="chat-header"><i class="fas fa-envelope me-2"></i> Messages</div>
            <div class="chat-item active" data-chat="Fr. Michael" onclick="openChat('Fr. Michael')">
                <img src="Images/profile.jpg" alt="Fr. Michael">
                <div class="chat-info">
                    <p><strong>Fr. Michael</strong></p>
                    <small id="preview-Fr. Michael">Reminder: Bible study tomorrow.</small>
                </div>
                <span class="unread-count" id="unread-Fr. Michael">2</span>
            </div>
            <div class="chat-item" data-chat="Anna" onclick="openChat('Anna')">
                <img src="Images/mahal.jpg" alt="Anna">
                <div class="chat-info">
                    <p><strong>Anna</strong></p>
                    <small id="preview-Anna">Can I reschedule my event?</small>
                </div>
            </div>
            <div class="chat-item" data-chat="David" onclick="openChat('David')">
                <img src="Images/himm.png" alt="David">
                <div class="chat-info">
                    <p><strong>David</strong></p>
                    <small id="preview-David">Thank you for the charity drive.</small>
                </div>
                <span class="unread-count" id="unread-David">1</span>
            </div>
            <div class="chat-item" data-chat="Admin Announcements" onclick="openChat('Admin Announcements')">
                <img src="Images/black.jpg" alt="Admin">
                <div class="chat-info">
                    <p><strong>Admin</strong></p>
                    <small id="preview-Admin Announcements">Important community update.</small>
                </div>
            </div>
        </div>

        <!-- Message Area -->
        <div class="message-area">
            <div class="message-header" id="chatHeader">
                <span><i class="fas fa-user me-2"></i> Fr. Michael</span>
                <div class="actions">
                    <button class="action-btn" onclick="markAsRead()">Mark as Read</button>
                </div>
            </div>
            <div class="chat-box" id="chatBox">
                <div class="bubble received">Reminder: Bible study tomorrow at 7 PM.<div class="timestamp">10:30 AM</div></div>
                <div class="bubble received">Please bring your notebooks.<div class="timestamp">10:31 AM</div></div>
                <div class="typing-indicator" id="typingIndicator">Fr. Michael is typing...</div>
            </div>
            <div class="input-box">
                <input type="text" id="messageInput" placeholder="Type your message...">
                <button onclick="sendMessage()">Send</button>
            </div>
        </div>
    </div>

    <script>
        let currentChat = "Fr. Michael";
        const chatData = {
            "Fr. Michael": [
                { text: "Reminder: Bible study tomorrow at 7 PM.", time: "10:30 AM", type: "received" },
                { text: "Please bring your notebooks.", time: "10:31 AM", type: "received" }
            ],
            "Anna": [
                { text: "Can I reschedule my event?", time: "Yesterday, 2:45 PM", type: "received" }
            ],
            "David": [
                { text: "Thank you for the charity drive!", time: "2 days ago", type: "received" }
            ],
            "Admin Announcements": [
                { text: "Important community update: Meeting this Sunday.", time: "Today, 9:15 AM", type: "received" }
            ]
        };

        function openChat(name) {
            currentChat = name;
            document.getElementById("chatHeader").innerHTML = `<span><i class="fas fa-user me-2"></i> ${name}</span><div class="actions"><button class="action-btn" onclick="markAsRead()">Mark as Read</button></div>`;
            const chatBox = document.getElementById("chatBox");
            chatBox.innerHTML = ''; // Clear chat messages

            // Load existing messages
            const messages = chatData[name] || [];
            messages.forEach(msg => {
                let bubble = document.createElement("div");
                bubble.className = `bubble ${msg.type}`;
                bubble.innerHTML = `${msg.text}<div class="timestamp">${msg.type === "sent" ? new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) : msg.time}</div>`;
                chatBox.appendChild(bubble);
            });

            // Simulate typing indicator for Fr. Michael
            const typingIndicator = document.getElementById("typingIndicator");
            typingIndicator.style.display = name === "Fr. Michael" ? "block" : "none";
            if (name === "Fr. Michael") {
                setTimeout(() => typingIndicator.style.display = "none", 2000);
            }

            // Update active chat styling
            document.querySelectorAll(".chat-item").forEach(item => item.classList.remove("active"));
            document.querySelector(`.chat-item[data-chat="${name}"]`).classList.add("active");
            chatBox.scrollTop = chatBox.scrollHeight;
        }

        function sendMessage() {
            const input = document.getElementById("messageInput");
            const text = input.value.trim();
            if (text !== "") {
                const chatBox = document.getElementById("chatBox");
                let bubble = document.createElement("div");
                bubble.className = "bubble sent";
                const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                bubble.innerHTML = `${text}<div class="timestamp">${time}</div>`;
                chatBox.appendChild(bubble);

                // Update chat list preview and data
                if (!chatData[currentChat]) chatData[currentChat] = [];
                chatData[currentChat].push({ text, time, type: "sent" });
                document.getElementById(`preview-${currentChat}`).textContent = text;

                input.value = "";
                chatBox.scrollTop = chatBox.scrollHeight;

                // Simulate typing response for Fr. Michael
                if (currentChat === "Fr. Michael") {
                    const typingIndicator = document.getElementById("typingIndicator");
                    typingIndicator.style.display = "block";
                    setTimeout(() => {
                        typingIndicator.style.display = "none";
                        let reply = document.createElement("div");
                        reply.className = "bubble received";
                        const replyText = "Thanks for your message! I'll get back to you soon.";
                        reply.innerHTML = `${replyText}<div class="timestamp">${new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</div>`;
                        chatBox.appendChild(reply);
                        chatData[currentChat].push({ text: replyText, time: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }), type: "received" });
                        document.getElementById(`preview-${currentChat}`).textContent = replyText;
                        chatBox.scrollTop = chatBox.scrollHeight;
                    }, 1500);
                }
            }
        }

        function markAsRead() {
            const unread = document.getElementById(`unread-${currentChat}`);
            if (unread) unread.remove();
        }

        // Initialize with Fr. Michael's chat
        openChat("Fr. Michael");
    </script>
</body>
</html>