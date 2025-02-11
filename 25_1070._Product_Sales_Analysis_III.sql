-- # Write your MySQL query statement below
-- method 1
with min_pro_year as(
    select product_id , min(year) as year
    from Sales
    group by product_id
)

select p.product_id, p.year as first_year, p.quantity, p.price
from sales p
join min_pro_year m
on m.product_id = p.product_id
where p.year=m.year;

-- # Write your MySQL query statement below
-- method 2
select product_id,year as first_year, quantity, price
from Sales
where (product_id,year) in (select product_id, min(year) from Sales group by product_id)
