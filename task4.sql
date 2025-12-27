-- Task 4: Build year difference column

USE pandemic;

-- Create date from year, current date, and calculate year difference
SELECT 
    year,
    MAKEDATE(year, 1) AS year_first_day,
    CURDATE() AS cur_date,
    YEAR(CURDATE()) - year AS years_difference
FROM cases
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year;
