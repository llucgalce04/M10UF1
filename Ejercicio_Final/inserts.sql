--------- USERS ---------
INSERT INTO users (username, password, email, name, surname)
VALUES ('john_doe', 'pass123', 'john@example.com', 'John', 'Doe');

INSERT INTO users (username, password, email, name, surname)
VALUES ('jane_smith', 'abc456', 'jane@example.com', 'Jane', 'Smith');

INSERT INTO users (username, password, email, name, surname)
VALUES ('mike_johnson', 'qwerty', 'mike@example.com', 'Mike', 'Johnson');

INSERT INTO users (username, password, email, name, surname)
VALUES ('sarah_williams', 'pass321', 'sarah@example.com', 'Sarah', 'Williams');

INSERT INTO users (username, password, email, name, surname)
VALUES ('robert_smith', 'secret', 'robert@example.com', 'Robert', 'Smith');

--------- MEDICINES ---------
INSERT INTO medicines (medicine, cost, price)
VALUES ('Aspirin', 5.99, 9.99);

INSERT INTO medicines (medicine, cost, price)
VALUES ('Paracetamol', 3.49, 7.99);

INSERT INTO medicines (medicine, cost, price)
VALUES ('Ibuprofen', 4.99, 8.99);

INSERT INTO medicines (medicine, cost, price)
VALUES ('Amoxicillin', 7.99, 12.99);

INSERT INTO medicines (medicine, cost, price)
VALUES ('Omeprazole', 6.49, 10.99);

--------- CONDITIONS ---------
INSERT INTO conditions (name, symptom, description, deadly)
VALUES ('Flu', 'Fever, cough, sore throat', 'Common viral infection', FALSE);

INSERT INTO conditions (name, symptom, description, deadly)
VALUES ('Diabetes', 'Increased thirst, frequent urination', 'Chronic metabolic disease', TRUE);

INSERT INTO conditions (name, symptom, description, deadly)
VALUES ('Hypertension', 'High blood pressure', 'Cardiovascular disorder', FALSE);

INSERT INTO conditions (name, symptom, description, deadly)
VALUES ('Asthma', 'Shortness of breath, wheezing', 'Chronic respiratory disease', FALSE);

INSERT INTO conditions (name, symptom, description, deadly)
VALUES ('Cancer', 'Unexplained weight loss, fatigue', 'Malignant tumor growth', TRUE);

--------- DOCTORS ---------
INSERT INTO doctors (doctor)
VALUES ('Dr. Smith');

INSERT INTO doctors (doctor)
VALUES ('Dr. Johnson');

INSERT INTO doctors (doctor)
VALUES ('Dr. Anderson');

INSERT INTO doctors (doctor)
VALUES ('Dr. Davis');

INSERT INTO doctors (doctor)
VALUES ('Dr. Wilson');

--------- DIAGNOSES ---------
INSERT INTO diagnoses (diagnoses, id_user, id_condition, id_doctor)
VALUES ('You have the flu. Get plenty of rest and drink fluids.', 1, 1, 1);
INSERT INTO diagnoses (diagnoses, id_user, id_condition, id_doctor)
VALUES ('You have diabetes. Follow a healthy diet and take medication as prescribed.', 2, 2, 2);
INSERT INTO diagnoses (diagnoses, id_user, id_condition, id_doctor)
VALUES ('You have hypertension. Monitor your blood pressure regularly.', 3, 3, 3);
INSERT INTO diagnoses (diagnoses, id_user, id_condition, id_doctor)
VALUES ('You have asthma. Use an inhaler as needed.', 4, 4, 4);
INSERT INTO diagnoses (diagnoses, id_user, id_condition, id_doctor)
VALUES ('You have cancer. Further tests and treatment options will be discussed.', 5, 5, 5);

--------- TREATMENTS ---------
INSERT INTO treatments (id_diagnosis, id_medicine)
VALUES (1, 1);

INSERT INTO treatments (id_diagnosis, id_medicine)
VALUES (2, 3);

INSERT INTO treatments (id_diagnosis, id_medicine)
VALUES (3, 2);

INSERT INTO treatments (id_diagnosis, id_medicine)
VALUES (4, 5);

INSERT INTO treatments (id_diagnosis, id_medicine)
VALUES (5, 4);

--------- PLANETS ---------
INSERT INTO planets (planet)
VALUES ('Mercury');

INSERT INTO planets (planet)
VALUES ('Venus');

INSERT INTO planets (planet)
VALUES ('Earth');

INSERT INTO planets (planet)
VALUES ('Mars');

INSERT INTO planets (planet)
VALUES ('Jupiter');

--------- COUNTRIES ---------
INSERT INTO countries (country, id_planet)
VALUES ('United States', 3);

INSERT INTO countries (country, id_planet)
VALUES ('Canada', 3);

INSERT INTO countries (country, id_planet)
VALUES ('United Kingdom', 3);

INSERT INTO countries (country, id_planet)
VALUES ('Germany', 3);

