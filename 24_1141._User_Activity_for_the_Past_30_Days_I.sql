# Write your MySQL query statement below

-- 28-06-2019 to 27-07-2019 = 30 days daily user count

select activity_date as day, count(distinct user_id) as active_users
from Activity
where activity_date between '2019-06-28' and '2019-07-27' 
group by activity_date;
