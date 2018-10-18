<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    
    
    <?php
    session_start();
    
    if(isset($_SESSION['login'])){
        if($_SESSION['login'] == true){
    
            echo "HEJ " . $_SESSION['name'];
            ?>
             DU ÄR INLOGGAD! <br>
            <form action="logout.php">
                <input type="submit" value="Logga ut">
            </form>
            
            <?php
            
        }
        else{
            if(isset($_SESSION['error'])){
                echo $_SESSION['error']. "<br>";
                unset($_SESSION['error']);
            }
            ?>
           <div style="border:2px solid black">
        REGISTRERA:
        <form action="register.php" method="POST">
            Name:<input type="text" name="name"><br>
            Mail:<input type="email" name="mail"><br>
            Password:<input type="password" name="password"><br>
            <input type="submit">
        </form>
        </div>

         <div style="border:2px solid black">
        LOGGA IN:
        <form action="login.php" method="POST">
            Mail:<input type="email" name="mail"><br>
            Password:<input type="password" name="password"><br>
            <input type="submit">
        </form>
        </div>
           <?php
            
            
        }
    }
    else{
        $_SESSION['login'] = false;
        header("location: index.php");
    }
    ?>
    
</body>
</html>