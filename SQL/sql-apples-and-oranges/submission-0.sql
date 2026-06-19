-- Apples & Oranges
-- You have a sales table that records daily fruit sales.

-- sales table:

-- Column Name	Type
-- sale_date	date
-- fruit	varchar
-- sold_num	int
-- The combination of (sale_date, fruit) serves as the primary key. This table contains sales records for apples and oranges for each day.

-- Write a query to calculate the difference between the number of apples and oranges sold on each day.

-- Return the result ordered by sale_date.

SELECT
    sale_date,
    SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) AS diff
FROM sales
GROUP BY sale_date
ORDER BY sale_date;