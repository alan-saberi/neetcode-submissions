-- Write your query below
WITH emp_dur_cte AS (
SELECT 
emp_id, event_day, (out_time - in_time) AS DURATION_OF_VISIT
FROM employees )
SELECT event_day AS day, emp_id, SUM(DURATION_OF_VISIT) as total_time
FROM emp_dur_cte
GROUP BY emp_id, event_day