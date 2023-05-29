DROP VIEW IF EXISTS ilumi_show;
CREATE VIEW ilumi_show AS SELECT users.id_user, users.name
FROM users LEFT JOIN illuminatis ON users.id_user =
illuminatis.id_user;
