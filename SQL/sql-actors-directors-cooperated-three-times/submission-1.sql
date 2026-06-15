-- Actors and Directors Who Cooperated At Least Three Times

-- You have a table called actor_director that records collaborations between actors and directors.

-- actor_director table:

-- Column Name	Type
-- actor_id	int
-- director_id	int
-- timestamp	int
-- The timestamp column is the primary key with unique values. Each row represents a collaboration where an actor worked with a director on a project.

-- Write a query to find all pairs of actor_id and director_id where the actor has worked with that director at least three times.

-- Return the result in any order.

-- WITH actor_director AS (
--     SELECT actor_id, director_id,
--            COUNT(*) OVER(PARTITION BY actor_id, director_id) AS counter
--     FROM actor_director 
-- ),
-- max_cte AS (
--     SELECT actor_id, director_id, max(counter) AS max_counter
--     FROM  actor_director
--     GROUP BY actor_id, director_id
-- )
-- SELECT actor_id, director_id
-- FROM max_cte
-- WHERE max_counter >=3

WITH actor_director AS (
    SELECT actor_id, director_id,
           COUNT(*) OVER(PARTITION BY actor_id, director_id) AS counter
    FROM actor_director 
)
SELECT actor_id, director_id
FROM  actor_director
GROUP BY actor_id, director_id
HAVING max(counter) >=3
