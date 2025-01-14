# Write your MySQL query statement below
select s.user_id,
  Round(SUM(CASE When action = 'confirmed' Then 1 
  ELSE 0 
  END)/count(*),2) as confirmation_rate
from Signups s
left join Confirmations c
on c.user_id = s.user_id
group by s.user_id;
