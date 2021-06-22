USE sakila;

-- 1. How many distinct (different) actors' last names are there?
SELECT COUNT(distinct(last_name)) AS distinct_last_name FROM actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(distinct(language_id)) AS distinct_languages_id FROM film;
-- only the value 1 in language_id and original_language_id only Null-values. 
SELECT COUNT(distinct(name)) AS distinct_languages_id FROM language;
-- it also doesn't seem to be the solution 

-- 3. How many movies were released with "PG-13" rating?
SELECT COUNT(rating) AS distinct_languages_id FROM film
WHERE rating = "PG-13";

-- 4. Get 10 the longest movies from 2006.
SELECT * FROM film
WHERE release_year = 2006 
ORDER BY length DESC 
LIMIT 10; 

-- 5. How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(NOW(), MIN(rental_date))
AS "days company operating"
FROM rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.
SELECT *, WEEKDAY(rental_date) AS weekday, MONTH(rental_date) AS month
FROM rental;


-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
SELECT *, CASE
WHEN WEEKDAY(rental_date) = 6 THEN "weekend"
WHEN WEEKDAY(rental_date) = 7 THEN "weekend"
ELSE "workday"
END AS "day_type"
FROM rental;

-- 8. How many rentals were in the last month of activity?
SELECT count(*) AS rentals_last_month 
FROM rental
WHERE date_format(CONVERT(substring_index(rental_date, ' ', 1), DATE), '%Y%m') = date_format(date_add('2005-06-19', interval -1 MONTH), '%Y%m');
