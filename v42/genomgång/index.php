<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
    input{
        margin:5px;
    }
    </style>
</head>
<body>
    
    <form action="submit.php" method="POST/GET">
        
        Namn: <input type="text" name="name" required><br>
        Ålder: <input type="number" name="age"><br>
        Mail: <input type="email" name="mail"><br>
        Användarnamn: <input type="username" name="username"><br>
        Telefon: <input type="tel" name="phone"><br>
        Man <input type="radio" name="gender" value="male">
        Kvinna <input type="radio" name="gender" value="female"><br>
        <input type="submit" value="Registrera">
    </form>
    
    
</body>
</html>