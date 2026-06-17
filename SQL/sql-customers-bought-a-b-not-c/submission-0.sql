-- Customers Who Bought A and B but Not C
-- You are given two tables: customers and orders.

-- customers table:

-- Column Name	Type
-- customer_id	int
-- customer_name	varchar
-- customer_id is the primary key for this table. Each row contains a customer's ID and name.

-- orders table:

-- Column Name	Type
-- order_id	int
-- customer_id	int
-- product_name	varchar
-- order_id is the primary key for this table. customer_id references the customers table. Each row represents an order placed by a customer for a specific product.

-- Write a query to find customers who purchased both products 'A' and 'B' but have never purchased product 'C'. These are potential customers to target for product C recommendations.

-- Return the customer_id and customer_name of these customers, ordered by customer_name.

-- SELECT c.customer_id, c.customer_name
-- FROM customers c
-- WHERE c.customer_id IN (
--     SELECT customer_id FROM orders WHERE product_name = 'A'
-- )
-- AND c.customer_id IN (
--     SELECT customer_id FROM orders WHERE product_name = 'B'
-- )
-- AND c.customer_id NOT IN (
--     SELECT customer_id FROM orders WHERE product_name = 'C'
-- )
-- ORDER BY c.customer_name;


SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING
    SUM(CASE WHEN o.product_name = 'A' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN o.product_name = 'B' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN o.product_name = 'C' THEN 1 ELSE 0 END) = 0
ORDER BY
    c.customer_name;