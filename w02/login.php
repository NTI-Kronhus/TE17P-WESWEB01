<?php

// Skapa $_COOKIE['login'] i 30 minuter
setcookie("login","inloggad",time() + 60*30);

header("Location: index.php");

?>