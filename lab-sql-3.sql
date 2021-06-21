-- How many distinct (different) actors' last names are there?
SELECT COUNT(actor_id), last_name
FROM actor
GROUP BY 2; 

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(language_id)
FROM film;

-- How many movies were released with "PG-13" rating?
SELECT COUNT(*)
FROM film
WHERE rating = 'PG-13';

-- Get 10 the longest movies from 2006.
SELECT MAX(length), title
FROM film
WHERE release_year = 2006
GROUP BY 2
ORDER BY 1 DESC
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MIN(last_update), NOW()) AS opsdate
FROM store;

-- Show rental info with additional columns month and weekday. Get 20.
SELECT *, MONTH(rental_date), WEEKDAY(rental_date)
FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
SELECT *, CASE WHEN WEEKDAY(rental_date = 6 AND rental_date = 7) THEN 'weekend' ELSE 'workday' END day_type
FROM rental;

-- How many rentals were in the last month of activity?
SELECT COUNT(MONTH(rental_date) - 1)
FROM rental;
