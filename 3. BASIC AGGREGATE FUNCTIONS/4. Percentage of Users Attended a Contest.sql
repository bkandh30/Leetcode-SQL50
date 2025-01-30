# Write your MySQL query statement below
With TotalUsers AS (
    SELECT COUNT(*) AS total
    FROM Users
)

SELECT contest_id,
       ROUND(COUNT(user_id) * 100.0 / (SELECT total FROM TotalUsers), 2) as percentage
FROM Register r
GROUP BY contest_id
ORDER BY percentage DESC,
        contest_id ASC
        