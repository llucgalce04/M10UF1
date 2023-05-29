DROP PROCEDURE IF EXISTS matar_usuario_planeta;

DELIMITER $$

CREATE PROCEDURE matar_usuario_planeta(IN planesito VARCHAR(64))
BEGIN
	DECLARE user_name VARCHAR(64);
	SET user_name = randomuser(planesito);
	
	CALL kill_user(user_name);



END$$

DELIMITER ;
