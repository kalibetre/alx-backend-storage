-- SQL script that creates a stored procedure that computes and sotres the
-- average weighted score of a student
delimiter //
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
	UPDATE users, (
		SELECT corrections.user_id as user_id, SUM(corrections.score * projects.weight) / SUM(projects.weight) as average_score
		FROM corrections
		JOIN projects
		ON projects.id = corrections.project_id
		GROUP BY corrections.user_id
	) AS result
	SET users.average_score = result.average_score
	WHERE users.id = result.user_id;
END//
delimiter ;
