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
