Select * from Cinema 
where id%2 = 1 and NOT (description = "boring")
order by rating desc;
