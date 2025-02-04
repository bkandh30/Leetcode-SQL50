# Write your MySQL query statement below
WITH Categories AS (
    SELECT 'Low Salary' as category
    UNION SELECT 'Average Salary'
    UNION SELECT 'High Salary'
),
CategoryCounts AS (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END as category,
        COUNT(*) as accounts_count
    FROM Accounts
    GROUP BY 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END
)
SELECT 
    c.category,
    COALESCE(cc.accounts_count, 0) as accounts_count
FROM Categories c
LEFT JOIN CategoryCounts cc ON c.category = cc.category;