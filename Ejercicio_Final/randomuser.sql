DROP FUNCTION IF EXISTS randomuser;

DELIMITER $$

CREATE FUNCTION randomuser(planeta VARCHAR(64))
RETURNS VARCHAR(64)
BEGIN
	DECLARE ruser VARCHAR(64);

	SELECT username INTO ruser FROM users

	LEFT JOIN adresses ON users.id_user=adresses.id_user
	LEFT JOIN streets ON adresses.id_street=streets.id_street
	LEFT JOIN cities ON streets.id_city=cities.id_city
	LEFT JOIN countries ON cities.id_country=countries.id_country
	LEFT JOIN planets ON countries.id_planet=planets.id_planet
	WHERE planets.planet=planeta
	
	ORDER BY RAND()
	LIMIT 1;

	RETURN ruser;

END $$

DELIMITER ;
