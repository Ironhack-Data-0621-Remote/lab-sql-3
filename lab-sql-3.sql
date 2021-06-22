-- How many distinct (different) actors' last names are there?
select count(DISTINCT last_name) from actor;

-- In how many different languages were the films originally be produced? (Use the column language_id from the film table)
select count(DISTINCT language_id) from film;

-- How many movies were released with "PG-13" rating?
select count(rating) from film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.
Select length, release_year from film 
where release_year = 2006
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) from rental;

-- Show rental info with additional columns month and weekday. Get 20.
-- weekday : Sunday = 6  
SELECT rental_date as rental_info, month(rental_date) as month, weekday(rental_date) as weekday from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function
-- dayofweek : Sunday = 1
select rental_date,
case
when dayofweek(rental_date) = 1 and 6 then 'weekend'
else 'workday'
end as 'day_type'
from rental;

-- How many rentals were in the last month of activity?
select rental_date, rental_id, count(rental_id) from rental
where rental_date > "2006-02-01";
