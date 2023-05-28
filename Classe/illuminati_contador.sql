CREATE VIEW ilumi_count AS SELECT COUNT(users.id_user)
users FROM users,ilumi_show;