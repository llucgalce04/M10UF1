DROP PROCEDURE IF EXISTS kill_user;

DELIMITER $$

CREATE PROCEDURE kill_user(IN username_proc VARCHAR(64))
BEGIN
    DECLARE id_user_proc INT UNSIGNED;
    DECLARE user_proc VARCHAR(64);
    DECLARE contador INT;
    DECLARE IsDead INT;
    DECLARE column_exists INT;

    SELECT COUNT(*) INTO contador FROM users WHERE username = username_proc;
    IF contador > 0 THEN
        -- Verificar si la columna 'dead' ya existe en la tabla 'users'
        SELECT COUNT(*) INTO column_exists FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'dead';
        
        IF column_exists = 0 THEN
            -- Agregar la columna 'dead' solo si no existe
            ALTER TABLE users ADD COLUMN dead BOOLEAN DEFAULT FALSE;
        END IF;

        SELECT id_user, name, dead INTO id_user_proc, user_proc, IsDead FROM users WHERE username = username_proc;

        IF IsDead = FALSE THEN
            UPDATE users SET dead = 1 WHERE username = username_proc;
            SELECT CONCAT('El señor', username_proc,' ha sido asesinado por Kennen Papu') AS output;
        ELSE 
            SELECT CONCAT('Ya está muerto, no puedes volver a matar a: ', username_proc) AS output;
        END IF;
    ELSE
        SELECT CONCAT('Usuario no encontrado, no es posible matarlo: ', username_proc) AS output;
    END IF;
END $$
DELIMITER ;

