DROP PROCEDURE IF EXISTS muestra_hp;

DELIMITER $$

CREATE PROCEDURE muestra_hp()
BEGIN
	DECLARE id_char INT UNSIGNED;
	DECLARE hp_char INT;

	DECLARE salir INT DEFAULT 0;

	DECLARE cur CURSOR FOR SELECT id_character, hp FROM stats; /*Cursor*/

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET salir=1; /*Evento con handler*/

	OPEN cur;
	bucle:LOOP /*Bucle*/
		FETCH cur INTO id_char, hp_char; /*Fetch*/
		
		IF salir = 1 THEN /*Condición*/
			SELECT CONCAT ("Fin del bucle") AS end_text;
			LEAVE bucle;
		END IF;

		IF hp_char <= 26 THEN /*Condición*/
			UPDATE stats SET hp=99 WHERE stats.id_character=id_char;
		END IF;

	END LOOP bucle;
	CLOSE cur;

END $$

DELIMITER ;
