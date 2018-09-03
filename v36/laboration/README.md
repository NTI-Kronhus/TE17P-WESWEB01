# Laboration #1 i MySQL

## Steg 1:
1. För att kunna börja arbeta med våra databaser måste vi starta vår databasmodul på vår webserver. <br>
Det gör vi genom att **starta XAMPP Control Panel och klickar på start till höger om modulen MySQL.** 
2. När vi har startat vår server kan vi öppna kommandoprompten för just MySQL. <br>
Det gör vi genom att **klicka på knappen Shell** i menyn till höger på XAMPP Control Panel.
3. Nu är vi inne i kommandoprompten för servern men för att kunna komma in till vår databasmodul måste vi logga in i den med kommandot:<br> 
``` mysql -u root ```
4. Massa välkomsttext visas då förhoppningsvis och om du gjort rätt så ska din kommandoprompt visa följande rad: <br>
``` 
MariaDB [(none)]> 
```


## Steg 2:
1. När vi är i kommandoprompten så måste vi avsluta varje förfrågan med ett ```;``` som skrivs med Shift+komma.
2. Testa skriv:
``` SHOW DATABASES ``` *(utan semikolon)* <br>
Prompten visar då: <br>
``` 
MariaDB [(none)]> SHOW DATABASES
->             
```
3. Men om du nu skriver ett ```;``` så kommer frågan att skickas iväg och vi får se vilka databaser som just nu finns på vår webserver.<br>
*Har man inte skapat en databas sedan tidigare borde man se 5 st databaser.*



## Steg 3:
1. Nu ska vi skapa en egen databas som vi kallar intro med kommandot: ```CREATE DATABASE intro;``` <br>
***OBS!** Om ni redan har en databas som heter intro så får ni ta bort den först med följande kommando:* <br>
```DROP DATABASE intro;```
2. Sedan ska vi kontrollera att databasen skapades genom att skriva:```SHOW DATABASES;```
3. Nu ska vi välja vår nyskapade databas så vi kan arbeta med den. Skriv: ```USE intro;```



## Steg 4:
1. Vi ska nu öva på att skapa tabeller och fylla dem med information. Skriv:
```CREATE TABLE test1 (namn varchar(32));```
2. För att kolla att tabellen nu finns så skriver vi:
```SHOW TABLES;```
3. Vi skapar en till tabell med kommandot:
```CREATE TABLE test2 (förnamn varchar(32), efternamn varchar(32));```
4. **Kontrollera själv att test2 finns.**
5. Vill vi även titta på strukturen för dessa tabeller, hur de är uppbyggda. Skriv: <br>
```EXPLAIN test1;``` och sedan ```EXPLAIN test2;``` <br>
Då får man upp en någorlunda grafisk vy för hur de två olika tabellerna är 
uppbyggda med sina kolumner och datatyper.




## Steg 5:
Nu ska vi fylla våra tabeller med data! 
1. Börja med att skriva:
```INSERT INTO test1 (namn) VALUES ('Kalle');```<br>
Och sedan:
```INSERT INTO test2 (förnamn, efternamn) VALUES ('Kalle', 'Anka');```
2. För att titta på allt innehåll i test1 skriver vi:
```SELECT * FROM test1;```
3. **Titta även på test2 med samma kommando.** 
4. **Fyll på test2 med Kajsa Anka, Knatte Anka, Fnatte Anka och Tjatte Anka.**
5. **Titta sedan på det nya innehållet i test2 med kommandot SELECT.**
6. **Fyll nu på test2 med: Musse Pigg och Mimmi Pigg.**
7. Lägg även till Pluto, Piff och Puff genom att skriva:<br>
```INSERT INTO test2 (förnamn) VALUES (’Pluto’);```<br>
```INSERT INTO test2 (förnamn) VALUES (’Piff’);```<br>
```INSERT INTO test2 (förnamn) VALUES (’Puff’);```
8. **Kolla så att du fått med alla karaktärer med kommandot SELECT.**<br>
***OBS!** Du ska ha 10 rader med karaktärer i din tabell om du allt gjort rätt!*
9. Observera att efternamnen på Pluto, Piff och Puff har värdet NULL.<br>
*Det är helt rätt och beror på att vi inte angav något värde för efternamn och då får det automatiskt värdet NULL, som betyder att det inte finns något värde.*



