USE evilcorp;

DROP TABLE IF EXISTS user_consp;
DROP TABLE IF EXISTS conspiraciones;
DROP TABLE IF EXISTS iluminatis;

CREATE TABLE conspiraciones(

id_consp INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(128),
description TEXT
);

CREATE TABLE user_consp(
id_user_consp INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_user INT UNSIGNED NOT NULL,
id_consp INT UNSIGNED NOT NULL,
FOREIGN KEY (id_user) REFERENCES users(id_user),
FOREIGN KEY (id_consp) REFERENCES conspiraciones(id_consp)
);

CREATE TABLE iluminatis(
id_iluminati INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_user INT UNSIGNED NOT NULL,
FOREIGN KEY (id_user) REFERENCES users(id_user)
);

