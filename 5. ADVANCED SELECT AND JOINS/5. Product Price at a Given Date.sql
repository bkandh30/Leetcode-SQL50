# Write your MySQL query statement below
WITH RankedProducts AS (
    SELECT product_id,
            new_price AS price,
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS row_num
    FROM Products
    WHERE change_date <= '2019-08-16'
)

SELECT product_id,
        price
FROM RankedProducts
WHERE row_num = 1

UNION

SELECT product_id,
        10 AS price
FROM Products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM RankedProducts)