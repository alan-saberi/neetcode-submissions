-- Write your query below
SELECT DISTINCT c.title
FROM tv_program tv
JOIN content c
ON tv.content_id = c.content_id
WHERE 
c.kids_content = 'Y' 
AND tv.program_date BETWEEN '2020-06-01' AND '2020-07-01'
AND c.content_type = 'Movies'