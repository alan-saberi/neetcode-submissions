-- Shortest Distance in a Line
-- You are given a point table that contains positions of points on the X-axis.

-- point table:

-- Column Name	Type
-- x	int
-- The x column is the primary key. Each row represents a point's position on the X-axis.

-- Write a query to find the shortest distance between any two points in the table.
-- omg
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM point p1
JOIN point p2 ON p1.x < p2.x;