# Write your MySQL query statement below

# Uses scalar subquery, that returns NULL if there is no value found

SELECT 
    (SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1) AS SecondHighestSalary;

