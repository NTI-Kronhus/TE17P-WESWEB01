<link rel="stylesheet" href="css.css">
<?php

$dbc = mysqli_connect("localhost","root","","lab2");

$query = "SELECT * FROM cities JOIN countries ON cities.Country = countries.Country";
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