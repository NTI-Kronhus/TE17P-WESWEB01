<?php

$dbc_form = mysqli_connect("localhost","root","","form");

if(isset($_GET['name']) && isset($_GET['age']) && isset($_GET['mail']) && isset($_GET['username']) && isset($_GET['phone']) && isset($_GET['gender'])){
    
    $name = $_GET['name'];
    $age = $_GET['age'];
    $mail = $_GET['mail'];
    $username = $_GET['username'];
    $phone = $_GET['phone'];
    $gender = $_GET['gender'];

    $query = "INSERT INTO register (name,age,mail,username,phone,gender) VALUES ('$name',$age,'$mail','$username','$phone','$gender')";

    mysqli_query($dbc_form,$query);
    
    echo "Tack $name! Du är nu registrerad!";
}
else{
    // Fel information, Skickas tillbaka till index.php
    header("location: index.php");
}


    
    
    
    
    

?>




