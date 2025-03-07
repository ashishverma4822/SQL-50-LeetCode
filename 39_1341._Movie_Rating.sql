# Write your MySQL query statement below

(select u.name as results from Users u
join MovieRating m
on u.user_id = m.user_id
group by u.user_id
order by count(m.user_id) desc , u.name limit 1)

union all 

(select m.title as result from Movies m
join MovieRating mr
on m.movie_id = mr.movie_id
where year(created_at) = 2020 and month(created_at) = 2
group by m.movie_id
order by avg(mr.rating) desc, m.title limit 1)

