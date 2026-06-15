-- Write your query below
-- Calculate Special Bonus
-- You are given an employees table containing employee information.

-- Column Name	Type
-- employee_id	int
-- name	varchar
-- salary	int

-- employee_id is the primary key (column with unique values) for this table. Each row contains the employee's ID, name, and salary.

-- Write a query to calculate the bonus for each employee. An employee receives a bonus equal to 100% of their salary if:

-- Their employee_id is an odd number, AND
-- Their name does not start with the letter 'M'
-- Otherwise, the bonus is 0.

-- Return the employee_id and bonus for each employee, ordered by employee_id.


SELECT employee_id, 
CASE
    WHEN employee_id % 2 = 1 AND SUBSTRING(name, 1, 1) != 'M' THEN salary
    ELSE 0
END AS bonus 
FROM employees 
ORDER BY employee_id