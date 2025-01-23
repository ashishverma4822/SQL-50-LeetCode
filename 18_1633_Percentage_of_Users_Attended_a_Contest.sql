# Write your MySQL query statement below
select r.contest_id, round(count(u.user_id)*100/(select count(user_id) from Users),2) as percentage
from Register r
left join Users u
on u.user_id = r.user_id
group by r.contest_id
order by percentage desc,r.contest_id asc;
