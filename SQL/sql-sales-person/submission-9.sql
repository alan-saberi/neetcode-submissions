-- Sales Person
-- Given three tables containing information about sales representatives, companies, and orders, write a query to find salespeople who have never made sales to a specific company.

-- sales_person table:

-- Column Name	Type
-- sales_id	int
-- name	varchar
-- salary	int
-- commission_rate	int
-- hire_date	date
-- The sales_id column is the primary key. Each row contains information about a salesperson including their name, salary, commission rate, and when they were hired.

-- company table:

-- Column Name	Type
-- com_id	int
-- name	varchar
-- city	varchar
-- The com_id column is the primary key. Each row contains the company's ID, name, and the city where it is located.

-- orders table:

-- Column Name	Type
-- order_id	int
-- order_date	date
-- com_id	int
-- sales_id	int
-- amount	int
-- The order_id column is the primary key. The com_id column references the company table, and sales_id references the sales_person table. Each row represents an order with the company, salesperson, date, and amount.

-- Write a SQL query to find the names of all salespeople who have not made any orders with the company named "CRIMSON".

SELECT sp.name
FROM sales_person sp
WHERE sp.sales_id NOT IN (
    SELECT o.sales_id
    FROM orders o
    JOIN company c ON o.com_id = c.com_id
    WHERE c.name = 'CRIMSON'
);
