CREATE VIEW medprices AS
SELECT planets.id_planet, planets.planet, SUM(medicines.price) AS preu FROM planets

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
LEFT JOIN diagnoses
	ON users.id_user=diagnoses.id_user
LEFT JOIN treatments
	ON diagnoses.id_diagnosis=treatments.id_diagnosis
LEFT JOIN medicines
	ON treatments.id_medicine=medicines.id_medicine


GROUP BY planets.id_planet, planets.planet;
