-- SQL script that creates a stored procedure that computes and sotres the
-- average weighted score of a student
delimiter //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (
		IN user_id INT
)
BEGIN
	UPDATE users
	SET average_score = (
		SELECT SUM(corrections.score * projects.weight) / SUM(projects.weight)
		FROM corrections
		JOIN projects
		ON projects.id = corrections.project_id AND corrections.user_id = user_id
	)
	WHERE id = user_id;
END//
delimiter ;
