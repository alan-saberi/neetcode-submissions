-- Sellers With No Sales
-- You are given three tables: customer, orders, and seller.
-- customer table:

-- Column Name	Type
-- customer_id	int
-- customer_name	varchar
-- The customer_id column is the primary key. Each row contains information about a customer in the store.

-- orders table:

-- Column Name	Type
-- order_id	int
-- sale_date	date
-- order_cost	int
-- customer_id	int
-- seller_id	int
-- The order_id column is the primary key. Each row represents a transaction between a customer and a seller on a given date.

-- seller table:

-- Column Name	Type
-- seller_id	int
-- seller_name	varchar
-- The seller_id column is the primary key. Each row contains information about a seller.

--Q) Write a query to find the names of all sellers who did not make any sales in the year 2020.

-- Return the result ordered by seller_name in ascending order.
-- SELECT s.seller_name
-- FROM seller s
-- WHERE s.seller_id NOT IN (
--     SELECT seller_id
--     FROM orders
--     WHERE sale_date >= '2020-01-01' AND sale_date <= '2020-12-31'
-- )
-- ORDER BY s.seller_name;

-- join solution: left join 

SELECT s.seller_name
FROM seller s
LEFT JOIN orders o
    ON s.seller_id = o.seller_id
   AND o.sale_date >= '2020-01-01' AND o.sale_date <= '2020-12-31'
WHERE o.order_id IS NULL
ORDER BY s.seller_name ASC;