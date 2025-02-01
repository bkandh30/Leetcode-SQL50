# Write your MySQL query statement below
WITH CoursesCount AS (
    SELECT class,
            COUNT(DISTINCT student) as cnt
    FROM Courses
    GROUP BY class
)

SELECT class
FROM CoursesCount
WHERE cnt >= 5