<?php

if(isset($_COOKIE['login'])){
   echo "Du är " . ($_COOKIE['login']);    
}
else{
    echo "Ingen cookie";
}

?>

<br>
<a href="login.php">Logga in</a>
<a href="logout.php">Logga ut</a>