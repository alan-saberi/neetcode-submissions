-- Rearrange Products Table
-- I should unpivot the table
-- You have a table called products that stores pricing information for items across multiple store locations.

-- products table:

-- Column Name	Type
-- product_id	int
-- store1	int
-- store2	int
-- store3	int
-- The product_id column is the primary key. Each row contains the price of a product in three different stores. If a product is unavailable at a particular store, the price column for that store will be null.

-- Write a query to transform this table so that each row contains product_id, store, and price. Exclude any rows where the product is not available at that store (i.e., where the price would be null).

-- Return the result in any order.



SELECT product_id, 'store1' AS store, store1 AS price
FROM products
WHERE store1 IS NOT NULL
UNION ALL
SELECT product_id, 'store2' AS store, store2 AS price
FROM products
WHERE store2 IS NOT NULL
UNION ALL
SELECT product_id, 'store3' AS store, store3 AS price
FROM products
WHERE store3 IS NOT NULL;
