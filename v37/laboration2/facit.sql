-- Facit på laboration 2
-- 1. Hämta de 10 största städerna från cities, sett till population?
SELECT * FROM cities ORDER BY population DESC LIMIT 10;

-- 2. Slå ihop cities med countries där country är samma för båda?
SELECT * FROM cities JOIN countries ON cities.country = countries.countrycode;

-- 3. Hämta en tabell med enbart fullständigt namn på land och stad?
SELECT city,countryname FROM cities JOIN countries ON cities.country = countries.countrycode;

-- 4. Hämta den stad som ligger närmast ekvatorn? (Latitude)
SELECT city,latitude FROM cities ORDER BY ABS(latitude) LIMIT 1;

-- 5. Hämta en tabell med totala populationen i varje land?
SELECT countryname,SUM(population) FROM cities JOIN countries ON cities.country = countries.countrycode GROUP BY countryname;

-- 6. Hämta en tabell med medelstads-populationen för varje land?
SELECT countryname,SUM(population)/COUNT(CITY) FROM cities JOIN countries ON cities.country = countries.countrycode GROUP BY countryname;

-- 7. Hämta det landsnamn som har den minsta staden i vår tabell?
SELECT countryname FROM cities JOIN countries ON cities.country = countries.countrycode ORDER BY population LIMIT 1;

-- 8. Hämta alla länder som börjar på bokstaven S?
SELECT countryname FROM countries WHERE countryname LIKE "S%";

-- 9. Hämta den största staden som börjar på A?
SELECT city FROM cities WHERE city LIKE "A%" ORDER BY population DESC LIMIT 1;

-- 10. Hämta den stad som ligger närmast samma breddgrad som Stockholm? (Latitude)
-- (Stockholms latitud är 59.3333)
SELECT city FROM cities WHERE city != "stockholm" ORDER BY ABS(latitude-59.3333) LIMIT 1;

-- 11. Hämta den stad som ligger längst norrut?
SELECT city FROM cities ORDER BY latitude DESC LIMIT 1;

-- 12. Hämta den stad som har närmast samma population som Stockholm?
-- (Stockholms population är 1253309)
SELECT city FROM cities ORDER BY ABS(population-1253309) LIMIT 1 OFFSET 1;
