use sakila;

-- How many distinct (different) actors' last names are there?
select count(distinct(last_name)) 
from actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct(language_id))
from film;

-- How many movies were released with "PG-13" rating?
select count(film_id) from film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.
select * from film
where release_year = 2006
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(min(rental_date), max(rental_date))
from rental;

-- Show rental info with additional columns month and weekday. Get 20.
select *, extract(month from rental_date) as month, weekday(rental_date) as weekday
from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
select *, extract(month from rental_date) as month, weekday(rental_date) as weekday, 
case
	when weekday(rental_date) <= 4 then 'workday'
    else 'weekend'
end as day_type
from rental
limit 20;

-- How many rentals were in the last month of activity?
-- stiil figuring out...
select count(*) as last_month from rental
where rental_date >= '2006-02-01';
