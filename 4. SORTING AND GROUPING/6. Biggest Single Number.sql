# Write your MySQL query statement below
WITH CountNum AS (
    SELECT num, COUNT(num) as cnt
    FROM MyNumbers
    GROUP BY num
)

SELECT MAX(num) as num 
FROM CountNum
WHERE cnt = 1