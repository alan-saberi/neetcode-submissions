-- Students With Invalid Departments
-- You have two tables at a university: departments and students.

-- departments table:

-- Column Name	Type
-- id	int
-- name	varchar
-- The id column is the primary key. Each row contains information about a department at the university.

-- students table:

-- Column Name	Type
-- id	int
-- name	varchar
-- department_id	int
-- The id column is the primary key. Each row contains a student's ID, their name, and the ID of the department they are enrolled in.

-- Write a query to find the id and name of all students who are enrolled in departments that no longer exist in the departments table.

-- Return the result in any order.


SELECT s.id, s.name
FROM students s
LEFT JOIN departments d
ON s.department_id = d.id
WHERE d.name is null