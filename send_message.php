<?php
session_start();

if (!isset($_SESSION['username'])) {
    die("Unauthorized");
}

$message = htmlspecialchars($_POST['message']);

try {
    $dsn = "mysql:host=localhost;dbname=chat_app;charset=utf8mb4";
    $pdo = new PDO($dsn, "abdellah", "Woed@8485");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->prepare("INSERT INTO messages (username, message) VALUES (:username, :message)");
    $stmt->execute([
        ':username' => $_SESSION['username'],
        ':message' => $message
    ]);

} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>
