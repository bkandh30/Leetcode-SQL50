# Write your MySQL query statement below
WITH ConsecutiveCheck AS (
    SELECT num,
        LAG(num, 1) OVER (ORDER BY id) as prev1,
        LAG(num, 2) OVER (ORDER BY id) as prev2
    FROM Logs
)

SELECT DISTINCT num as ConsecutiveNums
FROM ConsecutiveCheck
WHERE num = prev1 
AND num = prev2;