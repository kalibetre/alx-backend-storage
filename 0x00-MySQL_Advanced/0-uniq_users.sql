-- SQL Script that creates a table named users with the following spec
-- 		columns: id, email and name
-- 		id is the primary key and auto increment
-- 		if the table already exists, the script not create it again
CREATE TABLE IF NOT EXISTS users (
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255)
);
