<?php
session_start();
include 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$username = $_SESSION['username'];

$query = $conn->query("SELECT messages.user_id, messages.message, users.username FROM messages JOIN users ON messages.user_id = users.id ORDER BY messages.created_at ASC");
$messages = $query->fetch_all(MYSQLI_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Live Global Chat</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: rgb(166, 166, 239);
        }

        #welcome-message {
            text-align: center;
            padding: 10px;
            text-transform: uppercase;
            position: absolute;
            top: 20px;
            left: 20px;
        }

        #chat-container {
            margin: 150px auto;
            background-color: rgba(0, 0, 69, 0.416);
            padding: 30px;
            border-radius: 5px;
            max-width: 80%;
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        #messages {
            max-height: 400px;
            overflow-y: auto;
            margin-bottom: 10px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .message {
            padding: 10px;
            border-radius: 10px;
            max-width: 60%;
            word-wrap: break-word;
        }

        .user-message {
            background-color: #DCF8C6;
            align-self: flex-end;
            text-align: right;
            margin-right: 10px;
        }

        .other-user-message {
            background-color: #E4E4E4;
            align-self: flex-start;
            text-align: left;
        }

        .username {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .message-text {
            font-size: 16px;
        }

        #message-form, #logout-form {
            display: flex;
            flex-direction: column;
            margin-top: 10px;
        }

        #message-form input[type="text"] {
            margin-bottom: 10px;
            padding: 10px;
        }

        button {
            padding: 10px;
            width: 98%;
            font-size: 16px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div id="welcome-message">
        <h1>WELCOME: <?php echo htmlspecialchars($username); ?></h1>
    </div>

    <div id="chat-container">
        <div id="messages">
            <?php foreach ($messages as $message): ?>
                <?php
                $messageClass = ($message['user_id'] == $user_id) ? 'user-message' : 'other-user-message';
                ?>
                <div class="message <?php echo $messageClass; ?>">
                    <span class="username"><?php echo htmlspecialchars($message['username']); ?></span>
                    <span class="message-text"><?php echo htmlspecialchars($message['message']); ?></span>
                </div>
            <?php endforeach; ?>
        </div>
        <form id="message-form">
            <input type="text" id="message" placeholder="Type a message..." required>
            <button type="submit">Send</button>
        </form>
        <form id="logout-form" action="logout.php" method="POST">
            <button type="submit">Logout</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="scripts.js"></script>
</body>
</html>
