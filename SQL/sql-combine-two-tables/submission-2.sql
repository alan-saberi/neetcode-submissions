-- Write your query below
-- Combine Two Tables
-- Given two tables, person and address, write a query that combines information from both.
-- person table:

-- Column Name	Type
-- person_id	int
-- last_name	varchar
-- first_name	varchar
-- The person_id column is the primary key. This table stores each person's ID along with their first and last name.

-- address table:

-- Column Name	Type
-- address_id	int
-- person_id	int
-- city	varchar
-- state	varchar

-- The address_id column is the primary key. Each row links a person (via person_id) to their city and state.
-- Write a SQL query that returns the first_name, last_name, city, and state for every person. If a person has no matching address record, return NULL for both city and state.

SELECT first_name, last_name, city, state 
FROM person P
left JOIN address A
ON P.person_id = A.person_id