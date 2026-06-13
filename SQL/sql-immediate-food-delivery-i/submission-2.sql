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