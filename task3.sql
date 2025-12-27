-- Task 3: Analyze data - calculate statistics for Number_rabies

USE pandemic;

-- Calculate average, min, max, and sum for Number_rabies
-- Grouped by unique Entity and Code combinations
SELECT 
    e.entity_name,
    e.code,
    AVG(c.number_rabies) AS avg_rabies,
    MIN(c.number_rabies) AS min_rabies,
    MAX(c.number_rabies) AS max_rabies,
    SUM(c.number_rabies) AS sum_rabies
FROM cases c
JOIN entities e ON c.entity_id = e.id
WHERE c.number_rabies IS NOT NULL 
    AND c.number_rabies != ''
GROUP BY e.id, e.entity_name, e.code
ORDER BY avg_rabies DESC
LIMIT 10;
