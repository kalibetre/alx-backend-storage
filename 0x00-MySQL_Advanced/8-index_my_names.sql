-- SQL script that creates an index idx_name_first on the table names
-- on the first character of the name column
CREATE INDEX idx_name_first ON names (name(1));
