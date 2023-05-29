CREATE VIEW persones_per_planeta AS
SELECT planets.id_planet, planets.planet, COUNT(users.id_user) AS personas FROM planets

LEFT JOIN countries 
	ON planets.id_planet=countries.id_planet
LEFT JOIN cities 
	ON countries.id_country=cities.id_country
LEFT JOIN streets 
	ON cities.id_city=streets.id_city
LEFT JOIN addresses 
	ON streets.id_street=addresses.id_street
LEFT JOIN users 
	ON addresses.id_user=users.id_user

GROUP BY planets.id_planet, planets.planet;
