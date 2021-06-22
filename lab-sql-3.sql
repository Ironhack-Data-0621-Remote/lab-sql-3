-- How many distinct (different) actors' last names are there?
select count(*)
from (select distinct last_name from sakila.actor) as unique_last_name;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(*)
from (select distinct language_id from sakila.film) as unique_language;

-- How many movies were released with "PG-13" rating?
select count(*) from sakila.film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.
select title, length
from sakila.film
where release_year = 2006
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(payment_date), min(payment_date)) as nb_days_company_operated
from sakila.payment;

-- Show rental info with additional columns month and weekday. Get 20.
select rental_date, extract(month from rental_date) as month, dayofweek(rental_date) as weekday
from sakila.rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
select rental_date, dayofweek(rental_date) as weekday, day_type
case
	when weekday < 5 then 'workday'
	when weekday = 5 then 'workday'
	else 'weekend'
end as day_type
from sakila.rental;
-- what am I doing wrong here ?

-- How many rentals were in the last month of activity?
select rental_date, extract(month from rental_date) as month, extract(year from rental_date) as year
from sakila.rental
order by year desc, month desc;
-- the last month company operated was in February 2006. let's count now
select count(rental_date) as count_rentals
from sakila.rental
where extract(month from rental_date) = 2 and extract(year from rental_date) = 2006;
-- There were 182 rentals on the last month of activity in Feb 2006.
