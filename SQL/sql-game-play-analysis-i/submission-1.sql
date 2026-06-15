-- Game Play Analysis I
-- Given an activity table that records player gaming sessions, find the first login date for each player.

-- activity table:

-- Column Name	Type
-- player_id	int
-- device_id	int
-- event_date	date
-- games_played	int
-- The combination of player_id and event_date forms the primary key of this table. Each row represents a gaming session where a player logged in on a specific date using a particular device and played some number of games (possibly 0).

-- Write a query to find the first login date for each player.

SELECT player_id, MIN(event_date) AS first_login
FROM activity 
GROUP BY player_id
