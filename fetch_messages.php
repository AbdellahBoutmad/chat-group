<?php
session_start();
include 'db.php';

$user_id = $_SESSION['user_id'];


$query = $conn->query("SELECT messages.user_id, messages.message, users.username FROM messages JOIN users ON messages.user_id = users.id ORDER BY messages.created_at ASC");
$messages = $query->fetch_all(MYSQLI_ASSOC);

foreach ($messages as $message) {
    $messageClass = ($message['user_id'] == $user_id) ? 'user-message' : 'other-user-message';
    echo '<div class="message ' . $messageClass . '">';
    echo '<span class="username">' . htmlspecialchars($message['username']) . '</span>';
    echo '<span class="message-text">' . htmlspecialchars($message['message']) . '</span>';
    echo '</div>';
}

$conn->close();
?>
