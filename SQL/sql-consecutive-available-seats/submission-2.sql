-- Consecutive Available Seats
-- You are given a cinema table that tracks the availability of seats.

-- cinema table:

-- Column Name	Type
-- seat_id	int
-- free	bool
-- The seat_id column is an auto-incrementing primary key. Each row indicates whether a particular seat is available or occupied. A value of 1 for free means the seat is available, while 0 means it is occupied.

-- Write a query to find all seats that are part of a group of two or more consecutive available seats.

-- Return the result table ordered by seat_id in ascending order.


select distinct c1.seat_id
from cinema c1
join cinema c2
on abs(c1.seat_id - c2.seat_id) = 1
where c1.free = 1 and c2.free = 1
order by c1.seat_id