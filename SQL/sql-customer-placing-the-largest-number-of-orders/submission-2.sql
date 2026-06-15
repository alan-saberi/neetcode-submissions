-- Customer Placing the Largest Number of Orders
-- You are given a table containing order information. Find the customer who has placed the most orders.

-- orders table:

-- Column Name	Type
-- order_number	int
-- customer_number	int
-- The order_number column is the primary key. Each row represents an order placed by a customer identified by customer_number.

-- Write a query to find the customer_number of the customer who has placed the largest number of orders.

-- It is guaranteed that exactly one customer has placed more orders than all other customers.


WITH COUNTER_CTE AS (
SELECT
customer_number, COUNT(order_number) AS counter
FROM orders 
GROUP BY customer_number
)
SELECT customer_number
FROM COUNTER_CTE
ORDER BY counter DESC
LIMIT 1