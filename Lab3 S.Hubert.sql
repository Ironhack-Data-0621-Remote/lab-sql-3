-- How many distinct (different) actors' last names are there?
-- select count(distinct(last_name))
-- from actor;


-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
-- select count(distinct(language_id))
-- from film;


-- How many movies were released with "PG-13" rating?
-- select count(distinct(film.rating), 'PG-13 ')
-- from film;


-- Get 10 the longest movies from 2006.
-- select *
-- from film
-- where release_year >= 2006
-- order by(film.length) DESC
-- limit 10 ;


-- How many days has been the company operating (check DATEDIFF() function)?
-- select datediff(max(payment_date) , min(payment_date))
-- from payment;



-- Show rental info with additional columns month and weekday. Get 20.
-- select *, month(rental_date) as rental_month , weekday(rental_date) as rental_weekday
-- from rental 
-- limit 20;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
-- select *,  
-- case
-- when weekday(rental_date) = 5 then "weekend"
-- when weekday(rental_date) = 6 then "weekend"
-- else "workday"
-- end as day_type
-- from rental;

-- How many rentals were in the last month of activity?
-- select month(max(rental_date)) as last_month_rental, count(rental_id)
-- from rental;