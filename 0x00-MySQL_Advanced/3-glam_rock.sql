-- SQL script that lists all bands with Glam rock as their main style
-- ranked by thier longevity (number of years they have been active)
SELECT band_name, COALESCE(split, YEAR(CURDATE())) - formed AS lifespan 
FROM metal_bands 
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
