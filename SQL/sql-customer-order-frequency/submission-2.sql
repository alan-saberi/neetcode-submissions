-- Customer Order Frequency
-- You are given three tables: customers, product, and orders.

-- customers table:

-- Column Name	Type
-- customer_id	int
-- name	varchar
-- country	varchar
-- The customer_id column contains unique values. Each row provides information about a customer.

-- product table:

-- Column Name	Type
-- product_id	int
-- description	varchar
-- price	int
-- The product_id column contains unique values. Each row describes a product and its price.

-- orders table:

-- Column Name	Type
-- order_id	int
-- customer_id	int
-- product_id	int
-- order_date	date
-- quantity	int
-- The order_id column contains unique values. Each row records an order where a customer purchased a certain quantity of a product on a given date.

-- Write a query to find the customer_id and name of customers who spent at least $100 in both June 2020 and July 2020.

-- Return the result in any order.

select c.customer_id, c.name
from customers c
join orders o
on c.customer_id = o.customer_id
join product p
on p.product_id = o.product_id
group by c.customer_id, c.name
having sum(case when o.order_date >= '2020-06-01' and o.order_date <= '2020-06-30' then o.quantity * p.price else 0 end) >= 100
   and sum(case when o.order_date >= '2020-07-01' and o.order_date <= '2020-07-31' then o.quantity * p.price else 0 end) >= 100