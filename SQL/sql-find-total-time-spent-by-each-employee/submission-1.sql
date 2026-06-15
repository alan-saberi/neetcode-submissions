-- Find Total Time Spent by Each Employee
-- Given an employees table that tracks office entries and exits, calculate the total time each employee spent at the office on each day.
-- employees table:

-- Column Name	Type
-- emp_id	int
-- event_day	date
-- in_time	int
-- out_time	int
-- The combination of (emp_id, event_day, in_time) forms the primary key. Each row records when an employee entered and left the office. The event_day is the date, while in_time and out_time represent the minute of entry and exit respectively (values range from 1 to 1440).

-- Note that an employee may enter and leave the office multiple times on the same day. The time spent for each visit is calculated as out_time - in_time. It is guaranteed that no two events on the same day overlap, and in_time < out_time.

-- Write a query to calculate the total time in minutes spent by each employee on each day at the office.
WITH emp_dur_cte AS (
SELECT 
emp_id, event_day, (out_time - in_time) AS DURATION_OF_VISIT
FROM employees )
SELECT event_day AS day, emp_id, SUM(DURATION_OF_VISIT) as total_time
FROM emp_dur_cte
GROUP BY emp_id, event_day