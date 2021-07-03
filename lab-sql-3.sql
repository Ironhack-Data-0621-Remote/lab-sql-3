-- How many distinct (different) actors' last names are there?
select * from actor;
select distinct(last_name) from actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select * from film;
select distinct(language_id) from film;
-- How many movies were released with "PG-13" rating?
select * from sakila.film
where rating = 'PG-13';
-- Get 10 the longest movies from 2006.
select * from sakila.film
where length > 184
limit 10;
-- How many days has been the company operating (check DATEDIFF() function)?
select * from rental;
select rental_id, customer_id, (last_update-return_date) as 'operating_days'
where convert('operating_days',datetime) * sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20.
select * from rental;
select date_format(convert(last_update,date), '%M') as 'Month' from sakila.rental;
select date_format(convert(last_update,date), '%Y-%M-%D') as 'weekday' from sakila.rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.


-- How many rentals were in the last month of activity?
select rental_date from sakila.rental;
-- i dont understan the question...

