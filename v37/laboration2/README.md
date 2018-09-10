# Laboration #2 i MySQL

1. Skapa en ny databas och välj den sedan med kommandot USE. <br>
  Läs sedan in filerna countries.sql och cities.sql som finns i denna mapp. <br>
  Skriv```SOURCE``` följt av sökvägen till de två ovanstående filerna som du laddat hem.<br>
  Exempel:
```
CREATE DATABASE lab2; 
USE lab2; 
SOURCE "C:/Users/elev/Desktop/cities.sql"
SOURCE "C:/Users/elev/countries.sql"
```
2. Testa nu att undersöka vad som finns i de olika tabellerna och hur de är uppbyggda. *(```EXPLAIN``` och ```SELECT```)*

## Nu ska vi leka lite med de inbyggda kommandona i MySQL.<br> De kommandon vi kommer jobba med är följande:
```
SUM(kolumn) - Räknar ut summan av en hel kolumn från ett resultat.
COUNT(kolumn) - Räknar antalet rader i en kolumn från ett resultat.
CONCAT(string1,string2...) - Slår ihop två eller flera strängar till en sträng.
CAST(kolumn AS datatyp) - Används för att omvandla data mellan olika datatyper.
MIN(kolumn) - Returnerar det minsta värdet i en kolumn från ett resultat.
MAX(kolumn) - Returnerar det högsta värdet i en kolumn från ett resultat.
ABS(värde) - Returnerar absolutbeloppet av ett värde.
```
Sedan har vi alla räknesätt så klart:
```
/ - Division
* - Multiplikation
+ - Addition
- - Subtratkion
```

### SUM()
Testa nu att summera kolumnen population i tabellen cities genom att skriva:<br>
``` SELECT SUM(population) FROM cities; ```<br>
*Observera att kolumnens namn i resultatet nu heter: ```SUM(population)``` vilket inte är ett så snyggt namn på en kolumn...*<br>
Vi kan dock ändra namn på den med kommandot ```AS```.<br>
Då skriver vi så här:```SELECT SUM(population) AS Världspopulation FROM cities;```

### COUNT()
Vill vi hämta antalet städer i tabellen cities kan vi använda ```COUNT()```.<br>
```SELECT COUNT(city) AS "Antal städer" FROM cities;```<br>
```COUNT()``` och ```SUM()``` är exempelvis bra när vi vill räkna ut medel av någon data.
För om vi här delar totalen med antal rader så får vi ju medelpopulationen för alla städer:
```SELECT SUM(population)/COUNT(city) AS Medelpopulation FROM cities;```

### CAST()
Vill vi ta bort decimalerna får vi använda kommandot ```CAST()```.<br>
  ```CAST()``` är lite konstigt i det aspektet att man omvandlar ju data mellan olika datatyper men de datatyperna heter konstigt nog inte samma som när vi skapar tabeller... <br>
  För att göra om till en sträng använder man ```CHAR``` och för att göra om till siffror använder man ```DECIMAL```.
Hur som helst, om vi innesluter ```SUM(population)/COUNT(city)``` innanför ```CAST()``` och gör om det till datatypen ```DECIMAL``` så kan vi även specificera hur många decimaler som ska vara med. Här är ett exempel:<br>
```SELECT CAST(SUM(population)/COUNT(city) AS DECIMAL(0)) AS Medelpopulation FROM cities;```

```DECIMAL(0)``` betyder att vi gör om ett tal eller sträng till ett heltal. Vill man ha till exempel exakt 3 siffror kan man byta ut 0:an mot en 3:a. Vill man ha X antal decimaler så lägger man till ett argument som motsvarar hur många decimaler man vill ha.
Exempel: ```CAST(123.456 AS DECIMAL(5,2))``` blir då 123.46 <br>
5 står för hur många siffror totalt och 2 är alltså hur många av dem som är decimaler.
Alltså måste alltid den första siffran vara större än den sista. *(Du kan ju inte ha fler decimaler än siffror eftersom en decimaltal är en siffra)*

### MIN() och MAX()
```MIN()``` och ```MAX()``` returnerar, som man kan gissa, det minsta respektive det högsta värdet i en kolumn. <br>
Testa att hämta endast population för den stad med minst respektive högst population!

### ABS()
```ABS()``` returnerar absolutbeloppet av varje tal i en kolumn. *D.v.s. alla negativa tal blir positiva.*

