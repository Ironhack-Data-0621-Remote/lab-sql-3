USE sakila;
-- How many distinct (different) actors' last names are there?
SELECT count(distinct(last_name)) FROM actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT count(distinct(language_id)) FROM film;

-- How many movies were released with "PG-13" rating?
SELECT count(film_id) FROM film
WHERE rating = 'PG-13';

-- Get 10 the longest movies from 2006.
SELECT title, length from film
WHERE release_year = 2006
ORDER BY length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(rental_date), min(rental_date))
AS number_of_days
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20.
SELECT *, extract(month FROM rental_date) AS month, weekday(rental_date) AS weekday
FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
SELECT *, extract(month FROM rental_date) AS month, weekday(rental_date) AS weekday, 
case
	WHEN weekday(rental_date) <= 5 then 'workday'
    ELSE 'weekend'
END AS daytype
FROM rental;

-- How many rentals were in the last month of activity?
SELECT max(rental_date) FROM rental;
-- We find that last month was Feb 2006

SELECT count(rental_id) AS rentals FROM rental
WHERE rental_date > '2006-02-01';