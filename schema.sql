CREATE DATABASE IF NOT EXISTS car_rental;
USE car_rental;

DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Model;
DROP TABLE IF EXISTS Client;


CREATE TABLE Client (
    client_code int PRIMARY KEY auto_increment,
    name varchar(100),
    license varchar(50),
    phone varchar(50)
);

CREATE TABLE Model (
    model_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name varchar(100),
    make varchar(100),
    size int,
    year int
);

CREATE TABLE Category (
    type varchar(50) PRIMARY KEY,
    fee decimal(5,2) UNIQUE
);


CREATE TABLE Car (
    car_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    plate varchar(20),
    miles integer,
    status varchar(10),
    model_id varchar(100),
    FOREIGN KEY (model_id) REFERENCES Model (model_id)
);

CREATE TABLE Rental (
    rental_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    client_code int,
    car_id int,
    start_date datetime,
    end_date datetime,
    miles int,
    category_type varchar(50),
    FOREIGN KEY (category_type) REFERENCES Category (type),
    FOREIGN KEY (client_code) REFERENCES Client (client_code),
    FOREIGN KEY (car_id) REFERENCES Car (car_id)
);
