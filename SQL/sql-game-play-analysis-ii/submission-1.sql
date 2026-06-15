-- Game Play Analysis II
-- Given an activity table that records player gaming sessions, find the device each player first logged in with.

-- activity table:

-- Column Name	Type
-- player_id	int
-- device_id	int
-- event_date	date
-- games_played	int
-- The combination of player_id and event_date forms the primary key of this table. Each row represents a gaming session where a player logged in on a specific date using a particular device and played some number of games (possibly 0).

-- Write a query to report the device that each player used for their first login.

-- Return the result in any order.
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