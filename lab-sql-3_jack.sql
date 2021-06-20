USE sakila;

-- How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name)
FROM actor;

-- 121 distinct last names
-- how come SELECT DISTINCT(COUNT(last_name) FROM actor; gives me 200?

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT COUNT(DISTINCT language_id)
FROM film;

-- 1 language

-- How many movies were released with "PG-13" rating?

SELECT COUNT(rating)
FROM film
WHERE rating = "PG-13";

-- 223


-- Get 10 the longest movies from 2006.

SELECT *
FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)?

SELECT DATEDIFF(MIN(rental_date), NOW())
AS "Number of Days"
FROM rental;

-- the company has been operating for 5871 days as of 20/06/2021


-- Show rental info with additional columns month and weekday. Get 20.

SELECT *, WEEKDAY(rental_date) AS weekday, MONTH(rental_date) AS month
FROM rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.

SELECT *,
CASE
WHEN WEEKDAY(rental_date) = 5 THEN "weekend"
WHEN WEEKDAY(rental_date) = 6 THEN "weekend"
ELSE "weekday"
END AS day_type
FROM rental;

-- How many rentals were in the last month of activity?

SELECT COUNT(*), MONTH(rental_date), YEAR(rental_date)
FROM rental
GROUP BY MONTH(rental_date), YEAR(rental_date)
ORDER BY YEAR(rental_date) DESC, MONTH(rental_date) DESC;

-- the last month was february 2006 and there were 182 rentals then