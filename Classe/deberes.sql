/*TABLA*/
DROP TABLE IF EXISTS logs;
DROP TRIGGER IF EXISTS delete_character_item;
DROP TRIGGER IF EXISTS delete_character_weapon;

CREATE TABLE logs (
  id_log INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  message VARCHAR(255) NOT NULL,
  `date` DATETIME DEFAULT now(),
  `user` VARCHAR(16) DEFAULT current_user()
);

CREATE TRIGGER delete_character_item
AFTER DELETE ON characters_items
FOR EACH ROW
  INSERT INTO logs (message)
  VALUES (CONCAT("borrado item", OLD.id_item,"del personaje", OLD.id_character));

CREATE TRIGGER delete_character_weapon
AFTER DELETE ON characters_weapons
FOR EACH ROW
  INSERT INTO logs (message)
  VALUES (CONCAT("borrada el arma", OLD.id_weapon,"del personaje", OLD.id_character));

CREATE TRIGGER update_weapons
AFTER UPDATE ON weapons
FOR EACH ROW
  INSERT INTO logs (message)
  VALUES (CONCAT("El  arma", OLD.id_weapon,"ahora tiene el nombre", NEW.weapon));

