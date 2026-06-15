-- Warehouse Manager
-- You are given two tables containing warehouse inventory and product dimension information. Calculate the total volume of inventory stored in each warehouse.

-- warehouse table:

-- Column Name	Type
-- name	varchar
-- product_id	int
-- units	int
-- The combination of name and product_id is the primary key. Each row indicates how many units of a product are stored in a particular warehouse.

-- products table:

-- Column Name	Type
-- product_id	int
-- product_name	varchar
-- width	int
-- length	int
-- height	int
-- The product_id column is the primary key. Each row contains the dimensions (width, length, height) of a product in feet.

-- Write a query to calculate the total cubic feet of volume occupied by inventory in each warehouse.
WITH WH_PR_CETE AS (
SELECT w.name AS warehouse_name, p.product_name, (p.width * p.length * p.height)* w.units AS product_volume
FROM warehouse w
JOIN products p
ON w.product_id = p.product_id)
SELECT warehouse_name, SUM(product_volume)  as volume
FROM WH_PR_CETE
GROUP BY warehouse_name