-- Write your query below
WITH actor_director AS (
    SELECT actor_id, director_id,
           COUNT(*) OVER(PARTITION BY actor_id, director_id) AS counter
    FROM actor_director 
),
max_cte AS (
    SELECT actor_id, director_id, max(counter) AS max_counter
    FROM  actor_director
    GROUP BY actor_id, director_id
)
SELECT actor_id, director_id
FROM max_cte
WHERE max_counter >=3

