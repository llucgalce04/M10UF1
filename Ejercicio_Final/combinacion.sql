DROP PROCEDURE IF EXISTS parcaproc;

DELIMITER $$

CREATE PROCEDURE parcaproc(IN planetita VARCHAR(64))
BEGIN
	DECLARE user_name VARCHAR(64);
	SET user_name = randomuser(planetita);
	
	CALL deadproc(user_name);



END$$

DELIMITER ;
