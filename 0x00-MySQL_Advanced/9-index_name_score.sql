-- SQL script that creates an index idx_name_first on the table names
-- on the first character of the name column and the score column
CREATE INDEX idx_name_first_score ON names (name(1), score);
