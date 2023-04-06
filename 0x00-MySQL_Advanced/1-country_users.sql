-- SQL Script that creates a table named users with the following spec
-- 		columns: id, email, name and country
-- 		id is the primary key and auto increment
-- 		conuntry is enumeration of contries US, CO and TN with a default of US
-- 		if the table already exists, the script not create it again
CREATE TABLE IF NOT EXISTS users (
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255),
	country ENUM('US', 'CO', 'TN') DEFAULT 'US'
);
