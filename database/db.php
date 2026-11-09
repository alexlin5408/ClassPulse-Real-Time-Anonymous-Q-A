<?php
$conn = new mysqli(
    getenv('DB_HOST')     ?: 'localhost',
    getenv('DB_USER')     ?: 'classpulse',
    getenv('DB_PASSWORD') ?: 'classpulse',
    getenv('DB_NAME')     ?: 'classpulse'
);
$conn->set_charset('utf8mb4');