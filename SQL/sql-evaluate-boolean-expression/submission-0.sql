-- Evaluate Boolean Expression
-- you are given two tables: variables which stores variable names and their integer values, and expressions which contains boolean expressions to evaluate.

-- variables table:

-- Column Name	Type
-- name	varchar
-- value	int
-- The name column is the primary key. Each row contains a variable name and its corresponding integer value.

-- expressions table:

-- Column Name	Type
-- left_operand	varchar
-- operator	enum
-- right_operand	varchar
-- The combination of (left_operand, operator, right_operand) forms the primary key. The operator column can be one of: <, >, or =. Both left_operand and right_operand reference variable names from the variables table.

-- Write a query to evaluate each boolean expression and return the result as true or false.
SELECT
    e.left_operand,
    e.operator,
    e.right_operand,
    CASE
        WHEN e.operator = '>' AND lv.value > rv.value THEN 'true'
        WHEN e.operator = '<' AND lv.value < rv.value THEN 'true'
        WHEN e.operator = '=' AND lv.value = rv.value THEN 'true'
        ELSE 'false'
    END AS value
FROM expressions e
JOIN variables lv ON e.left_operand = lv.name
JOIN variables rv ON e.right_operand = rv.name;

