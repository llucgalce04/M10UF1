DROP DATABASE IF EXISTS Evil_Corp;
CREATE DATABASE Evil_Corp;
USE Evil_Corp;

------------ DROPS ------------
DROP TABLE IF EXISTS users_addresses;
DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS conditions;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS civilizations;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS streets_numbers;
DROP TABLE IF EXISTS zip_codes;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS planets;
DROP TABLE IF EXISTS galaxies;

------------ TABLES ------------
CREATE TABLE users (
    id_user INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(64) NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    email VARCHAR(128) NOT NULL,
    password VARCHAR(32) NOT NULL,
    country CHAR(3) NOT NULL,
    birth_date DATE NOT NULL,
    dead BOOLEAN DEFAULT false
);
CREATE TABLE medicines(
    id_medicine INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    medicine VARCHAR(192) NOT NULL,
    cost DECIMAL(9,2) NOT NULL,
    price DECIMAL(9,2) NOT NULL
);
CREATE TABLE doctors (
    id_doctor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    doctor VARCHAR(32)
);
CREATE TABLE conditions (
    id_condition INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    condicion VARCHAR(64) NOT NULL,
    symptoms TEXT,
    description TEXT,
    deadly BOOLEAN
);
CREATE TABLE diagnoses(
    id_diagnosis BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    diagnosis TEXT NOT NULL,
    datetime DATETIME NOT NULL,
    id_doctor INT UNSIGNED,
    id_user INT UNSIGNED,
    id_condition INT UNSIGNED,
    FOREIGN KEY (id_doctor) REFERENCES doctors(id_doctor),
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_condition) REFERENCES conditions(id_condition)
);
CREATE TABLE treatments (
    id_treatment INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    id_condition INT UNSIGNED NOT NULL,
    id_diagnosis BIGINT UNSIGNED,
    id_medicine INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_condition) REFERENCES conditions(id_condition),
    FOREIGN KEY (id_diagnosis) REFERENCES diagnoses(id_diagnosis),
    FOREIGN KEY (id_medicine) REFERENCES medicines(id_medicine)
);
CREATE TABLE countries (
    id_country INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(64)
);
CREATE TABLE cities(
    id_city INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(64),
    id_country INT UNSIGNED,
    FOREIGN KEY (id_country) REFERENCES countries(id_country)
);
CREATE TABLE streets(
    id_street INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(64),
    id_city INT UNSIGNED,
    FOREIGN KEY (id_city) REFERENCES cities(id_city)
);
CREATE TABLE streets_numbers(
    id_street_number INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    street_number VARCHAR(32)
);
CREATE TABLE staircases(
    id_staircase INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    staircase VARCHAR(32)
);
CREATE TABLE floors(
    id_floor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    floor VARCHAR(32)
);
CREATE TABLE doors(
    id_door INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    door VARCHAR(32)
);
CREATE TABLE zip_codes(
    id_zip_code INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zip_code VARCHAR(32)
);

CREATE TABLE planets (
      id_planet INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      planet VARCHAR(64) NOT NULL,
    id_galaxy INT UNSIGNED NOT NULL
);

CREATE TABLE galaxies (
    id_galaxy INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    galaxy_name VARCHAR(64) NOT NULL
);


CREATE TABLE addresses(
  id_address INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_street INT UNSIGNED NOT NULL,
  id_street_number INT UNSIGNED NOT NULL,
  id_staircase INT UNSIGNED NOT NULL,
  id_floor INT UNSIGNED NOT NULL,
  id_door INT UNSIGNED NOT NULL,
  id_zip_code INT UNSIGNED NOT NULL,
  id_planet INT UNSIGNED NOT NULL,
  id_galaxy INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_street) REFERENCES streets(id_street),
  FOREIGN KEY (id_street_number) REFERENCES streets_numbers(id_street_number),
  FOREIGN KEY (id_staircase) REFERENCES staircases(id_staircase),
  FOREIGN KEY (id_floor) REFERENCES floors(id_floor),
  FOREIGN KEY (id_door) REFERENCES doors(id_door),
  FOREIGN KEY (id_zip_code) REFERENCES zip_codes(id_zip_code),
  FOREIGN KEY (id_planet) REFERENCES planets(id_planet),
  FOREIGN KEY (id_galaxy) REFERENCES galaxies (id_galaxy)
);

CREATE TABLE users_addresses (
    id_user_address INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_user INT UNSIGNED,
    id_address INT UNSIGNED,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_address) REFERENCES addresses(id_address)
);


CREATE TABLE civilizations (
    id_civilization INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    planet VARCHAR(50),
    dead BOOLEAN DEFAULT false
);

------------ INSERTS ------------
INSERT INTO users (username, first_name, last_name, email, password, country, birth_date)
VALUES
    ('user1', 'Ramon', 'Sir', 'ramon@example.com', 'password098', 'ES', '1999-02-11'),
    ('user2', 'Felix', 'Jua', 'felix@example.com', 'password768', 'IS', '2000-01-12'),
    ('user3', 'Xavier', 'Andreu', 'xavier@example.com', 'password789', 'UK', '2004-02-17'),
    ('user4', 'Emma', 'Rosa', 'emma@example.com', 'password123', 'FR', '2006-04-19'),
    ('user5', 'Loli', 'Davis', 'lolis@example.com', 'password777', 'GER', '1969-02-01');


------------ MEDICINES ------------
INSERT INTO medicines (medicine, cost, price)
VALUES
    ('Aspirina', 12, 7),
    ('Paracetamol', 6.99, 7.75),
    ('Ibuprofeno', 9, 6.5),
    ('Amoxicilina', 4, 7),
    ('Omeprazole', 10, 11);

