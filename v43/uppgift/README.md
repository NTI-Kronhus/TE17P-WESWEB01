## Fullständig registrering och login

### Jag vill att du committar via GitHub med en relevant kommentar efter varje slutfört steg.

1. Skapa en ny mapp med ett repository i din htdocs-mapp.
2. I den ska du skapa tre filer.
    * index.php
    * submit.php
    * db.sql
3. Planera vilka uppgifter du vill lagra om dina användare och skapa en ny databas och tabell utirfån detta. Skriv ner den koden som du skrev för att skapa din tabell i filen db.sql. *(Glöm inte PRIMARY KEY och UNIQUE på t.ex. användarnamn/mail)*
4. Skriv nu grundläggande kod för en HTML-sida i index.php.
5. Skapa ett registreringsformulär i filen index.php som tar in samma information som du har skapat kolumner för i din databas. Gör så att formuläret skickas till submit.php.
6. I submit.php ska du nu skapa PHP-kod som kollar ifall ett formulär med rätt data har skickats till sidan och om så är fallet registrerar en ny användare med hjälp av informationen. *(Skapar en ny rad i databasen)*
7. När allting fungerar med registreringen så ska du även skapa ett login-fomulär i index.php där man loggar in med exempelvis användarnamn och lösenord.
8. Skicka även login-formuläret till submit.php, som i sin tur ska kolla ifall den inskrivna informationen stämmer överens med en rad i databasen. Om så är fallet ska användaren få bli inloggad på sidan och stanna inloggad tills denne loggar ut eller stänger sidan.
9. Sist ska du skriva in PHP-kod i index.php som undersöker ifall någon är inloggad och om så är fallet visar en utloggningsknapp som gör att man blir utloggad från sidan. *(Om ni vill får skapa en logout.php)*

Om du är klar och inte har något annat skolarbete att göra så kan du fördjupa dig lite inom PHP-SESSIONS och även implementera det ytterligare i din uppgift. T.ex. göra en personlig hälsning när man har loggat in, eller något felmeddelande som visas ifall något gick fel vid inloggning eller registrering.
