-- Fråga 1
SELECT ålder FROM test2 WHERE förnamn LIKE "%tt%";
SELECT förnamn FROM test2 WHERE efternamn IS NULL;
SELECT * FROM test2 WHERE förnamn LIKE "K%";
SELECT förnamn FROM test2 WHERE ålder < 13;
SELECT efternamn FROM test2;
SELECT förnamn,ålder FROM test2 WHERE efternamn = "anka";
SELECT * FROM test2 WHERE förnamn LIKE "%U%";

-- Fråga 2
CREATE TABLE städer (
	stad varchar(32), 
	kommun varchar(32), 
	landskap varchar(32), 
	län varchar(32),
	postkod int(5),
	invånare int(8)
  );

-- Fråga 4
SELECT stad,befolkning FROM städer WHERE landskap = "dalarna";
SELECT stad,befolkning FROM städer WHERE befolkning > 20000;
SELECT stad,befolkning FROM städer WHERE 10000 < befolkning AND befolkning < 20000;
SELECT stad,befolkning FROM städer WHERE postkod LIKE "4%";
SELECT stad,befolkning FROM städer WHERE län = "västra götalands län";
SELECT stad,befolkning FROM städer WHERE kommun LIKE "A%";
SELECT stad,befolkning FROM städer WHERE befolkning < 50000;
SELECT stad,befolkning FROM städer WHERE stad LIKE "%E%";
SELECT stad,befolkning FROM städer WHERE landskap = "hälsingland" AND befolkning > 20000;
SELECT stad,befolkning FROM städer WHERE kommun LIKE "B%" AND befolkning > 50000;
