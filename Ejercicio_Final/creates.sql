DROP DATABASE IF EXISTS Evil_Corp;
CREATE DATABASE Evil_Corp;
USE Evil_Corp;
-------- HEALTH CARE DROPS --------
DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS conditions;
DROP TABLE IF EXISTS medicines;

-------- REAL STATE DROPS --------
DROP TABLE IF EXISTS adresses;
DROP TABLE IF EXISTS zip_codes;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS street_numbers;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS planets;

-------- CONSPIRATIONS DROPS --------
DROP TABLE IF EXISTS users_conspirations;
DROP TABLE IF EXISTS illuminats;
DROP TABLE IF EXISTS conspirations;

-------- USERS DROPS --------
DROP TABLE IF EXISTS users;

-------- CREATE USERS --------
CREATE TABLE users(
	id_user INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(64) UNIQUE NOT NULL,
	password VARCHAR(32) NOT NULL,
	email VARCHAR(100) NOT NULL,
	name VARCHAR(64) NOT NULL,
	surname VARCHAR(64) NOT NULL
);
-------- CREATE HEALTHCARE --------
CREATE TABLE medicines(
	id_medicine INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	medicine VARCHAR(192) NOT NULL,
	cost DECIMAL(9,2),
	price DECIMAL(9,2)
);
CREATE TABLE conditions(
	id_condition INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	symptom TEXT NOT NULL,
	description TEXT NOT NULL,
	deadly BOOL NOT NULL
);

CREATE TABLE doctors(
	id_doctor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	doctor VARCHAR(32)
);

CREATE TABLE diagnoses(
	id_diagnosis INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	diagnoses TEXT NOT NULL,
	id_user INT UNSIGNED NOT NULL,
	id_condition INT UNSIGNED NOT NULL,
	id_doctor INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_condition) REFERENCES conditions(id_condition),
	FOREIGN KEY (id_doctor) REFERENCES doctors(id_doctor)
);

CREATE TABLE treatments(
	id_treatments INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_diagnosis INT UNSIGNED NOT NULL,
	id_medicine INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_treatments) REFERENCES diagnoses(id_diagnosis),
	FOREIGN KEY (id_medicine) REFERENCES medicines(id_medicine)
);
-------- CREATE REAL STATE --------
CREATE TABLE planets(
	id_planet INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	planet VARCHAR(64)
);

CREATE TABLE countries(
	id_country INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	country VARCHAR(64),
	id_planet INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_planet) REFERENCES planets(id_planet)
);

CREATE TABLE cities(
	id_city INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	city VARCHAR(64),
	id_country INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_country) REFERENCES countries(id_country)
);

CREATE TABLE streets(
	id_street INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	street VARCHAR(128),
	id_city INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_city) REFERENCES cities(id_city)
);

CREATE TABLE street_numbers(
	id_street_number INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	street_number VARCHAR(32)
);

CREATE TABLE staircases(
	id_staircase INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	staircase VARCHAR(32)
);

CREATE TABLE floors(
	id_floor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	flooor VARCHAR(32)
);

CREATE TABLE doors(
	id_door INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	door VARCHAR(32)
);

CREATE TABLE zip_codes(
	id_zip_code INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	zip_code VARCHAR(32)
);

CREATE TABLE adresses(
	id_adress INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_street INT UNSIGNED NOT NULL,
	id_street_number INT UNSIGNED NOT NULL,
	id_staircase INT UNSIGNED NOT NULL,
	id_floor INT UNSIGNED NOT NULL,
	id_zip_code INT UNSIGNED NOT NULL,
	id_user INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_street) REFERENCES streets(id_street),
	FOREIGN KEY (id_street_number) REFERENCES street_numbers(id_street_number),
	FOREIGN KEY (id_staircase) REFERENCES staircases(id_staircase),
	FOREIGN KEY (id_floor) REFERENCES floors(id_floor),
	FOREIGN KEY (id_zip_code) REFERENCES zip_codes(id_zip_code),
	FOREIGN KEY (id_user) REFERENCES users(id_user)
);

-------- CREATE CONSPIRATIONS --------
CREATE TABLE conspirations(
	id_conspiration INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	conspiration TEXT NOT NULL
);

CREATE TABLE users_conspirations(
	id_user_conspiration INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user INT UNSIGNED NOT NULL,
	id_conspiration INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_conspiration) REFERENCES conspirations(id_conspiration)
);

CREATE TABLE illuminatis(
	id_illuminati INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id_user)
);
