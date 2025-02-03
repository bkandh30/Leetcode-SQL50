# Write your MySQL query statement below
WITH FirstLogin AS (
    SELECT 
        player_id,
        MIN(event_date) as first_login
    FROM Activity
    GROUP BY player_id
),
ConsecutiveLogin AS (
    SELECT 
        f.player_id,
        CASE WHEN EXISTS (
            SELECT 1 
            FROM Activity a 
            WHERE a.player_id = f.player_id 
            AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
        ) THEN 1 ELSE 0 END as logged_consecutive
    FROM FirstLogin f
)
SELECT 
    ROUND(
        SUM(logged_consecutive) / COUNT(*), 
        2
    ) as fraction
FROM ConsecutiveLogin;