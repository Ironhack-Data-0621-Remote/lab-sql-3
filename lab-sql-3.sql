USE sakila;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM actor;

-- In how many different languages where the films originally produced? 
-- (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id)
FROM film;

-- How many movies were released with "PG-13" rating?
SELECT 
SUM(CASE WHEN rating = "PG-13" THEN 1 ELSE 0 END) AS 'rating_PG-13'
FROM film;

SELECT COUNT(*)
FROM film
WHERE rating = "PG-13";

-- Get 10 the longest movies from 2006.
SELECT *
FROM film LIMIT 10;

SELECT *
FROM film
WHERE release_year = '2006'
ORDER BY length DESC
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20.
DESCRIBE rental;

SELECT * FROM rental;

SELECT *, SUBSTRING_INDEX(rental_date, ' ', 1) AS 'new_rental_date'
FROM rental
LIMIT 20;

SELECT *, EXTRACT(MONTH FROM CAST(rental_date AS DATE)) AS 'rental_month', 
EXTRACT(DAY FROM CAST(rental_date AS DATE)) AS 'rental_day',
WEEKDAY(CONVERT(rental_date, DATETIME)) AS 'rental_weekday' -- 0=monday, 1=tuesday, etc.
FROM rental
LIMIT 20;

SELECT *, EXTRACT(MONTH FROM rental_date) AS 'rental_month', 
EXTRACT(DAY FROM rental_date) AS 'rental_day',
WEEKDAY(rental_date) AS 'rental_weekday' -- 0=monday, 1=tuesday, etc.
FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
SELECT *, EXTRACT(MONTH FROM rental_date) AS 'rental_month', 
EXTRACT(DAY FROM rental_date) AS 'rental_day',
WEEKDAY(rental_date) AS 'rental_weekday', -- 0=monday, 1=tuesday, etc.
CASE
WHEN WEEKDAY(rental_date) = 0 OR 1 OR 2 OR 3 OR 4 THEN 'workday'
ELSE 'weekend'
END AS 'day_type'
FROM rental;

-- How many rentals were in the last month of activity?
SELECT MAX(rental_date) FROM rental;

-- date chosen for comparison = max rental date minus one month
SELECT
SUM(CASE WHEN rental_date > '2006-01-14 15:16:03' THEN 1 ELSE 0 END) AS nbr_rentals_last_month
FROM rental;

SELECT COUNT(*) AS nbr_rentals_last_month
FROM rental
WHERE rental_date > '2006-01-14 15:16:03';