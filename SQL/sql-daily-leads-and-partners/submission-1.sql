-- Daily Leads and Partners
-- You are given a daily_sales table that logs product sales along with lead and partner information.

-- daily_sales table:

-- Column Name	Type
-- date_id	varchar
-- make_name	varchar
-- lead_id	int
-- partner_id	int
-- There is no primary key for this table, so it may contain duplicates. Each row represents a sale on a given date for a product, along with the lead_id and partner_id associated with that sale. The make_name consists of only lowercase English letters.

-- Q) For each date_id and make_name, find the number of distinct lead_ids and distinct partner_ids.

-- Return the result in any order.

SELECT
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners
FROM daily_sales
GROUP BY date_id, make_name;
