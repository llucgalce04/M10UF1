DROP FUNCTION get_city;
DELIMITER $$
CREATE FUNCTION get_city(city_name VARCHAR(64),
country_name VARCHAR(64), planet_name VARCHAR(64))
RETURNS INT UNSIGNED
BEGIN
DECLARE planet_id INT UNSIGNED;
DECLARE country_id INT UNSIGNED;
DECLARE city_id INT UNSIGNED;
SELECT id_planet INTO planet_id FROM planets WHERE name =
planet_name;
IF planet_id IS NULL THEN
INSERT INTO planets (name) VALUES (planet_name);
SET planet_id = LAST_INSERT_ID();
END IF;
SELECT id_country INTO country_id FROM countries WHERE
country = country_name AND id_planet = planet_id;
IF country_id IS NULL THEN
INSERT INTO countries (country, id_planet) VALUES
(country_name, planet_id);
SET country_id = LAST_INSERT_ID();
END IF;
SELECT id_city INTO city_id FROM cities WHERE city =
city_name AND id_country = country_id;
IF city_id IS NULL THEN
INSERT INTO cities (city, id_country) VALUES (city_name,
country_id);
SET city_id = LAST_INSERT_ID();
ELSE
SET city_id = (SELECT id_city FROM cities WHERE city =
city_name AND id_country = country_id LIMIT 1);
END IF;
RETURN city_id;
END$$
DELIMITER ;
