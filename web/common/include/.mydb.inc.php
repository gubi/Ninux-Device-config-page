<?php
$host = "localhost" // IP address of database server
$database = "" // Database name
$username = "" // Database username
$password = "" // Database password
$pdo = new PDO("mysql:host=" . $host . ";dbname=" . $database, $username, $password);
?>