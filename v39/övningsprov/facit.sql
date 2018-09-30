-- Fråga 1
SELECT namn FROM bandmedlemmar WHERE ålder > 35;
SELECT ålder FROM bandmedlemmar WHERE namn = "Ozzy Osbourne";
SELECT minuter,sekunder FROM låtar WHERE titel = "We will rock you";
SELECT titel FROM låtar WHERE minuter >= 2;
SELECT bandnamn FROM rockband WHERE id = 69;
SELECT lyrics FROM låtar WHERE titel = "Back in black";

-- Fråga 2
SELECT COUNT(skivor.id) FROM skivor;
SELECT SUM(ålder)/COUNT(ålder) FROM bandmedlemmar;
SELECT SUM(minuter),SUM(sekunder) FROM låtar;
SELECT bandnamn FROM rockband WHERE bandnamn LIKE "B%";
SELECT titel FROM låtar ORDER BY minuter DESC, sekunder DESC LIMIT 1;
SELECT namn FROM bandmedlemmar ORDER BY ålder DESC LIMIT 1;
SELECT COUNT(t) FROM (SELECT COUNT(titel) AS t FROM låtar GROUP BY titel) AS result;
SELECT COUNT(å) FROM (SELECT COUNT(ålder) AS å FROM bandmedlemmar GROUP BY ålder) AS result;
SELECT tltel FROM låtar WHERE lyrics LIKE "Big wheels keep on turning%";

-- Fråga 3
SELECT bandnamn FROM rockband JOIN bandmedlemmar ON rockband.id = bandmedlemmar.band WHERE namn = "Angus Young";
SELECT bandnamn FROM rockband JOIN skivor ON rockband.id = skivor.band WHERE titel = "The dark side of the moon";
SELECT låtar.titel FROM låtar JOIN skivor ON skivor.id = låtar.skiva WHERE skivor.titel = "Nevermind";
SELECT skivor.titel FROM låtar JOIN skivor ON skivor.id = låtar.skiva WHERE låtar.titel = "Highway to hell";
SELECT bandnamn FROM rockband JOIN bandmedlemmar ON rockband.id = bandmedlemmar.band ORDER BY ålder DESC LIMIT 1;

-- Fråga 4
SELECT COUNT(låtar.id) FROM skivor JOIN låtar ON skivor.id = låtar.skiva WHERE skivor.titel = "Abbey Road";
SELECT SUM(ålder)/COUNT(namn) FROM rockband JOIN bandmedlemmar ON rockband.id = bandmedlemmar.band WHERE bandnamn = "The Beatles";
SELECT bandnamn FROM rockband JOIN skivor ON rockband.id = skivor.band GROUP BY rockband.id ORDER BY COUNT(skivor.id) DESC LIMIT 1;
SELECT COUNT(skivor.id) FROM rockband JOIN skivor ON rockband.id = skivor.band WHERE bandnamn = "Judas Priest";
SELECT * FROM (SELECT skivor.titel,(SUM(minuter)+SUM(sekunder)/60) AS min FROM skivor JOIN låtar ON skivor.id = låtar.skiva GROUP BY skivor.id) AS result WHERE min >= 60;

-- Fråga 5
SELECT COUNT(låtar.id) FROM rockband JOIN skivor ON rockband.id = skivor.band JOIN låtar ON skivor.id = låtar.skiva WHERE bandnamn = "Queen";
SELECT SUM(minuter),SUM(sekunder) FROM rockband JOIN skivor ON rockband.id = skivor.band JOIN låtar ON skivor.id = låtar.skiva WHERE bandnamn = "AC/DC";
SELECT namn FROM bandmedlemmar JOIN skivor ON bandmedlemmar.band = skivor.band JOIN låtar ON skivor.id = låtar.skiva WHERE låtar.titel = "welcome to the jungle";
SELECT (SUM(minuter)*60+SUM(sekunder))/COUNT(låtar.id) AS sekunder FROM rockband JOIN skivor ON rockband.id = skivor.band JOIN låtar ON skivor.id = låtar.skiva WHERE bandnamn = "Pink Floyd";
SELECT låtar.titel FROM rockband JOIN skivor ON rockband.id = skivor.band JOIN låtar ON skivor.id = låtar.skiva WHERE sign_datum < "19800101";
