<?php

if(isset($_POST['name']) && isset($_POST['mail']) && isset($_POST['password'])){
    
    $dbc_form = mysqli_connect("localhost","root","","form");
    
    $name = $_POST['name'];
    $mail = $_POST['mail'];
    $pass = $_POST['password'];
    
    $query = "INSERT INTO register (name,mail,password) VALUES ('$name','$mail','$pass')";
    
    mysqli_query($dbc_form,$query);
    
    header("location: index.php");

    
}



?>