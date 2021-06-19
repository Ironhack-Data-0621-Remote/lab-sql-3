-- How many distinct (different) actors' last names are there?
-- SELECT count(distinct last_name) as distinct_last_name FROM actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
-- SELECT count(distinct language_id) as languages FROM film;

-- How many movies were released with "PG-13" rating?
-- SELECT count(rating) as ratings_PG_13 FROM film
-- WHERE rating = 'PG-13';

-- Get 10 the longest movies from 2006.
-- SELECT * FROM film
-- WHERE release_year = 2006
-- ORDER BY length desc
-- LIMIT 10; 

-- How many days has been the company operating (check DATEDIFF() function)?
-- SELECT datediff(convert(substring_index(max(last_update), ' ', 1), date), convert(substring_index(min(rental_date), ' ', 1), date)) as operating_days
-- FROM rental;

-- Show rental info with additional columns month and weekday. Get 20.
-- SELECT *, date_format(convert(substring_index(last_update, ' ', 1), date), '%M') as month, date_format(convert(substring_index(last_update, ' ', 1), date), '%W') as weekday
-- FROM rental
-- LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
-- SELECT *,
-- CASE
-- WHEN weekday(convert(substring_index(last_update, ' ', 1), date)) < 5 then 'workday'
-- ELSE 'weekend'
-- END as day_type
-- FROM rental
-- LIMIT 20;

-- How many rentals were in the last month of activity?
-- SELECT count(*)
-- FROM rental
-- WHERE date_format(convert(substring_index(rental_date, ' ', 1), date), '%Y%m') = date_format(date_add('2005-06-19', interval -1 month), '%Y%m');

-- As the 'rental_date' is too old I inputed a fixed date that gives results, but if we want to use the current date the last line should be replaced by:
-- WHERE date_format(convert(substring_index(rental_date, ' ', 1), date), '%Y%m') = date_format(date_add(substring_index(now(), ' ', 1), interval -1 month), '%Y%m');