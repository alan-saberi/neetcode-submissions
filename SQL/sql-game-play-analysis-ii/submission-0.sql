-- Write your query below
WITH act_cte as (
SELECT 
player_id,
device_id,
event_date,
MIN(event_date) OVER(PARTITION BY player_id) AS min_event_date
FROM activity )
SELECT player_id, device_id
FROM act_cte
WHERE min_event_date = event_date
ORDER BY player_id