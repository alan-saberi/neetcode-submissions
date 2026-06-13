-- Write your query below
SELECT first_name, last_name, city, state 
FROM person P
left JOIN address A
ON P.person_id = A.person_id