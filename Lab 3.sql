USE sakila;

-- How many distinct (different) actors' last names are there?
select count(distinct last_name) from actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) from film;

-- How many movies were released with "PG-13" rating?
select count(rating) from film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.
select title, new_lenght from film
order by new_lenght desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MIN(rental_date), MAX(rental_date))
AS "Number of Days"
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20.
select rental_id, rental_date, monthname(rental_date) as month_rental, weekday(rental_date) as weekday_rental
from rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
select rental_id, rental_date, weekday(cast(rental_date as date)) as week_day,
case when weekday(cast(rental_date as date)) = '5' THEN 'weekend'
when weekday(cast(rental_date as date)) = '6' THEN 'weekend'
else 'workday'
end as day_type
from rental;

-- How many rentals were in the last month of activity?
SELECT MONTH(rental_date) as month,
count(month(rental_date)) as no_of_rentals
from rental
GROUP BY MONTH(rental_date);