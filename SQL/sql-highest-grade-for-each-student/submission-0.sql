-- Highest Grade For Each Student
-- You are given an exam_results table containing student exam scores.

-- Column Name	Type
-- student_id	int
-- exam_id	int
-- score	int
-- (student_id, exam_id) is the primary key (combination of columns with unique values) for this table. Each row represents a student's score on a particular exam. The score column is never NULL.

-- Write a query to find each student's highest score along with the corresponding exam_id. If a student has the same highest score on multiple exams, return the one with the smallest exam_id.

-- Return the student_id, exam_id, and score, ordered by student_id in ascending order.
WITH MAX_SCORE_CTE AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY score DESC, exam_id ASC) as rnk
FROM exam_results)
SELECT student_id, exam_id, score
FROM MAX_SCORE_CTE
WHERE rnk = 1
ORDER BY student_id