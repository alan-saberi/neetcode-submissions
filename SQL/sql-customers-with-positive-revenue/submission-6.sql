-- Write your query below
-- You are given a table customers which tracks customer revenue across different years.
-- Column Name	Type
-- customer_id	int
-- year	int
-- revenue	int
-- (customer_id, year) is the primary key for this table. The revenue can be positive, negative, or zero.
-- Write a query to find all customers who had positive revenue in the year 2020. Return only the customer_id column. The result can be returned in any order.


SELECT customer_id FROM customers 
WHERE year = 2020 AND revenue > 0;