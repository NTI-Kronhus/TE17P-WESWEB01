<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Formlär</title>
</head>

<body>

    <form action="submit.php" method="GET">

        <input type="text" name="name" required><br>
        <input type="password" name="password" required><br>
        <input type="email" name="mail" required><br>
        <input type="date" name="date"><br>

        <input type="radio" name="gender" value="male" required><br>
        <input type="radio" name="gender" value="female" required><br>

        <input type="checkbox" name="check1" value="alt1">alt1<br>
        <input type="checkbox" name="check2" value="alt2">alt2<br>
        <input type="checkbox" name="check3" value="alt3">alt3<br>
        <input type="checkbox" name="check4" value="alt4">alt4<br>

        <select name="car">
            <option value="1">Volvo</option>
            <option value="2">Saab</option>
            <option value="3">Ferrari</option>
            <option value="4">Opel</option>
            <option value="5">Audi</option>
        </select><br>

        <input type="submit">

    </form>





</body>

</html>
