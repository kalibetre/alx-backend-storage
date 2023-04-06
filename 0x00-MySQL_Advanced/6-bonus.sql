-- SQL script that creates a stored procedure AddBonus that adds a new
-- correction for a student. The stored procedure takes the student's user_id
-- project_name, and score. If project_name is not in projects table then it
-- is added.
delimiter //
CREATE PROCEDURE AddBonus (
		IN user_id INT,
		IN project_name varchar(255),
		IN score INT
)
BEGIN
	DECLARE project_id INT;

	IF NOT EXISTS (SELECT * FROM projects WHERE name = project_name) THEN
		INSERT INTO projects (name) VALUES (project_name);
	END IF;
  
	SET @project_id = (SELECT id FROM projects WHERE name = project_name);

	INSERT INTO corrections (user_id, project_id, score) 
	VALUES (user_id, @project_id, score);
END//
delimiter ;