INSERT INTO countries (country, id_planet)
VALUES ('Australia', 3);

--------- CITIES ---------
INSERT INTO cities (city, id_country)
VALUES ('New York', 1);

INSERT INTO cities (city, id_country)
VALUES ('Toronto', 2);

INSERT INTO cities (city, id_country)
VALUES ('London', 3);

INSERT INTO cities (city, id_country)
VALUES ('Berlin', 4);

INSERT INTO cities (city, id_country)
VALUES ('Sydney', 5);

--------- STREETS ---------
INSERT INTO streets (street, id_city)
VALUES ('Main Street', 1);

INSERT INTO streets (street, id_city)
VALUES ('Queen Street', 2);

INSERT INTO streets (street, id_city)
VALUES ('Oxford Street', 3);

INSERT INTO streets (street, id_city)
VALUES ('Unter den Linden', 4);

INSERT INTO streets (street, id_city)
VALUES ('George Street', 5);

--------- STREETS NUMBERS ---------
INSERT INTO street_numbers (street_number)
VALUES ('123');

INSERT INTO street_numbers (street_number)
VALUES ('456');

INSERT INTO street_numbers (street_number)
VALUES ('789');

INSERT INTO street_numbers (street_number)
VALUES ('10A');

INSERT INTO street_numbers (street_number)
VALUES ('20B');

--------- STAIRCASES ---------
INSERT INTO staircases (staircase)
VALUES ('A');

INSERT INTO staircases (staircase)
VALUES ('B');

INSERT INTO staircases (staircase)
VALUES ('C');

INSERT INTO staircases (staircase)
VALUES ('D');

INSERT INTO staircases (staircase)
VALUES ('E');

--------- FLOORS ---------
INSERT INTO floors (flooor)
VALUES ('1st Floor');

INSERT INTO floors (flooor)
VALUES ('2nd Floor');

INSERT INTO floors (flooor)
VALUES ('3rd Floor');

INSERT INTO floors (flooor)
VALUES ('4th Floor');

INSERT INTO floors (flooor)
VALUES ('5th Floor');

--------- DOORS ---------
INSERT INTO doors (door)
VALUES ('Door 1');

INSERT INTO doors (door)
VALUES ('Door 2');

INSERT INTO doors (door)
VALUES ('Door 3');

INSERT INTO doors (door)
VALUES ('Door 4');

INSERT INTO doors (door)
VALUES ('Door 5');

--------- ZIP CODES ---------
INSERT INTO zip_codes (zip_code)
VALUES ('12345');

INSERT INTO zip_codes (zip_code)
VALUES ('67890');

INSERT INTO zip_codes (zip_code)
VALUES ('24680');

INSERT INTO zip_codes (zip_code)
VALUES ('13579');

INSERT INTO zip_codes (zip_code)
VALUES ('97531');

--------- ADDRESSES ---------
INSERT INTO adresses (id_street, id_street_number, id_staircase, id_floor, id_zip_code, id_user)
VALUES (1, 1, 1, 1, 1, 1);

INSERT INTO adresses (id_street, id_street_number, id_staircase, id_floor, id_zip_code, id_user)
VALUES (2, 2, 2, 2, 2, 2);

INSERT INTO adresses (id_street, id_street_number, id_staircase, id_floor, id_zip_code, id_user)
VALUES (3, 3, 3, 3, 3, 3);

INSERT INTO adresses (id_street, id_street_number, id_staircase, id_floor, id_zip_code, id_user)
VALUES (4, 4, 4, 4, 4, 4);

INSERT INTO adresses (id_street, id_street_number, id_staircase, id_floor, id_zip_code, id_user)
VALUES (5, 5, 5, 5, 5, 5);

--------- CONSPIRATIONS ---------
INSERT INTO conspirations (conspiration)
VALUES ('Conspiracy 1');

INSERT INTO conspirations (conspiration)
VALUES ('Conspiracy 2');

INSERT INTO conspirations (conspiration)
VALUES ('Conspiracy 3');

INSERT INTO conspirations (conspiration)
VALUES ('Conspiracy 4');

INSERT INTO conspirations (conspiration)
VALUES ('Conspiracy 5');

--------- USER CONSPIRATIONS ---------
INSERT INTO users_conspirations (id_user, id_conspiration)
VALUES (1, 1);

INSERT INTO users_conspirations (id_user, id_conspiration)
VALUES (2, 2);

INSERT INTO users_conspirations (id_user, id_conspiration)
VALUES (3, 3);

INSERT INTO users_conspirations (id_user, id_conspiration)
VALUES (4, 4);

INSERT INTO users_conspirations (id_user, id_conspiration)
VALUES (5, 5);

--------- ILLUMINATIS ---------
INSERT INTO illuminatis (id_user)
VALUES (1);

INSERT INTO illuminatis (id_user)
VALUES (2);

INSERT INTO illuminatis (id_user)
VALUES (3);

INSERT INTO illuminatis (id_user)
VALUES (4);

INSERT INTO illuminatis (id_user)
VALUES (5);
