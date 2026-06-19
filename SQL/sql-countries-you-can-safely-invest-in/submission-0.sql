-- Countries You Can Safely Invest In
-- A telecommunications company wants to expand into new markets. They plan to invest in countries where the average call duration is strictly greater than the global average call duration across all calls.

-- You are given three tables: person, country, and calls.

-- person table:

-- Column Name	Type
-- id	int
-- name	varchar
-- phone_number	varchar
-- The id column is the primary key. Each row contains a person's name and phone number. The phone number format is xxx-yyyyyyy where xxx is a 3-digit country code and yyyyyyy is a 7-digit local number.

-- country table:

-- Column Name	Type
-- name	varchar
-- country_code	varchar
-- The country_code column is the primary key. Each row maps a country name to its 3-digit code.

-- calls table:

-- Column Name	Type
-- caller_id	int
-- callee_id	int
-- duration	int
-- This table may contain duplicates. Each row represents a call between two people with the duration in minutes. Note that caller_id is always different from callee_id.

-- Write a query to find the countries where the average call duration is strictly greater than the global average. A call is associated with a country based on the phone numbers of both the caller and callee.

-- Return the result in any order.



WITH country_calls AS (
    SELECT
        co.name AS country,
        ca.duration
    FROM calls ca
    JOIN person p
        ON ca.caller_id = p.id
    JOIN country co
        ON SUBSTRING(p.phone_number, 1, 3) = co.country_code

    UNION ALL

    SELECT
        co.name AS country,
        ca.duration
    FROM calls ca
    JOIN person p
        ON ca.callee_id = p.id
    JOIN country co
        ON SUBSTRING(p.phone_number, 1, 3) = co.country_code
)

SELECT
    country
FROM country_calls
GROUP BY country
HAVING AVG(duration) > (
    SELECT AVG(duration)
    FROM calls
);