-- Task 5: Create custom function for year difference calculation

USE pandemic;

-- Drop function if exists
DROP FUNCTION IF EXISTS calculate_years_difference;

-- Create function
DELIMITER //

CREATE FUNCTION calculate_years_difference(input_year INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    DECLARE year_date DATE;
    DECLARE years_diff INT;
    
    SET year_date = MAKEDATE(input_year, 1);
    SET years_diff = YEAR(CURDATE()) - input_year;
    
    RETURN years_diff;
END//

DELIMITER ;

-- Use the function
SELECT 
    year,
    MAKEDATE(year, 1) AS year_first_day,
    CURDATE() AS cur_date,
    calculate_years_difference(year) AS years_difference
FROM cases
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year;
