# Write your MySQL query statement below

# Solution 1 ------------------------
  
with rest as(
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on
)

select r1.visited_on,
    sum(r2.amount) as amount,
    round(avg(r2.amount),2) as average_amount
from rest r1
join rest r2
on r2.visited_on between date_sub(r1.visited_on, interval 6 day) and r1.visited_on
group by r1.visited_on
having count(r1.visited_on) = 7
order by r1.visited_on;

#Solution 2 ---------------------------

# Write your MySQL query statement below

with Cust as(
    select visited_on, sum(amount) as amount from Customer
    group by visited_on
), temp as (
    select visited_on, amount,
        ifnull(lag(amount, 7) over (order by visited_on),0) as sum 
    from Cust
), temp2 as (
    select visited_on, 
    sum(amount) over (order by visited_on) as sum2
    ,sum
    from temp
), temp3 as(
    select visited_on, 
    sum2,
    sum(sum) over (order by visited_on) as sum
    from temp2
)


select t2.visited_on, t2.sum2-t2.sum as amount, round((t2.sum2-t2.sum)/7,2) as average_amount
from temp3 t1
join temp3 t2
on date_add(t1.visited_on, interval 6 day) = t2.visited_on;


# Soltuion 3 -------------------------------------

# Write your MySQL query statement below

select visited_on,
(
    select sum(amount)
    from customer
    where visited_on between date_sub(c.visited_on, interval 6 day)
    and c.visited_on
) as amount,
round((
    select sum(amount)/7
    from customer
    where visited_on between date_sub(c.visited_on, interval 6 day)
    and c.visited_on
),2) as average_amount 
from customer c
where visited_on >= (
    select date_add(min(visited_on), interval 6 day)
    from customer
)
group by visited_on
order by visited_on
