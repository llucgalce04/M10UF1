USE healthcare;



DROP TABLE IF EXISTS user_consp;
DROP TABLE IF EXISTS conspiraciones;

CREATE TABLE conspiraciones(

id_consp INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(128),
description TEXT
);

/*CREATE TABLE users (

id_user INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
username       VARCHAR(50)  NOT NULL,
password       VARCHAR(32)  NOT NULL,
password_hash_md5  VARCHAR(128) NOT NULL,
first_name     VARCHAR(50)  NOT NULL,
last_name      VARCHAR(50)  NOT NULL,
email          VARCHAR(100) NOT NULL,
date_of_birth  DATE         NOT NULL
);*/


CREATE TABLE user_consp(
id_user_consp INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_user INT UNSIGNED NOT NULL,
id_consp INT UNSIGNED NOT NULL,
FOREIGN KEY (id_user) REFERENCES users(id_user),
FOREIGN KEY (id_consp) REFERENCES conspiraciones(id_consp)
);

