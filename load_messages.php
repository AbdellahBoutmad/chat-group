<?php
try {
    $pdo = new PDO("mysql:host=localhost;dbname=chat_app;charset=utf8mb4", "abdellah", "Woed@8485");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->query("SELECT * FROM messages ORDER BY timestamp DESC");
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<div><strong>{$row['username']}:</strong> {$row['message']} </div>";
    }
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>