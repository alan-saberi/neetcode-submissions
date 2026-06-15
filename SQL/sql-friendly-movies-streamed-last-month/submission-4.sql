-- Friendly Movies Streamed Last Month

-- You are given two tables, tv_program and content.

-- tv_program table:

-- Column Name	Type
-- program_date	varchar
-- content_id	int
-- channel	varchar
-- The combination of program_date and content_id forms the primary key. This table stores the schedule of programs aired on TV, including the date, content ID, and the channel name.

-- content table:

-- Column Name	Type
-- content_id	int
-- title	varchar
-- kids_content	varchar
-- content_type	varchar
-- The content_id column is the primary key. The kids_content column contains either 'Y' (suitable for children) or 'N' (not suitable for children). The content_type column indicates whether it is a 'Movies', 'Series', or other type.

-- Write a query to find the distinct titles of kid-friendly movies that were streamed in June 2020.

SELECT DISTINCT c.title
FROM tv_program tv
JOIN content c
ON tv.content_id = c.content_id
WHERE 
c.kids_content = 'Y' 
AND tv.program_date BETWEEN '2020-06-01' AND '2020-07-01'
AND c.content_type = 'Movies'