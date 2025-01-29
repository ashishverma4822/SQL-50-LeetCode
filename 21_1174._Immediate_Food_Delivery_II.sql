# Write your MySQL query statement below
with firstorder as(
    select customer_id, min(order_date) as first_order_date
    from Delivery 
    group by customer_id
)

select 
round(
    (sum(case when d.order_date = d.customer_pref_delivery_date then 1 else 0 end)*100)/
    (select count(customer_id) from firstorder)
    ,2)
    as immediate_percentage
from Delivery d
join firstorder f
on d.customer_id = f.customer_id
where f.first_order_date = d.order_date;
