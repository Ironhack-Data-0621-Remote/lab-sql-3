use sakila;
-- How many distinct (different) actors' last names are there?
select count(distinct last_name)
from actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id)
from film;
-- i think i should use the column language_id from the table language instead
-- or did I not insert the sakila data properly as to only get 1 language from the film table?
-- i faced the same problem in the lab_SQL_intro  
select count(distinct language_id)
from language;
-- How many movies were released with "PG-13" rating?
select count(case when rating = 'PG-13' then 1 else null end)
from film;
-- Get 10 the longest movies from 2006.
select title, length, release_year from film
where release_year = 2006
order by length desc
limit 10;
-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) as days_operating from rental;
select datediff(now(), min(rental_date)) as days_operating from rental;
-- Show rental info with additional columns month and weekday. Get 20.
select *, month(rental_date) as rental_month, weekday(rental_date) as rental_weekday
from rental
limit 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
select *, month(rental_date) as rental_month, weekday(rental_date) as rental_weekday,
case 
when weekday(rental_date) = 5 then 'weekend'
when weekday(rental_date) = 6 then 'weekend'
else 'workday'
end as day_type
from rental;
-- How many rentals were in the last month of activity?
select max(rental_date) from rental;
select count(case when year(rental_date) = 2006 and month(rental_date) = 2 then 1 else null end)
from rental;
-- its not pretty but i tried a thousand ways to put this into 1 query and it all blew
-- so it seems im still not really getting the extract/convert/cast etc functions