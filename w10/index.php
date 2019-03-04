<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>

<script src="script.js"></script>

<style>
    #square {
        background-color: red;
        width: 100px;
        height: 100px;
    }


</style>
<style>
.shopping_item{
	border:3px solid black;
	background-color:yellow;
	width:200px;
	height:100px;
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
<body>


    <div>
        <span id="price">0</span>kr
    </div>
   <div class="shopping_item" onmousedown='addToCart("glass")'>
    <p class="name"> Glass </p>
    <p class="price"> 20kr </p>
    </div>
    
    <div class="shopping_item" onmousedown="addToCart('pepsi')">
    <p class="name"> Pepsi </p>
    <p class="price"> 10kr </p>
    </div>
   
   
    <div id="test">
        <p>Hej</p>
    </div>

    <button onClick="updateContent()">Click Me</button>
    <br>
    <br>

    <div id="square" onmousedown="randomBg()">

    </div>


    
    <div id="textBox" onmousedown="changeSize()">
        text
    </div>
    
    
    <div id="liveclock">

        <p id="date"></p>
        <p id="time"></p>

    </div>
    
    
    
    
    
    

</body>

</html>
