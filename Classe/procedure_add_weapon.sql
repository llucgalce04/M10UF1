DROP PROCEDURE IF EXISTS add_weapon;


DELIMITER $$

CREATE PROCEDURE add_weapon (IN id_weapon_param INT UNSIGNED)
BEGIN

	DECLARE id_char INT UNSIGNED DEFAULT 0;
	DECLARE num INT UNSIGNED DEFAULT 0;
	DECLARE salir INT DEFAULT 0;

	DECLARE cur CURSOR FOR SELECT id_character FROM characters;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET salir=1;

	OPEN cur;
	bucle:LOOP
		FETCH cur INTO id_char;

		IF salir = 1 THEN
			SELECT CONCAT("Fin del bucle");
			LEAVE bucle;
		END IF;

		SELECT COUNT(*) INTO num
			FROM characters_weapons
			WHERE id_character=id_char AND id_weapon=id_weapon_param;

		IF num = 0 THEN
			SELECT CONCAT("El personaje ", id_char, " no tiene el arma ", id_weapon_param);
			INSERT INTO characters_weapons (id_character, id_weapon) VALUES(id_char, id_weapon_param);
		END IF;
	
	END LOOP bucle;

	CLOSE cur;



END$$


DELIMITER ;
