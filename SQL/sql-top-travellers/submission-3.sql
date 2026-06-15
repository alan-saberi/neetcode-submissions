-- Top Travellers
-- Given two tables, users and rides, write a query to calculate the total distance traveled by each user.
-- users table:
-- Column Name	Type
-- id	int
-- name	varchar
-- The id column is the primary key. This table contains user information including their unique ID and name.

-- rides table:
-- Column Name	Type
-- id	int
-- user_id	int
-- distance	int
-- The id column is the primary key. Each row represents a trip where user_id indicates who took the trip and distance is how far they traveled.

-- Write a SQL query that reports the total distance each user has traveled. Return the results sorted by travelled_distance in descending order. If multiple users have the same total distance, sort them by name in ascending order.

SELECT u.name, COALESCE(sum(r.distance),0) AS travelled_distance
FROM users u
LEFT JOIN rides r
ON u.id = r.user_id
GROUP BY u.name
ORDER BY travelled_distance desc, u.name asc