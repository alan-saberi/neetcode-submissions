-- Duplicate Emails
-- You are given a person table containing user information.

-- person table:

-- Column Name	Type
-- id	int
-- email	varchar
-- The id column is the primary key for this table. Each row contains a user's ID and their email address. All emails are lowercase and are guaranteed to be non-null.

-- Write a query to find all emails that appear more than once in the table.

-- Return the result in any order.

WITH person_count_cte AS(
SELECT id, email, count(email) over(partition by email) AS counter
FROM person )
SELECT distinct(email)
FROM person_count_cte
WHERE counter > 1
