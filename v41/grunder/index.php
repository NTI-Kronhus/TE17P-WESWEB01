<?php // Output
echo "<h1>hej</h1>";
?>
<h1><?php echo "hej"; ?></h1>

<?php // Villkor i PHP
$namn = "Joakim";
if($namn == "Joakim"){
	echo "Hej Joakim, du är bäst!";
}
else{
	echo "Hej " . $namn;
}
?>

<?php // Loopar i php
for($i = 1 ; $i <= 10 ; $i++){
	echo $i . "<br>";
	// . == slå ihop strängar (konkatenering)
}

while(true){
	if($i++ == 20){
		break;
	}
	else{
		echo $i;
	}
}
?>


<?php // Koppla PHP till MySQL

// IP,användarnamn,lösenord,databas
$dbc_val = mysqli_connect("localhost","root","","val2014");

$query = "SELECT * FROM val2014;";

$result = mysqli_query($dbc_val,$query);

while($row = mysqli_fetch_array($result)){
	echo $row['valdistrikt']. "<br>";
}
?>