------------ DOCTORS ------------
INSERT INTO doctors (doctor)
VALUES
    ('Dr. Josep'),
    ('Dr. Manin'),
    ('Dr. Toni'),
    ('Dr. Lolito'),
    ('Dr. Dali');

------------ CONDITIONS ------------
INSERT INTO conditions (condicion, symptoms, description, deadly)
VALUES
    ('Hot', 'Freeze, coughing', 'Common viral infection', true),
    ('Flu', 'Fever, body aches', 'Viral respiratory illness', false),
    ('Hypertension', 'High blood pressure', 'Chronic medical condition', true),
    ('Diabetes', 'High blood sugar levels', 'Metabolic disorder', true),
    ('Asthma', 'Shortness of breath, wheezing', 'Chronic respiratory condition', false);

------------ DIAGNOSES ------------
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition)
VALUES
    ('Common cold', '2023-05-28 10:00:00', 1, 1, 1),
    ('Influenza', '2023-05-29 14:30:00', 2, 2, 2),
    ('Hypertensive crisis', '2023-05-30 09:15:00', 3, 3, 3),
    ('Type 2 diabetes', '2023-05-31 16:45:00', 4, 4, 4),
    ('Asthma exacerbation', '2023-06-01 11:30:00', 5, 5, 5);

------------ TREATMENTS ------------
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine)
VALUES (1, 1, 1);

------------ COUNTRIES ------------
INSERT INTO countries (country)
VALUES
    ('CAN'),
    ('MEX'),
    ('FR'),
    ('ESP'),
    ('GER'),
    ('ESP'),
    ('EEU'),
    ('ITA'),
    ('AUS'),
    ('UK'),
    ('JPN');

------------ CITIES ------------
INSERT INTO cities (city, id_country)
VALUES
    ('New York', 8),
    ('Toronto', 1),
    ('Mexico City', 2),
    ('London', 10),
    ('Paris', 3),
    ('Berlin', 5),
    ('Madrid', 4),
    ('Rome', 8),
    ('Tokyo', 11),
    ('Sydney', 1);


------------ STREETS ------------
INSERT INTO streets (street, id_city)
VALUES
    ('Main Street', 1),
    ('Broadway', 1),
    ('First Avenue', 2),
    ('Queen Street', 2),
    ('Revolution Square', 3),
    ('Champs-Élysées', 4),
    ('Brandenburg Gate', 5),
    ('Gran Vía', 6),
    ('Via del Corso', 8),
    ('Ginza', 9);

------------ STREETS_NUMBERS ------------
INSERT INTO streets_numbers (street_number)
VALUES
    ('985'),
    ('678'),
    ('234'),
    ('444'),
    ('333'),
    ('555'),
    ('222'),
    ('111'),
    ('777'),
    ('234');

------------ STAIRCASES ------------
INSERT INTO staircases (staircase)
VALUES
    ('A'),
    ('B'),
    ('C'),
    ('D'),
    ('E'),
    ('F');


------------ FLOORS ------------
INSERT INTO floors (`floor`)
VALUES
    ('1st Floor'),
    ('2nd Floor'),
    ('3rd Floor'),
    ('4th Floor'),
    ('5th Floor'),
    ('6th Floor'),
    ('7th Floor'),
    ('8th Floor'),
    ('9th Floor'),
    ('10th Floor');

------------ DOORS ------------
INSERT INTO doors (door)
VALUES
    ('301'),
    ('202'),
    ('403'),
    ('504'),
    ('105'),
    ('201'),
    ('202'),
    ('203'),
    ('404'),
    ('705');

------------ ZIP_CODES ------------
INSERT INTO zip_codes (zip_code)
VALUES
    ('08358'),
    ('24646'),
    ('87362'),
    ('23578'),
    ('12567'),
    ('46846'),
    ('20002'),
    ('35532'),
    ('20004'),
    ('45745');
   
    
------------ GALAXIES ------------
INSERT INTO galaxies (galaxy_name) VALUES
('Andromeda'),
('Milky Way'),
('Whirlpool'),
('Sombrero'),
('Pinwheel');

------------ PLANETS ------------
INSERT INTO planets (planet, id_galaxy)
VALUES
    ('Mercury', 1),
    ('Venus', 1),
    ('Earth', 1),
    ('Mars', 1),
    ('Jupiter', 2),
    ('Saturn', 2),
    ('Uranus', 2),
    ('Neptune', 2),
    ('Pluto', 3),
    ('Eris', 3);


------------ ADDRESSES ------------
INSERT INTO addresses (id_street, id_street_number, id_staircase, id_floor, id_door, id_zip_code, id_planet, id_galaxy)
VALUES (1, 1, 1, 1, 1, 1, 1, 1);
VALUES (2, 2, 2, 2, 2, 2, 2, 2);
VALUES (3, 3, 3, 3, 3, 3, 3, 3);

------------ CIVILITZATIONS ------------
INSERT INTO civilizations (name, planet, dead)
VALUES
    ('Mesopotamia', 'Earth', false),
    ('Atantis', 'Atlantitis', false),
    ('Portus', 'Portikus', false),
    ('Infernites', 'Pyrovia', false),
    ('Verdantians', 'Florania', false),
    ('Phoenicia', 'Aleris', false),
    ('Sumer', 'Marth', false),
    ('Sulican', 'Silician', true),
    ('Assyra', 'Waterlandia', false),
    ('Lolisimos', 'Lolis', false);

