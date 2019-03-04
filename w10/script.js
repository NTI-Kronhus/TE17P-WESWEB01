function updateContent() {

    document.getElementById("test").innerHTML = "<p> Joakim </p>";

}

function changeBgColor() {

    document.getElementById("square").style.backgroundColor = "blue";

}

function randomBg() {

    var r = Math.floor(Math.random() * 255);
    var g = Math.floor(Math.random() * 255);
    var b = Math.floor(Math.random() * 255);


    document.getElementById("square").style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";

}

function resetBgColor() {
    document.getElementById("square").style.backgroundColor = "red";

}

function updateClock() {
    var d = new Date();
    var t = new Date();
    document.getElementById("date").innerHTML = d.toLocaleDateString();
    document.getElementById("time").innerHTML = t.toLocaleTimeString();
}

setInterval(updateClock, 1000);


function addToCart(item) {

    if(item == "pepsi"){
        console.log("PEPSI");
        oldPrice = Number(document.getElementById("price").innerHTML);
        document.getElementById("price").innerHTML = 10 + oldPrice;
    }
    
    if(item == "glass"){
        console.log("GLASS");        
        oldPrice = Number(document.getElementById("price").innerHTML);
        document.getElementById("price").innerHTML = 20 + oldPrice;
    }
    
}

function changeSize() {

    if (document.getElementById("textBox").style.fontSize == "30px") {
        document.getElementById("textBox").style.fontSize = "50px";
    } else if (document.getElementById("textBox").style.fontSize == "50px") {
        document.getElementById("textBox").style.fontSize = "";
    } else {
        document.getElementById("textBox").style.fontSize = "30px";
    }

}
