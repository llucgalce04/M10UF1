CREATE VIEW persones_per_planeta AS
SELECT planets.id_planet, planets.planet, COUNT(users.id_user) AS personas FROM planets

LEFT JOIN countries 
	ON planets.id_planet=countries.id_planet
LEFT JOIN cities 
	ON countries.id_country=cities.id_country
LEFT JOIN streets 
	ON cities.id_city=streets.id_city
LEFT JOIN adresses 
	ON streets.id_street=adresses.id_street
LEFT JOIN users 
	ON adresses.id_user=users.id_user

GROUP BY planets.id_planet, planets.planet;
