select e.name as name , b.bonus as bonus
from Employee e
left join Bonus b
on e.empId = b.empId
where isnull(b.bonus) or b.bonus<1000;

#solution 2

select e.name as name , b.bonus as bonus
from Employee e
left join Bonus b
on e.empId = b.empId
where ifnull(b.bonus,0)<1000;
