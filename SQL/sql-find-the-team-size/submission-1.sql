-- Find the Team Size
-- You are given an employee table that contains information about employees and the teams they belong to.

-- employee table:

-- Column Name	Type
-- employee_id	int
-- team_id	int
-- The employee_id column is the primary key. Each row represents an employee and the team they are assigned to.

-- Write a query to determine the team size for each employee. Each employee should appear in the result with their corresponding team's total member count.
SELECT employee_id,
       COUNT(team_id) OVER(PARTITION BY team_id) AS team_size
FROM employee 