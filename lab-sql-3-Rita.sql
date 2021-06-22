-- LAB 3 --

use sakila;
-- How many distinct (different) actors' last names are there?

SELECT count(DISTINCT last_name) as unique_surnames
FROM actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT count(DISTINCT language_id) as count_languages
FROM film;

-- How many movies were released with "PG-13" rating?

SELECT count(film_id)
FROM film
WHERE rating = 'PG-13';

-- Get 10 the longest movies from 2006

SELECT title, sec_to_time(round(film.length)*60) as long_movies
FROM film
WHERE release_year = 2006
ORDER BY long_movies DESC 
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)?

SELECT datediff(max(last_update), min(rental_date)) AS days_company_operating
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20.

SELECT monthname(rental_date) AS month, dayname(rental_date) AS weekday
FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. 
-- Check the CASE function

SELECT rental_date,
CASE 
WHEN weekday(rental_date) IN (5, 6) THEN 'weekend'
ELSE 'workday'
END AS day_type
FROM rental;

-- How many rentals were in the last month of activity?

SELECT month(max((rental_date))) as rentals
from rental
HAVING COUNT(rental_id);

-- I know this is not correct, but cannot find the solution :( :( :(


