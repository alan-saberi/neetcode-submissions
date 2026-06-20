-- Page Recommendations
-- You have two tables: friendship and likes.

-- friendship table:

-- Column Name	Type
-- user1_id	int
-- user2_id	int
-- The combination of (user1_id, user2_id) is the primary key. Each row represents a friendship between two users.

-- likes table:

-- Column Name	Type
-- user_id	int
-- page_id	int
-- The combination of (user_id, page_id) is the primary key. Each row indicates that a user likes a particular page.

-- Write a query to recommend pages to the user with user_id = 1 based on pages that their friends have liked. Do not recommend pages that user 1 already likes.

-- Return the result table in any order without duplicates.

WITH friends AS (
    SELECT user2_id AS friend_id
    FROM friendship
    WHERE user1_id = 1

    UNION

    SELECT user1_id AS friend_id
    FROM friendship
    WHERE user2_id = 1
)
SELECT DISTINCT
    l.page_id AS recommended_page
FROM friends f
JOIN likes l
    ON f.friend_id = l.user_id
WHERE l.page_id NOT IN (
    SELECT page_id
    FROM likes
    WHERE user_id = 1
);