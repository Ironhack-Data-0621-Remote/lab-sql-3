-- How many distinct (different) actors' last names are there? 121
use sakila;
Select count(distinct last_name) from actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table) 1
select count(distinct language_id) from film;
-- How many movies were released with "PG-13" rating? 223
select count(*) from film
where rating = 'PG-13';
-- Get 10 the longest movies from 2006.
select * from film
order by length(length) desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
 -- ??? I get how the fuction works but I don't know which dates I should compare
 
-- Show rental info with additional columns month and weekday. Get 20.
select *, date_format(convert(substring_index(rental_date, ' ', 1), date), '%M') as month, Dayname(rental_date) as weekday
from rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
select *,
case
when weekday(rental_date)>5 then 'Weekend'
else 'Workday'
end as 'Day Info'
from rental;

-- How many rentals were in the last month of activity?
select count(rental_date) from rental
where rental_date='2006-02'
-- ????