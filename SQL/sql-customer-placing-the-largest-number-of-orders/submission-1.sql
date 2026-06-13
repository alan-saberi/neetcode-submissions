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