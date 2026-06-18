-- team Scores in Football Tournament
-- You have two tables tracking a football tournament: teams which stores team information, and matches which records the results of each game played.

-- teams table:

-- Column Name	Type
-- team_id	int
-- team_name	varchar
-- The team_id column is the primary key. Each row represents a football team in the tournament.

-- matches table:

-- Column Name	Type
-- match_id	int
-- host_team	int
-- guest_team	int
-- host_goals	int
-- guest_goals	int
-- The match_id column is the primary key. Each row records a completed match between two teams. The host_team and guest_team columns reference team_id from the teams table, and host_goals and guest_goals indicate the number of goals scored by each side.

-- Calculate the total points for each team based on the following scoring rules:

-- 3 points for a win (scoring more goals than the opponent)
-- 1 point for a draw (scoring the same number of goals)
-- 0 points for a loss (scoring fewer goals)
-- Write a query that returns the team_id, team_name, and num_points for every team.

-- Return the results ordered by num_points in descending order. If there is a tie, order by team_id in ascending order.
SELECT
    t.team_id,
    t.team_name,
    COALESCE(SUM(p.points), 0) AS num_points
FROM teams t
LEFT JOIN (
    SELECT
        host_team AS team_id,
        CASE
            WHEN host_goals > guest_goals THEN 3
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END AS points
    FROM matches

    UNION ALL

    SELECT
        guest_team AS team_id,
        CASE
            WHEN guest_goals > host_goals THEN 3
            WHEN guest_goals = host_goals THEN 1
            ELSE 0
        END AS points
    FROM matches
) p
    ON t.team_id = p.team_id
GROUP BY
    t.team_id,
    t.team_name
ORDER BY
    num_points DESC,
    t.team_id ASC;