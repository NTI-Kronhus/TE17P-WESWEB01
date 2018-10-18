<?php
session_start();

if(isset($_SESSION['login'])){
    if($_SESSION['login'] == true){
        header("location: index.php");
    }
}
else{
    $_SESSION['login'] = false;
}

if(isset($_POST['mail']) && isset($_POST['password'])){
    
    $dbc_form = mysqli_connect("localhost","root","","form");
    
    $mail = $_POST['mail'];
    $pass = $_POST['password'];
    
    $query = "SELECT * FROM register WHERE mail='$mail' AND password = '$pass'";
    
    $result = mysqli_query($dbc_form,$query);
    
    if(mysqli_num_rows($result) == 1){
        $row = mysqli_fetch_array($result);
        
        $_SESSION['login'] = true;
        $_SESSION['name'] = $row['name'];
        header("location: index.php");
    }
    else{
        $_SESSION['login'] = false;
        $_SESSION['error'] = "FEL UPPGIFTER!";
        header("location: index.php");
    }
    
}



?>