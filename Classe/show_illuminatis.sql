CREATE VIEW ilumi_show AS SELECT users.id_user, users.name
FROM users LEFT JOIN iluminatis ON users.id_user =
iluminatis.id_user;