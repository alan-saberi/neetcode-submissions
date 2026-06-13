-- Write your query below
WITH WH_PR_CETE AS (
SELECT w.name AS warehouse_name, p.product_name, (p.width * p.length * p.height)* w.units AS product_volume
FROM warehouse w
JOIN products p
ON w.product_id = p.product_id)
SELECT warehouse_name, SUM(product_volume)  as volume
FROM WH_PR_CETE
GROUP BY warehouse_name