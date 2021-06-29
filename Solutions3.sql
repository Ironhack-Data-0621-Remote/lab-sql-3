-- lab-sql-3

USE sakila;

select distinct last_name
from sakila.actor;

SELECT distinct language_id
FROM sakila.film;

SELECT *
from sakila.film
where rating = 'PG-13';

select title from sakila.film
where release_year = '2006'
order by length desc
limit 10;

-- 5. ??

SELECT DATE_FORMAT(rental_date, "%M") as month, WEEKDAY(Rental_date) as weekday
FROM sakila.rental
limit 20;

SELECT rental_id,
CASE
when WEEKDAY(Rental_date) <= '5' then 'weekend'
else 'weekday'
end as weekday
from sakila.rental;

-- could not figure out how to separate output to two separate column

-- 8. ???