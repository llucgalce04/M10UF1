DELIMITER $$
DROP PROCEDURE IF EXISTS procedimiencito;
CREATE PROCEDURE procedimiencito (id_conspiration INT, id_user INT, id_telacreiste INT)
BEGIN

    DECLARE handlercito INT DEFAULT 1;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET handlercito = 0;

    START TRANSACTION;  
    
	INSERT INTO users_conspiraciones (id_user, id_conspiration) VALUES (id_user, id_conspirartion) 
    
	IF id_telacreiste = 1 THEN
		COMMIT;
    ELSE
        ROLLBACK;
    END IF;

END $$

DELIMITER ;





