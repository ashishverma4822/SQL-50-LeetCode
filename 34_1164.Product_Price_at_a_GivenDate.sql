# Write your MySQL query statement below

#1
with latestPrice as (
    select product_id , new_price
    from Products
    where (product_id, change_date) in (
        select product_id, max(change_date) as latest_date
        from Products 
        where change_date <= '2019-08-16'
        group by product_id
    )
)

select distinct p.product_id, coalesce(lp.new_price,10) as price
from Products as p
left join latestPrice as lp
on p.product_id = lp.product_id


#2
with latestPrice as (
    select product_id , new_price
    from Products
    where (product_id, change_date) in (
        select product_id, max(change_date) as latest_date
        from Products 
        where change_date <= '2019-08-16'
        group by product_id
    )
)

select distinct p.product_id, coalesce(lp.new_price,10) as price
from (select distinct product_id from Products) as p
left join latestPrice as lp
on p.product_id = lp.product_id;
