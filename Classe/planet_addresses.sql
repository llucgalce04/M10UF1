CREATE VIEW planet_addresses AS SELECT planets.planet,
COUNT(*) planet_addresses FROM planets, addresses, users,
users_planets, users_addresses WHERE
users.id_user=users_planets.id_user AND
users_planets.id_planet=planets.id_planet AND
users.id_user=users_addresses.id_user AND
addresses.id_address=users_addresses.id_address GROUP BY
planets.planet;