-- SQL script that creates an index idx_name_first_score on the table names
-- and the first letter of name
CREATE INDEX idx_name_first_score ON names (name(1));
