# Write your MySQL query statement below

with bus as (
    select person_name, weight,
        sum(weight) over (order by turn) as running_weight
    from Queue
)

select person_name
from bus
where running_weight <= 1000
order by running_weight desc
limit 1;
