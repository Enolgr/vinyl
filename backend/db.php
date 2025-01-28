<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "vinylstore";

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);


// Verificar la conexión
if ($conn->connect_error) {
    die(json_encode(array("success" => false, "error" => "Conexión fallida: " . $conn->connect_error)));
}

