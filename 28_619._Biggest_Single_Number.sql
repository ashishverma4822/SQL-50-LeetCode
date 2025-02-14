# Write your MySQL query statement below

select max(num) as num 
from MyNumbers
where num in (
    select num 
    from MyNumbers
    group by num
    having count(num)=1
);


# Write your MySQL query statement below

select coalesce(
    (select num
     from MyNumbers
     group by num
     having COUNT(num) = 1
     order by num DESC
     limit 1),
    null
) as num;
