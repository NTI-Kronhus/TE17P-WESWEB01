CREATE DATABASE form;

USE form;

CREATE TABLE register(
    id int(8) PRIMARY KEY AUTO_INCREMENT,
    name varchar(32),
    age int(8),
    mail varchar(32),
    username varchar(32),
    phone varchar(32),
    gender ENUM("MALE","FEMALE")
);
