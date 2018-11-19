<link rel="stylesheet" href="css.css">

<form action="" method="GET">
    <input type="text" name="search">
    <input type="submit">
</form>


<form action="" method="GET">
    <input type="submit" value="City" name="order">
    <input type="submit" value="Countryname" name="order">
    <input type="submit" value="Population" name="order">
</form>




<?php

session_start();

$search = "";
if(isset($_GET['search'])){
    $search = $_GET['search'];
}

$order = "";
if(isset($_GET['order'])){
    if(isset($_SESSION['order']) && $_GET['order'] == $_SESSION['order']){
        $order = "ORDER BY " . $_GET['order'] . " DESC";
        $_SESSION['order'] = "";
    }
    else{
        $order = "ORDER BY " . $_GET['order'] . " ASC";
        $_SESSION['order'] = $_GET['order'];
    }
}

$dbc = mysqli_connect("localhost","root","","lab2");

$query = "SELECT * FROM cities JOIN countries ON cities.Country = countries.Country WHERE city LIKE '%$search%' OR countryname LIKE '%$search%' $order";

mysqli_query($dbc,"SET NAMES utf8"); // ändra charset från databasen
$result = mysqli_query($dbc,$query);

while($row = mysqli_fetch_array($result)){
    ?>
    <div class="container">
        <h1 class="city"><?php echo $row['AccentCity']; ?></h1>
        <p class="country"><?php echo $row['Countryname']; ?></p>
        <p class="population">Invånare: <?php echo $row['Population']; ?></p>
    </div>
    
<?php
}
?>