-- Write your query below
WITH person_count_cte AS(
SELECT id, email, count(email) over(partition by email) AS counter
FROM person )
SELECT distinct(email)
FROM person_count_cte
WHERE counter > 1