### CONCAT()
```CONCAT()``` slår ihop strängar till en gemensam sträng. Det kan exempelvis användas om man har varsin kolumn för för- och efternamn och vill ha det tillsammans i en kolumn.
``` SELECT CONCAT(förnamn," ",efternamn) AS namn FROM personer;```


# Nu ska vi kolla på Alias och Join!

### Alias (AS)
Alias används, som vi gjorde ovan, för att döpa om en tabell eller kolumn så den blir lättare att hantera eller förstå. <br>
Alias MÅSTE även användas ifall du vill ställa en fråga på ett resultat.<br>
Exempelvis: ```SELECT First_name, Mail FROM (SELECT * FROM Customers) AS result;```<br>
*(Vilket för övrigt är exakt samma som att hämta First_name och Mail från Customers…)*<br>
Alias skrivs alltså ```AS``` i SQL. Med andra ord: Man döper om ett resultat eller en kolumn.

### JOIN
Kommandot ```JOIN``` däremot används för att slå ihop två tabeller med varandra. Och är extremt användbart när man jobbar med relationsdatabaser! Syntaxen för ```JOIN``` lyder som följande:<br>
```Tabell1 JOIN Tabell2 ON Tabell1.kolumn=Tabell2.kolumn; ```<br>
Den kommer alltså slå ihop tabell1 med tabell2 på alla värden där efterföljande villkor stämmer. Och man kan självklart ha fler villkor genom att lägga till ```OR``` eller ```AND```.
Observera att detta bara genererar ett resultat som är en tabell vilken man självklart måste hämta data ifrån. Så ```SELECT``` ska stå innan ```JOIN```. Fullständigt exempel:<br>
```SELECT * FROM cities JOIN countries ON cities.country = countries.country;```<br>
D.v.s. Vi hämtar alla rader ifrån resultatet av de två tabellerna vi slagit ihop. <br>Om vi skulle vilja specificera vilka kolumner vi vill titta på så måste vi specificera vilken tabell också. Exempel:<br>
```SELECT p.Price FROM Order_details AS od JOIN Products AS p ON p.Product_number=od.Product_number;```<br>
Observera att jag har döpt om Order_details till od och Products till p vilket gör det kortare att skriva!


### GROUP / ORDER:
Alla resultat vi får kan vi sortera och gruppera utefter en, eller flera kolumner.
Kommandot ```ORDER BY``` säger nästan sig självt, att man ordnar sitt resultat efter en viss kolumn. <br>
T.ex. att man ordnar sitt resultat efter en kolumn med namn i bokstavsordning.

```ORDER BY kolumnnamn (DESC/ASC);``` - Sorterar resultatet efter en kolumn med stigande/fallande ordning. Funkar på både bokstäver och siffror.
```GROUP BY kolumnnamn;``` - Returnerar informationen så att varje unikt resultat i en kolumn bara förekommer EN gång. Detta är extremt användbart när man använder t.ex. ```SUM()``` och ```COUNT()``` som i sig själva bara returnerar en rad. Men tillsammans med ```GROUP BY``` så kan du exempelvis summera alla rader med ett visst unikt kolumnvärde.


### LIMIT
Det sista kommandot vi ska kolla på är ```LIMIT x```. Det är något man kan lägga till sist i sin fråga så kommer man bara få de x översta raderna från sitt resultat.




## Uppgifter:

### Vad ska man skriva för att...
1. Hämta de 10 största städerna från cities, sett till population?
2. Slå ihop cities med countries där country är samma för båda?
3. Hämta en tabell med enbart fullständigt namn på land och stad?
4. Hämta den stad som ligger närmast ekvatorn? (Latitude)
5. Hämta en tabell med totala populationen i varje land?
6. Hämta en tabell med medelstads-populationen för varje land?
7. Hämta det landsnamn som har den minsta staden i vår tabell?
8. Hämta alla länder som börjar på bokstaven S?
9. Hämta den största staden som börjar på A?
10. Hämta den stad som ligger närmast samma breddgrad som Stockholm? (Latitude)
11. Hämta den stad som ligger längst norrut?
12. Hämta den stad som har närmast samma population som Stockholm?

### Svårare uppgifter:
13. Hämta den stad med störst population i varje unikt land?
14. Hämta den stad som ligger närmast Berlin fågelvägen?
