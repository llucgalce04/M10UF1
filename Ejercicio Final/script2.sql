CREATE DATABASE IF NOT EXISTS evilcorp;

/*Medicine*/

drop table if exists treatments;
drop table if exists diagnoses;
DROP VIEW IF EXISTS ilumi_show;
DROP TABLE IF EXISTS iluminatis;
DROP TABLE IF EXISTS users_conspirations;
DROP TABLE IF EXISTS users_addresses;
DROP TABLE IF EXISTS users_planets;
drop table if exists `users`;
drop table if exists diseases;
drop table if exists medicines;
drop table if exists doctors;
DROP VIEW IF EXISTS costes;

create table `users`(id_user BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(64) NOT NULL);

create table diseases (id_disease INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, disease VARCHAR(64) NOT NULL, symptoms TEXT NOT NULL, description TEXT NOT NULL, deadly BOOLEAN NOT NULL);

create table medicines (id_medicine INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, medicine VARCHAR(192) NOT NULL, cost_production DECIMAL(9, 2) UNSIGNED NOT NULL, cost_sell DECIMAL(9, 2) UNSIGNED NOT NULL);

create table doctors (id_doctor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, doctor VARCHAR(32));

create table diagnoses (id_diagnosis BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, diagnosis TEXT NOT NULL, id_doctor INT UNSIGNED NOT NULL, id_user BIGINT UNSIGNED NOT NULL, id_disease INT UNSIGNED NOT NULL, FOREIGN KEY(id_doctor) REFERENCES doctors(id_doctor), FOREIGN KEY(id_user) REFERENCES users(id_user), FOREIGN KEY(id_disease) REFERENCES diseases(id_disease));

create table treatments (id_treatment BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, id_diagnosis BIGINT UNSIGNED NOT NULL, id_medicine INT UNSIGNED NOT NULL, FOREIGN KEY(id_diagnosis) REFERENCES diagnoses(id_diagnosis), FOREIGN KEY(id_medicine) REFERENCES medicines(id_medicine));

INSERT INTO users (`name`) VALUES ("Paco"),("Manolo"),("Francisco"),("Sergio"),("Paca"),("Manola"),("Francisca"),("Sergia");

insert into doctors(doctor) values ("Belcebu"), ("Satanas");

insert into medicines(medicine, cost_production, cost_sell) values ("Simvastatina", 921323.23, 9999999.99), ("Aspirina", 5000.99, 999999.99), ("Omeprazol", 7000.00, 999999.99), ("Ramipril", 96543.00, 9999999.22);

insert into diseases(disease, symptoms, description, deadly) values ("Bronquitis aguda", "Tos, Mucosidad", "Te pones mu malo de los bronquio",true), ("Resfriado comun", "Estornudos, moqueos, congestion nasal, tos, dolor de garganta", "Te pones malo por haber pillado frio", true), ("Infeccion de oido", "Dolor de oido, fiebre", "No oyes na", true), ("Gripe", "Fiebre, tos, dolor de gargatna, moqueo, dolor corporal", "Excusa perfecta para faltar a todos los sitios", true), ("Sinusitis", "Dolor de cabeza, congestion, moqueo, presion en la cara", "Te revienta la cabeza", true), ("Infeccion de piel", "Erojecimiento de la piel, inflamacion", "El popper", true), ("Dolor de garganta", "Dolor de garganta, ronquera", "Algo que el pablo no tendra", true);

insert into diagnoses(diagnosis, id_doctor, id_user, id_disease) values("Esta mu malo", 1, 2, 3), ("Esta mas malo aun", 2, 3, 1), ("Esta malo", 1, 2, 1), ("Esta malo maloso", 1, 1, 7);

insert into treatments(id_diagnosis, id_medicine) values(1,1),(1,2),(2,3),(4,3),(3, 4);

create view costes as select treatments.id_medicine, 
COUNT(medicine) medicines, cost_production, 
SUM(cost_production) total_cost_production, cost_sell, 
SUM(cost_sell) total_cost_sell from medicines LEFT JOIN
treatments on medicines.id_medicine=treatments.id_medicine group 
by cost_production;


/*Conspiraciones*/

DROP TABLE IF EXISTS conspirations;

DROP PROCEDURE IF EXISTS add_conspiration;

DROP VIEW IF EXISTS ilumi_show;
DROP VIEW IF EXISTS ilumi_count;

CREATE TABLE conspirations (id_conspiration INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, conspiration VARCHAR(32) NOT NULL, description TEXT NOT NULL);

CREATE TABLE iluminatis (id_iluminati INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, id_user BIGINT UNSIGNED NOT NULL, FOREIGN KEY(id_user) REFERENCES users(id_user));

CREATE TABLE users_conspirations (id_user_conspiration BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, id_user BIGINT UNSIGNED NOT NULL, id_conspiration INT UNSIGNED NOT NULL, FOREIGN KEY(id_user) REFERENCES users (id_user), FOREIGN KEY(id_conspiration) REFERENCES conspirations(id_conspiration));

