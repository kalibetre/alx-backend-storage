-- SQL script that creates a view named need_meeting that satisfies the
-- following requirements:
-- 1. the score is under (strict) 80
-- 2. AND no last_meeting date OR the last_meeting is more than 1 months ago
CREATE VIEW need_meeting
AS
SELECT name
FROM students
WHERE score < 80
AND (last_meeting IS NULL OR last_meeting < ADDDATE(CURDATE(), INTERVAL -1 MONTH));
