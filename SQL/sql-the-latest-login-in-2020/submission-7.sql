-- Given a logins table that tracks user login timestamps, find the most recent login for each user during the year 2020.
-- logins table:
-- Column Name	Type
-- user_id	int
-- time_stamp	datetime
-- The combination of user_id and time_stamp forms the primary key of this table. Each row records when a specific user logged into the system.

-- Write a query to report the latest login timestamp for all users who logged in during 2020. Users who did not log in at all during 2020 should not appear in the results.

SELECT user_id, MAX(time_stamp) AS last_stamp
FROM logins
WHERE time_stamp >= '2020-01-01' AND time_stamp < '2021-01-01'
GROUP BY user_id;
