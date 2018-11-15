<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>

<table>
    
<?php
session_start();
    
$dbc_lab2 = mysqli_connect("localhost","root","","lab2");
$ORDER_BY = "";

if(isset($_SESSION['order']) && isset($_SESSION['sort'])){
    $column = $_SESSION['order'];
    $sort = $_SESSION['sort'];
    $ORDER_BY = "ORDER BY $column $sort";
}

$limit = 20;
$offset = 0;
$search = "";

if(isset($_GET['offset'])){
    $offset = $_GET['offset'];
}

$query = "SELECT City,Population,Countryname FROM cities JOIN countries ON cities.country = countries.country " . $ORDER_BY . " LIMIT $limit OFFSET $offset";

$result = mysqli_query($dbc_lab2,$query);    
$rows = mysqli_num_rows($result);

echo "<tr>
<td><a href='ordercountry.php'>LAND</a> </td>
<td><a href='ordercity.php'>STAD</a> </td>
<td><a href='orderpop.php'>BEFOLKNING</a></td><tr>";

for($i = 0 ; $i < $rows; $i++){
    echo "<tr>";
    $row = mysqli_fetch_array($result);

    echo "<td>" . $row['Countryname'] . "</td>";
    echo "<td>" . $row['City'] . "</td>";
    echo "<td>" . $row['Population'] . "</td>";
    
    echo "</tr>";
}


?>

<tr>
<td>
<a href="index.php?offset=<?php 
         if($offset-$limit < 0){
             echo "0";
         }else{
            echo $offset-$limit; 
         }
         ?>">Bakåt</a>
</td>
<td>
</td>
<td>
<a href="index.php?offset=<?php 
          if($offset+$limit > 278){
             echo $offset;
         }else{
            echo $offset+$limit; 
         }
         ?>">Nästa</a>
</td>
</tr>
</table>
</body>
</html>
