DROP PROCEDURE IF EXISTS kill_user;

DELIMITER $$

CREATE PROCEDURE kill_user(IN username_proc VARCHAR(64))
BEGIN
	DECLARE id_user_proc INT UNSIGNED;
	DECLARE user_proc VARCHAR(64);
	DECLARE contador INT;
	DECLARE IsDead INT;

	SELECT COUNT(*) INTO contador FROM users WHERE username = username_proc;
	ALTER TABLE users ADD COLUMN dead BOOLEAN DEFAULT FALSE;
	IF contador > 0 THEN
		
		SELECT id_user, name, dead INTO id_user_proc, user_proc, IsDead FROM users WHERE username = username_proc;
		
		IF IsDead = FALSE THEN
			UPDATE users SET dead = 1 WHERE username = username_proc;

			SELECT CONCAT('El señor', username_proc,' ha sido assesinado por Kennen Papu') AS output;
		ELSE 
			SELECT CONCAT('Ya esta muerto no puedes volver a matara a: ', username_proc) AS output;
		END IF;
	ELSE
		SELECT CONCAT('Usuario no encontrado, no es possible matarlo', username_proc) AS output;
	END IF;
END $$
DELIMITER ;
