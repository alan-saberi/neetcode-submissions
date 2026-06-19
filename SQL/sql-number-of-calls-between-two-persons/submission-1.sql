-- Number of Calls Between Two Persons

-- You are given a calls table that logs phone calls between users.

-- calls table:

-- Column Name	Type
-- from_id	int
-- to_id	int
-- duration	int
-- This table has no primary key and may contain duplicate entries. Each row represents a phone call from from_id to to_id with a given duration in seconds. Note that from_id is always different from to_id.

-- Write a query to report the number of calls and the total call duration between each pair of distinct users (person1, person2) where person1 < person2.

-- Return the result in any order.


SELECT
    LEAST(from_id, to_id) AS person1,
    GREATEST(from_id, to_id) AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM calls
GROUP BY
    LEAST(from_id, to_id),
    GREATEST(from_id, to_id);
