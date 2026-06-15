-- Bank Account Summary II/
-- You are given two tables, users and transactions.

-- users table:

-- Column Name	Type
-- account	int
-- name	varchar
-- The account column is the primary key. Each row contains a user's account number and name. No two users share the same name.

-- transactions table:

-- Column Name	Type
-- trans_id	int
-- account	int
-- amount	int
-- transacted_on	date
-- The trans_id column is the primary key. Each row records a transaction for an account. The amount is positive for deposits and negative for withdrawals. All accounts start with a balance of 0.

-- Write a query to report the name and balance of users with a balance greater than 10000. The balance is calculated as the sum of all transaction amounts for that account.

-- Return the result in any order.


SELECT u.name, SUM(t.amount) AS balance
FROM users u
JOIN transactions t ON u.account = t.account
GROUP BY u.account, u.name
HAVING SUM(t.amount) > 10000;
