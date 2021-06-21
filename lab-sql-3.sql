-- 1. How many distinct (different) actors' last names are there?
use sakila;
select count(distinct(last_name)) from actor;

-- 2. In how many different languages where the films originally produced? 
-- (Use the column language_id from the film table)
select count(distinct(language_id)) from film;

-- 3. How many movies were released with "PG-13" rating?
select count(rating)
from film
where rating = 'PG-13';


-- 4. Get 10 the longest movies from 2006.
select * from film
where release_year = 2006
order by length desc
limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
select DATEDIFF(MIN(rental_date), now())
as number_of_days
from rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.
-- Note: 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday.
select *, extract(month from cast(rental_date as date)), weekday(cast(rental_date as date)) 
from rental
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. 
-- Check the CASE function.


use sakila;
select *, weekday(cast(rental_date as date)) as week_day,
case
when weekday(cast(rental_date as date)) = 5 then 'weekend'
when weekday(cast(rental_date as date)) = 6 then 'weekend'
else 'workday'
end as 'day_type'
from rental;
-- Note: 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday.


-- 8. How many rentals were in the last month of activity?
select count(rental_date) from rental;

select * from rental;

