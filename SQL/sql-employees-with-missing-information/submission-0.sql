SELECT COALESCE(s.employee_id, e.employee_id) AS employee_id
FROM salaries s
FULL OUTER JOIN employees e
ON s.employee_id = e.employee_id
WHERE e.name IS NULL OR s.salary IS NULL
ORDER BY employee_id