# Write your MySQL query statement below
WITH CumulativeQueue AS (
    SELECT *,
        SUM(weight) OVER (ORDER BY turn) as CumulativeWeight
    FROM Queue
    ORDER BY turn
)

SELECT person_name
FROM CumulativeQueue
WHERE CumulativeWeight <= 1000
ORDER BY turn DESC
Limit 1