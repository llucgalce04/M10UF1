DROP DATABASE IF EXISTS Evil_Corp;
CREATE DATABASE Evil_Corp;
USE Evil_Corp;

-- Drops
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

-- Tables
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

-- Inserción de datos en la tabla users
INSERT INTO users (username, first_name, last_name, email, password, country, birth_date)
VALUES
    ('user1', 'John', 'Doe', 'john.doe@example.com', 'password123', 'USA', '1990-05-15'),
    ('user2', 'Jane', 'Smith', 'jane.smith@example.com', 'password456', 'CAN', '1995-08-22'),
    ('user3', 'Michael', 'Johnson', 'michael.johnson@example.com', 'password789', 'UK', '1988-11-10'),
    ('user4', 'Emily', 'Brown', 'emily.brown@example.com', 'passwordabc', 'AUS', '1992-03-27'),
    ('user5', 'Daniel', 'Davis', 'daniel.davis@example.com', 'passwordxyz', 'GER', '1997-06-18');


-- Inserción de datos en la tabla medicines
INSERT INTO medicines (medicine, cost, price)
VALUES
    ('Aspirina', 5.99, 9.99),
    ('Paracetamol', 3.49, 6.99),
    ('Ibuprofeno', 4.99, 8.99),
    ('Amoxicilina', 7.99, 12.99),
    ('Omeprazole', 6.49, 10.99);

-- Inserción de datos en la tabla doctors
INSERT INTO doctors (doctor)
VALUES
    ('Dr. Smith'),
    ('Dr. Johnson'),
    ('Dr. Williams'),
    ('Dr. Brown'),
    ('Dr. Davis');

-- Inserción de datos en la tabla conditions
INSERT INTO conditions (condicion, symptoms, description, deadly)
VALUES
    ('Cold', 'Sneezing, coughing', 'Common viral infection', false),
    ('Flu', 'Fever, body aches', 'Viral respiratory illness', false),
    ('Hypertension', 'High blood pressure', 'Chronic medical condition', true),
    ('Diabetes', 'High blood sugar levels', 'Metabolic disorder', true),
    ('Asthma', 'Shortness of breath, wheezing', 'Chronic respiratory condition', false);

-- Inserción de datos en la tabla diagnoses
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition)
VALUES
    ('Common cold', '2023-05-28 10:00:00', 1, 1, 1),
    ('Influenza', '2023-05-29 14:30:00', 2, 2, 2),
    ('Hypertensive crisis', '2023-05-30 09:15:00', 3, 3, 3),
    ('Type 2 diabetes', '2023-05-31 16:45:00', 4, 4, 4),
    ('Asthma exacerbation', '2023-06-01 11:30:00', 5, 5, 5);

-- Inserción de datos en la tabla treatments
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine)
VALUES (1, 1, 1);

-- Inserción de datos en la tabla countries
INSERT INTO countries (country)
VALUES
    ('USA'),
    ('CAN'),
    ('MEX'),
    ('GBR'),
    ('FRA'),
    ('GER'),
    ('ESP'),
    ('ITA'),
    ('JPN'),
    ('AUS');

-- Inserción de datos en la tabla cities
INSERT INTO cities (city, id_country)
VALUES
    ('New York', 1),
    ('Toronto', 2),
    ('Mexico City', 3),
    ('London', 4),
    ('Paris', 5),
    ('Berlin', 6),
    ('Madrid', 7),
    ('Rome', 8),
    ('Tokyo', 9),
    ('Sydney', 10);


-- Inserción de datos en la tabla streets
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

-- Inserción de datos en la tabla streets_numbers
INSERT INTO streets_numbers (street_number)
VALUES
    ('123'),
    ('456'),
    ('789'),
    ('10A'),
    ('22B'),
    ('555'),
    ('321'),
    ('999'),
    ('777'),
    ('1001');

-- Inserción de datos en la tabla staircases
INSERT INTO staircases (staircase)
VALUES
    ('A'),
    ('B'),
    ('C'),
    ('D'),
    ('E'),
    ('F'),
    ('G'),
    ('H'),
    ('I'),
    ('J');


-- Inserción de datos en la tabla floors
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

-- Inserción de datos en la tabla doors
INSERT INTO doors (door)
VALUES
    ('101'),
    ('102'),
    ('103'),
    ('104'),
    ('105'),
    ('201'),
    ('202'),
    ('203'),
    ('204'),
    ('205');

-- Inserción de datos en la tabla zip_codes
INSERT INTO zip_codes (zip_code)
VALUES
    ('10001'),
    ('10002'),
    ('10003'),
    ('10004'),
    ('10005'),
    ('20001'),
    ('20002'),
    ('20003'),
    ('20004'),
    ('20005');
   
    
-- Inserción en la tabla galaxies

INSERT INTO galaxies (galaxy_name) VALUES
('Andromeda'),
('Milky Way'),
('Whirlpool'),
('Sombrero'),
('Pinwheel');

-- Inserción de datos en la tabla planets

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


-- Inserción de datos en la tabla addresses
INSERT INTO addresses (id_street, id_street_number, id_staircase, id_floor, id_door, id_zip_code, id_planet, id_galaxy)
VALUES (1, 1, 1, 1, 1, 1, 1, 1);

-- Inserción de datos en la tabla civilizations
INSERT INTO civilizations (name, planet, dead)
VALUES
    ('Zephyrians', 'Zephyria', false),
    ('Aquanites', 'Atlantia', false),
    ('Celestials', 'Astralis', false),
    ('Infernites', 'Pyrovia', false),
    ('Verdantians', 'Florania', false),
    ('Lunarians', 'Lunaris', false),
    ('Technocrats', 'Mechanica', false),
    ('Shadowfellians', 'Umbrath', true),
    ('Sylvanians', 'Arboria', false),
    ('Crystalites', 'Crystallis', false);


