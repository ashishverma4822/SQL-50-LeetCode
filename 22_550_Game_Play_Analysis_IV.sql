# Write your MySQL query statement below

with first_date as (
    select player_id, min(event_date) as first_login_date
    from Activity 
    group by(player_id)
)

select round(
    count(f.player_id)/(select count( distinct player_id ) from Activity)
    ,2) as fraction
from first_date f
join Activity a
on a.player_id = f.player_id
where DATEDIFF(a.event_date, f.first_login_date) = 1;