DELIMITER $$

CREATE PROCEDURE add_conspiration( IN id_users BIGINT, IN id_conspirations INT, IN opinion BOOLEAN)
BEGIN

START TRANSACTION;

INSERT INTO users_conspirations(id_user, id_conspiration) VALUES (id_users, id_conspirations);

IF opinion THEN
COMMIT;
ELSE
ROLLBACK;
END IF;

END $$

DELIMITER ;

INSERT INTO conspirations (conspiration, description) VALUES ("No Holo", "Los muy nazis"), ("Terraplanistas", "Cosas de planos"), ("Conspiracion", "No covid");

INSERT INTO iluminatis (id_user) VALUES (1), (3);

CREATE VIEW ilumi_show AS SELECT users.id_user, users.name FROM users LEFT JOIN iluminatis ON users.id_user = iluminatis.id_user;

CREATE VIEW ilumi_count AS SELECT COUNT(users.id_user) users FROM users,ilumi_show;

/*Realstate*/

DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS streets_num;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS zipcodes;
DROP TABLE IF EXISTS planets;
DROP VIEW IF EXISTS planet_addresses;
DROP VIEW IF EXISTS count_users_planet;
DROP VIEW IF EXISTS planet_medicine_production;
DROP FUNCTION IF EXISTS get_city;
DROP FUNCTION IF EXISTS random_user;
DROP PROCEDURE IF EXISTS killer;

DELIMITER $$
CREATE FUNCTION get_city(city_name VARCHAR(64), country_name VARCHAR(64), planet_name VARCHAR(64))
RETURNS INT UNSIGNED
BEGIN
DECLARE planet_id INT UNSIGNED;
DECLARE country_id INT UNSIGNED;
DECLARE city_id INT UNSIGNED;


SELECT id_planet INTO planet_id FROM planets WHERE name = planet_name;

IF planet_id IS NULL THEN
INSERT INTO planets (name) VALUES (planet_name);
SET planet_id = LAST_INSERT_ID();
END IF;


SELECT id_country INTO country_id FROM countries WHERE country = country_name AND id_planet = planet_id;

IF country_id IS NULL THEN
INSERT INTO countries (country, id_planet) VALUES (country_name, planet_id);
SET country_id = LAST_INSERT_ID();
END IF;


SELECT id_city INTO city_id FROM cities WHERE city = city_name AND id_country = country_id;

IF city_id IS NULL THEN
INSERT INTO cities (city, id_country) VALUES (city_name, country_id);
SET city_id = LAST_INSERT_ID();
ELSE
SET city_id = (SELECT id_city FROM cities WHERE city = city_name AND id_country = country_id LIMIT 1);
END IF;

RETURN city_id;
END$$
DELIMITER ;

CREATE TABLE planets (id_planet INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, planet VARCHAR(64) NOT NULL);

CREATE TABLE countries (id_country INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, country VARCHAR(64) NOT NULL, id_planet INT UNSIGNED NOT NULL, FOREIGN KEY(id_planet) REFERENCES planets(id_planet));

CREATE TABLE cities (id_city INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, city VARCHAR(64) NOT NULL, id_country INT UNSIGNED NOT NULL, FOREIGN KEY(id_country) REFERENCES countries(id_country));

CREATE TABLE streets (id_street BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, street VARCHAR(32) NOT NULL, id_city INT UNSIGNED NOT NULL, FOREIGN KEY(id_city) REFERENCES cities(id_city));

CREATE TABLE streets_num (id_street_num INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, street_num VARCHAR(16));

CREATE TABLE staircases (id_staircase INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, staircase VARCHAR(8));

CREATE TABLE floors (id_floor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, `floor` VARCHAR(8));

CREATE TABLE doors (id_door INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, door VARCHAR(8));

CREATE TABLE zipcodes (id_zipcode INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, zipcode VARCHAR(16) NOT NULL);

CREATE TABLE addresses (id_address BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
id_street BIGINT UNSIGNED NOT NULL, 
id_street_num INT UNSIGNED NOT NULL, 
id_staircase INT UNSIGNED NOT NULL, 
id_floor INT UNSIGNED NOT NULL, 
id_door INT UNSIGNED NOT NULL, 
id_zipcode INT UNSIGNED NOT NULL, 
FOREIGN KEY(id_street) REFERENCES streets(id_street), 
FOREIGN KEY(id_street_num) REFERENCES streets_num(id_street_num), 
FOREIGN KEY(id_staircase) REFERENCES staircases(id_staircase), 
FOREIGN KEY(id_floor) REFERENCES floors(id_floor), 
FOREIGN KEY(id_door) REFERENCES doors(id_door),
FOREIGN KEY(id_zipcode) REFERENCES zipcodes(id_zipcode)) ENGINE=InnoDB;


