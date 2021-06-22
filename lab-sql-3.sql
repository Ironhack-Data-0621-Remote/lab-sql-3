use sakila;

-- How many distinct (different) actors' last names are there?
select count(distinct last_name)
from actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id)
from film;

-- How many movies were released with "PG-13" rating?
select count(rating)
from film
where rating = "PG-13";

-- Get 10 the longest movies from 2006.
select *
from film
where release_year = 2006
order by film.length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(now(), min(rental_date)) as days_operating
from rental;

-- Show rental info with additional columns month and weekday. Get 20.
-- here I just chose to only show rental month and week and don't do this for all dates
select *, month(rental_date) as rental_month, weekday(rental_date) as rental_weekday
from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
select *,
case
when weekday(rental_date) = 0 or weekday(rental_date) = 1 or weekday(rental_date) = 2 or weekday(rental_date) = 3 or weekday(rental_date) = 4 then "workday"
when weekday(rental_date) = 5 or weekday(rental_date) = 6 then "weekend"
else "not_available"
end as day_of_week
from rental;

-- How many rentals were in the last month of activity?
-- (1) check last month of activity - result February 2006
select rental_date
from rental
order by rental_date desc;

-- (2) count all rentals from February 2006
select 
sum(case when year(rental_date) = 2006 and month(rental_date) = 2 then 1 else 0 end) as last_month_activity
from rental;