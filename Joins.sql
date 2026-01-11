USE sakila;
SELECT * FROM actor;
SELECT count(*), count(DISTINCT actor_id) FROM actor;    -- actor_id(Primary Key)
-- Count of total rows = total 
SELECT * FROM film_actor;
SELECT count(*), count(DISTINCT actor_id), count(DISTINCT film_id) FROM film_actor;   -- actor_id(Foreign Key)

## Joining Both Tables
SELECT a.first_name, a.actor_id, fa.film_id FROM actor AS a 
JOIN film_actor as fa
WHERE a.actor_id = fa.actor_id;

## film Table and film_actor Table
SELECT * FROM film;
DESCRIBE film;
DESCRIBE film_actor;     -- Composite key
SELECT fa.actor_id, fa.film_id FROM film_actor AS fa;
SELECT f.film_id, fa.film_id, fa.actor_id ,f.title FROM film AS f
JOIN film_actor AS fa 
WHERE f.film_id = fa.film_id;

## actor and film table
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT 
    a.actor_id,
    fa.film_id,
    a.first_name,
    f.title
FROM actor AS a
JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
JOIN film AS f
    ON f.film_id = fa.film_id;