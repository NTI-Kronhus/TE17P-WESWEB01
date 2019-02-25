CREATE DATABASE skola;
USE skola;

CREATE TABLE betyg (
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	niva varchar(32)
);

INSERT INTO betyg VALUES
(1,"A"),
(2,"B"),
(3,"C"),
(4,"D"),
(5,"E"),
(6,"F"),
(7,"-"),
(8,"Pågående");

CREATE TABLE klassrum (
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	namn varchar(32)
);

INSERT INTO klassrum VALUES
(1,"101"),
(2,"102"),
(3,"208"),
(4,"212"),
(5,"214"),
(6,"216"),
(7,"218");

CREATE TABLE vardnadshavare (
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	namn varchar(32)
);

INSERT INTO vardnadshavare VALUES
(1,"Kjell"),
(2,"Maj-Britt"),
(3,"Lars-Åke"),
(4,"Hasse"),
(5,"Gunilla"),
(6,"Mona-Lisa");

CREATE TABLE klass (
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	klassrum_id int(8),
	FOREIGN KEY(klassrum_id) REFERENCES klassrum(id),
	namn varchar(32)
);

INSERT INTO klass VALUES
(1,1,"TE17D"),
(2,2,"TE17C"),
(3,3,"TE16C"),
(4,4,"IT16A"),
(5,5,"HA16B"),
(6,6,"NA18E");

CREATE TABLE elev (
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	klass_id int(8),
	FOREIGN KEY(klass_id) REFERENCES klass(id),
	namn varchar(32)
);

INSERT INTO elev VALUES
(1,1,"Alen M"),
(2,1,"Kalle E"),
(3,3,"Elias E"),
(4,2,"Maximilian V"),
(5,4,"Pelle"),
(6,5,"Kålle"),
(7,6,"Kalle"),
(8,2,"Fredrik L");

CREATE TABLE larare (
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	klass_id int(8),
	FOREIGN KEY(klass_id) REFERENCES klass(id),
	namn varchar(32)
);

INSERT INTO larare VALUES
(1,1,"Stefan"),
(2,1,"Joakim"),
(3,2,"Tatiana"),
(4,2,"Liselotte"),
(5,3,"Linda");

CREATE TABLE kurs (
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	larare_id int(8),
	FOREIGN KEY(larare_id) REFERENCES larare(id),
	kurskod varchar(32)
);

INSERT INTO kurs VALUES
(1,1,"WEUWEB01"),
(2,2,"PRRPRR01"),
(3,2,"WESWEB01"),
(4,3,"MATMAT05"),
(5,4,"SVESVE02"),
(6,5,"GYARB");

CREATE TABLE betyg_elev_kurs (
	betyg_id int(8),
	FOREIGN KEY(betyg_id) REFERENCES betyg(id),
	elev_id int(8),
	FOREIGN KEY(elev_id) REFERENCES elev(id),
	kurs_id int(8),
	FOREIGN KEY(kurs_id) REFERENCES kurs(id)
);

INSERT INTO betyg_elev_kurs VALUES
(1,1,1),
(1,1,2),
(1,1,3),
(2,2,3),
(3,3,4),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,1),
(8,8,2),
(8,1,5),
(1,3,6),
(1,2,5),
(8,1,4),
(8,2,6),
(8,3,1),
(8,4,2),
(8,5,2),
(8,6,3),
(8,7,6),
(8,8,5);

CREATE TABLE vikarie (
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	larare_id int(8),
	FOREIGN KEY(larare_id) REFERENCES larare(id),
	namn varchar(32)
);

INSERT INTO vikarie VALUES
(1,5,"Gunnar");

CREATE TABLE elev_vardnadshavare(
	elev_id int(8),
	FOREIGN KEY(elev_id) REFERENCES elev(id),
	vardnadshavare_id int(8),
	FOREIGN KEY(vardnadshavare_id) REFERENCES vardnadshavare(id)
);

INSERT INTO elev_vardnadshavare VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,4),
(6,5),
(7,5),
(8,6);

CREATE TABLE lektion(
	id int(8) PRIMARY KEY AUTO_INCREMENT,
	tid varchar(32),
	dag varchar(32),
	langd varchar(32),
	klassrum_id int(8),
	FOREIGN KEY(klassrum_id) REFERENCES klassrum(id),
	larare_id int(8),
	FOREIGN KEY(larare_id) REFERENCES larare(id),
	kurs_id int(8),
	FOREIGN KEY(kurs_id) REFERENCES kurs(id)
);


INSERT INTO lektion VALUES 
(1,"08:30","Måndag","70",3,2,3),
(2,"09:50","Måndag","70",2,2,2),
(3,"11:10","Måndag","70",5,3,4),
(4,"08:30","Onsdag","70",3,1,1),
(5,"08:30","Fredag","70",4,5,6),
(6,"10:30","Fredag","70",3,4,4),
(7,"08:30","Fredag","70",3,1,1),
(8,"11:50","Fredag","70",3,3,3),
(9,"13:10","Fredag","70",3,4,4),
(10,"14:30","Fredag","70",3,5,5);
