<?php

// Skapa $_COOKIE['login'] i 5 sekunder
setcookie("login","inte inloggad",time() + 5);

header("Location: index.php");

?>