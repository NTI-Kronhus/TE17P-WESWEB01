
<style>
.shopping_item{
	border:3px solid black;
	background-color:yellow;
	width:200px;
	height:300px;
	float:left;
	margin:20px;
}
.shopping_item img{
	width:200px;
	height:200px;
}
.name{
	width:200px;
	height:50px;
	font-size:20px;
	text-align:center;	
}
p{
	margin:0px;
}
.price{
	width:100px;
	height:50px;
	font-size:30px;
	text-align:center;
	color:red;	
}
</style>

<?php

$dbc_webshop = mysqli_connect("localhost","root","","webshop");

$result = mysqli_query($dbc_webshop,"SELECT * FROM produkter ORDER BY pris DESC ");

while($row = mysqli_fetch_array($result)){
	
?>
<div class="shopping_item">
<img src ="placeholder.jpg" />
<p class="name"> <?php echo $row['namn'];?> </p>
<p class="price"> <?php echo $row['pris'];?>kr </p>
</div>
<?php
}
?>	
