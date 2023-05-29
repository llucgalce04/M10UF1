DROP USER IF EXISTS 'parca'@'localhost';
CREATE USER 'parca'@'localhost' IDENTIFIED BY 'parca';
GRANT SELECT, UPDATE ON Evil_Corp.users TO 'parca'@'localhost';
GRANT EXECUTE ON PROCEDURE Evil_Corp.matar_usuario_planeta TO 'parca'@'localhost';
