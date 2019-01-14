<?php

// Skapa array i PHP
$arr = ["Joakim","Ohlsson"];

// Gör om till en JSON-sträng
$str = json_encode($arr);

// Skapa cookie med en JSON-sträng
setcookie("name",$str,time() + 60*30);

// Avkoda JSON till en array i PHP och skriv ut
echo json_decode($_COOKIE['name'])[0];
echo "<br>";
echo json_decode($_COOKIE['name'])[1];
?>