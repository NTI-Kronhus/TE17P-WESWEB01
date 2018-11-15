<?php
session_start();

if(isset($_SESSION['order']) && $_SESSION['order'] == "City"){
    if( $_SESSION['sort'] == "ASC"){
        $_SESSION['sort'] = "DESC";
    }
    else if( $_SESSION['sort'] == "DESC"){
        $_SESSION['sort'] = "ASC";
    }
}
else{
    $_SESSION['order'] = "City";
    $_SESSION['sort'] = "ASC";
}

header("Location: index.php");

?>