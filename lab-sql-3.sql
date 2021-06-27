-- How many distinct (different) actors' last names are there?
SELECT COUNT(distinct(last_name))
FROM actor;
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(distinct(language_id))
FROM film;
-- How many movies were released with "PG-13" rating?
SELECT COUNT(*)
FROM film
WHERE rating = 'PG-13';
-- Get 10 the longest movies from 2006.
SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;
-- How many days has been the company operating (check DATEDIFF() function)?
SELECT  DATEDIFF(max(return_date),min(rental_date))
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20.
SELECT *, EXTRACT(MONTH FROM rental_date) as month_num, WEEKDAY(rental_date)
FROM rental;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.

SELECT *, EXTRACT(MONTH FROM rental_date) as month_num, CASE when WEEKDAY(rental_date)<=5 then 'weekday' else 'weekend' end as day_of_week
FROM rental;
-- How many rentals were in the last month of activity?
