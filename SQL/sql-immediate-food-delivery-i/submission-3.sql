-- mmediate Food Delivery I
-- You are given a delivery table that tracks food delivery orders.

-- delivery table:

-- Column Name	Type
-- delivery_id	int
-- customer_id	int
-- order_date	date
-- customer_pref_delivery_date	date
-- The delivery_id column is the primary key. Each row contains information about a food delivery order, including when the order was placed (order_date) and the customer's preferred delivery date (customer_pref_delivery_date), which is always on or after the order date.

-- An order is considered immediate if the customer_pref_delivery_date matches the order_date. Otherwise, it is considered scheduled.

-- Write a query to calculate the percentage of immediate orders, rounded to 2 decimal places.

WITH DIFF_CTE AS (
SELECT delivery_id, customer_id, 
    CASE
        WHEN (customer_pref_delivery_date = order_date) THEN 'immediate'
        ELSE 'scheduled'
    END AS delivery_type
FROM delivery),
PRECENTAGE_CTE AS (
    SELECT 
    delivery_type,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
    FROM DIFF_CTE
    GROUP BY delivery_type
)
SELECT COALESCE((SELECT percentage FROM PRECENTAGE_CTE WHERE delivery_type = 'immediate'), 0.00) AS immediate_percentage