CREATE TABLE users_addresses (id_user_address BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, id_user BIGINT UNSIGNED NOT NULL, id_address BIGINT UNSIGNED NOT NULL, FOREIGN KEY(id_user) REFERENCES users(id_user), FOREIGN KEY (id_address) REFERENCES addresses(id_address)) ENGINE=InnoDB;

CREATE TABLE users_planets (id_user_planet BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, id_user BIGINT UNSIGNED NOT NULL, id_planet INT UNSIGNED NOT NULL, FOREIGN KEY(id_user) REFERENCES users(id_user), FOREIGN KEY(id_planet) REFERENCES planets(id_planet));

INSERT INTO planets(planet) VALUES ("Mercurio"),("Venus"), ("Tierra"), ("Marte");

INSERT INTO countries(country, id_planet) VALUES ("Sudan del Sur", 3), ("Zambia", 3), ("Lumele", 1), ("Titutul", 2), ("Ju", 4), ("So", 4), ("Z012", 1), ("Vietnam", 3);

INSERT INTO cities(city, id_country) VALUES ("A", 1), ("B", 2), ("C", 3), ("D", 4), ("E", 5), ("F", 6), ("G", 7), ("H", 8);

INSERT INTO streets(street, id_city) VALUES ("Calle S", 1), ("Calle I", 2), ("Calle D", 3), ("Calle O", 4), ("Calle S", 5), ("Calle O", 6), ("Calle S", 7), ("Calle :)", 8), ("Calle A", 1), ("Calle L", 2), ("Calle E", 3), ("Calle G", 4), ("Calle R", 5), ("Calle I", 6), ("Calle A", 7);

INSERT INTO streets_num (street_num) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO staircases (staircase) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO floors (`floor`) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15); 

INSERT INTO doors (door) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO zipcodes (zipcode) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

INSERT INTO addresses (id_street, id_street_num, id_staircase, id_floor, id_door, id_zipcode) VALUES (1,1,1,1,1,1), (2,2,2,2,2,2), (3,3,3,3,3,3), (4,4,4,4,4,4), (5,5,5,5,5,5), (6,6,6,6,6,6), (7,7,7,7,7,7), (8,8,8,8,8,8), (9,9,9,9,9,9), (10,10,10,10,10,10), (11,11,11,11,11,11), (12,12,12,12,12,12), (13,13,13,13,13,13), (14,14,14,14,14,14),(15,15,15,15,15,15);

INSERT INTO users (name) VALUES (1),(2),(3),(4),(5),(6),(7),(8);

INSERT INTO users_addresses(id_user, id_address) VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(1,9),(2,10),(3,11),(4,12),(5,13),(6, 14),(7,15);

INSERT INTO users_planets(id_user, id_planet) VALUES (1,1),(2,2),(3,3);

CREATE VIEW planet_addresses AS SELECT planets.planet, COUNT(addresses.id_address) planet_addresses FROM planets, addresses;

CREATE VIEW count_users_planet AS SELECT planets.planet, COUNT(users_planets.id_user) count_user FROM users, planets, users_planets WHERE users.id_user=users_planets.id_user AND planets.id_planet = users_planets.id_planet GROUP BY planets.planet;

CREATE VIEW planet_medicine_production AS SELECT planets.planet, SUM(cost_sell) generated FROM users, medicines, diagnoses, planets, users_planets, treatments WHERE planets.id_planet=users_planets.id_planet AND diagnoses.id_user=users_planets.id_user AND diagnoses.id_diagnosis=treatments.id_diagnosis AND medicines.id_medicine=treatments.id_medicine GROUP BY planets.planet;

ALTER TABLE users
ADD COLUMN dead BOOLEAN NOT NULL DEFAULT FALSE;

DROP USER 'parca'@'localhost';

CREATE USER 'parca'@'localhost' IDENTIFIED BY 'parca';

GRANT SELECT, UPDATE ON evilcorp.users TO 'parca'@'localhost';

DELIMITER $$

CREATE FUNCTION random_user(planet_id INT)
RETURNS VARCHAR(32)
BEGIN
DECLARE users INT;
DECLARE random_num INT;
DECLARE random_user INT;

SELECT COUNT(*) INTO users FROM users_planets WHERE users_planets.id_planet = planet_id;
SET random_num = FLOOR(RAND() * users);
SELECT id_user INTO random_user FROM users_planets WHERE users_planets.id_planet = planet_id LIMIT random_num, 1;
RETURN random_user;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE killer(IN name_user VARCHAR(64))
BEGIN
DECLARE user_dead VARCHAR(64);
DECLARE user_alive BOOLEAN;

-- Verificar si el usuario está muerto
SELECT dead INTO user_alive
FROM users
WHERE name = name_user;
IF user_alive THEN

-- Usuario muerto, mostrar mensaje
SELECT CONCAT('El usuario ', name_user, ' ya está muerto.') AS mensaje;
ELSE

-- Usuario vivo, matarlo
UPDATE users
SET dead = TRUE
WHERE name = name_user;
SELECT CONCAT('Hemos matado al usuario ', name_user, '.') AS mensaje;
END IF;
END $$

DELIMITER ;