## Steg 6:
1. Lägg till en ny kolumn i test2 genom att skriva:
```ALTER TABLE test2 ADD (ålder int(3));```
2. **Kolla hur det ser ut i test2 med SELECT.** <br>
*Det vi gjorde var att vi ändrade tabellen test2 och lade till en kolumn som heter ålder och innehåller datatypen int.*
3. Nu ska vi ge alla karaktärer en ålder. Då måste vi uppdatera en post på följande vis:<br>
```UPDATE test2 SET ålder=24 WHERE förnamn=’Kalle’; ```
4. **Uppdatera även Kajsas ålder till 24.**
5. Man kan även ändra fler fält samtidigt om man ställer rätt fråga:
```UPDATE test2 SET ålder=28 WHERE efternamn=’Pigg’; ```
*Vi ändrade alltså alla poster med efternamn Pigg och satte ålder till 28.*
6. Nu ska vi uppdatera Knatte, Fnatte och Tjattes ålder i en och samma fråga. <br>
Men vi vill ju inte ändra alla med Anka som efternamn för då kommer Kalle och Kajsa även få samma ålder…<br>
Då kan vi skriva med ett extra villkor i vår fråga separerat av den logiska operatorn ```AND```. Såhär ser det ut:<br>
```UPDATE test2 SET ålder=13 WHERE efternamn=’Anka’ AND ålder IS null;```
7. Nu ska vi bara uppdatera Pluto, Piff och Puffs åldrar. <br> 
Det som dem har gemensamt och som skiljer sig ifrån de andra är att de börjar på bokstaven P. Vi kan då skriva:<br>
```UPDATE test2 SET ålder=8 WHERE förnamn LIKE ’P%’ ;``` <br>
Databasen tolkar ```%```som vad som helst och i detta fall betyder det att förnamn ska följa kravet att första bokstaven är P följt av vad som helst. <br> *Observera att denna typ av jämförelse enbart funkar om man skriver LIKE innan!*
8. Nu kan vi kolla så att alla har fått rätt ålder med kommandot:```SELECT * FROM test2;```


## Steg 7:
Ifall vi har massor av information i vår databas är det bra att kunna få endast den information vi är intresserade av. Det gör vi med SELECT men vi får skriva till ett eller flera villkor som talar om vad vi är intresserade av. 
1. Om vi vill ha all information om alla som heter Anka i efternamn skriver vi:<br>
```SELECT * FROM test2 WHERE efternamn=’Anka’;```
2. **Skriv en fråga så att du får all information om alla som heter Pigg i efternamn.**
3. Om vi inte vill ha all information om alla som heter Anka i efternamn så får vi specificera själva vad vi vill veta genom att skriva efter SELECT vilka fält vi vill kolla på:
```SELECT förnamn,ålder FROM test2 WHERE efternamn=’Anka’;```
4. Vi kan även jämföra siffror och kolla på alla som till exempel är äldre än 10 år:<br>
```SELECT förnamn FROM test2 WHERE ålder>10;```



## Steg 8: 
#### Nu ska ni få tänka själva och göra några uppgifter. 
#### Fråga 1-4 är obligatoriska. Fråga 5 är valfri.
Jag vill att ni svarar på frågorna i ett textdokument* och mailar era svar till joakim.ohlsson@ntig.se<br>
**Hinner ni inte klart under lektionen så gör ni klart det hemma tills nästa lektion!**

\* *De som vill och kan får gärna skapa ett repo på GitHub och lägga upp sina svar där istället!*

### Fråga 1 - SELECT
Vad skriver jag för fråga om jag från test2 vill hämta…
1. ... Ålder på alla karaktärer med ‘tt’ in sitt förnamn?
2. ... Förnamn på alla som **inte** har något efternamn?
3. ... All information om de karaktärer vars förnamn börjar på K?
4. ... Förnamn på alla som är under 13 år?
5. ... Enbart alla efternamn i test2?
6. ... Förnamn och ålder på alla som heter Anka i efternamn?
7. ... All information om de karaktärer som har ett U i sitt förnamn?


### Fråga 2 - CREATE
1. Vad skriver jag för att skapa en ny tabell som heter **städer** och har följande kolumner: <br>
	* stad - varchar(32) <br>
	* kommun - varchar(32) <br>
	* landskap - varchar(32) <br>
	* län - varchar(32) <br>
	* postkod  - int(5) <br>
	* invånare - int(8)
	
*Skapa nu tabellen i din egna databas!*


### Fråga 3 - INSERT
Lägg in information i tabellen städer. <br>
Skriv in följande [kod](https://gist.github.com/JaoK/58f5af02b09ce3edda080420d25a6f76) genom att kopiera den och högerklicka i kommandoprompten och sedan klistra in.<br>
***OBS!** Om ni skapat städer fel kommer ni få errors när ni klistrar in!*<br>
Om det händer, skriv då: ```DROP TABLE städer;``` Och gör om, gör rätt!<br>
1. Lägg till minst 3st svenska städer i din tabell med rätt information. <br>
*Skriv ned dina 3 rader i textdokumentet!*


### Fråga 4 - SELECT 
Vad skriver man om man vill få en lista med namn och befolkning på alla städer som...
1. ... Ligger i Dalarna.
2. ... Har en befolkning på över 20 000 invånare.
3. ... Har en befolkning på över 10 000 invånare och mindre än 20 000.
4. ... Har en postkod som börjar på siffran 4.
5. ... Ligger i Västra Götalands län.
6. ... Ligger i en kommun vars namn börjar på A.
7. ... Har en befolkning på under 50 000 invånare.
8. ... Har bokstaven e i sitt stadsnamn.
9. ... Ligger i Hälsingland och har över 20 000 invånare.
10. ... Ligger i en kommun som börjar på bokstaven B och som har över 25 000 invånare.


### Fråga 5 - ORDER BY
Ställ en fråga så du får all information om alla städer sorterat efter…
1. ... Antal invånare i fallande ordning. *
2. ... Bokstavsordning från A-Ö. *
3. ... Postnummer i stigande ordning. * <br>
**\*** Detta får du söka upp själv hur man gör 
