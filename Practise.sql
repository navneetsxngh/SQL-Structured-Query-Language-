# 📘 SQL Practice on **Sakila Database** (Beginner → Advanced)
USE sakila;
## 1. Display all records from the `actor` table.
SELECT * FROM actor;

## 2. Show only `first_name` and `last_name` from the `actor` table. 
SELECT first_name, last_name FROM actor;

## 3. Find all customers whose **first name is 'MARY'**.
SELECT * FROM actor WHERE first_name = 'MARY';

## 4. List all films with `rental_rate` greater than **2.99**.
SELECT * FROM film;
SELECT * FROM film WHERE rental_rate = 2.99;

## 5. Display customers who belong to `store_id = 1`.
SELECT * FROM store WHERE store_id = 1;

## 6. Find films with `rental_rate = 0.99` **AND** `rating = 'PG'`.
SELECT * FROM film;
SELECT * FROM FILM WHERE rental_rate = 0.99 AND rating = 'PG';

## 7. Display customers from `store_id = 1` **OR** `store_id = 2`.
SELECT * FROM store WHERE store_id = 1 OR store_id = 2;

##8. Find all films with `length` between **90 and 120 minutes**.
SELECT * FROM film WHERE length BETWEEN 90 AND 120;

## 9. Find actors whose first name starts with **'A'**.
SELECT * FROM actor WHERE first_name LIKE 'A%';

## 10. Find customers whose last name ends with **'SON'**.
SELECT * FROM actor WHERE first_name LIKE '%SON%';

## 11. Find films that contain the word **'LOVE'** in the title.
SELECT * FROM film WHERE title LIKE '%LOVE%';

## 12. Find all actors whose first name has exactly **5 characters**.
SELECT * FROM actor WHERE first_name LIKE '_____';

## 13. Display distinct film ratings available.
SELECT DISTINCT(rating) FROM film;

## 14. Show the first **10 customers** from the customer table.
SELECT * FROM customer LIMIT 10;

## 15. Find distinct cities from the `city` table.
SELECT DISTINCT(city) FROM city;

## 16. Count total number of films.
SELECT count(film_id) AS Total_Films FROM film;

## 17. Find the **average rental rate** of all films.
SELECT * FROM film;
SELECT avg(rental_rate) FROM film;

## 18. Count how many films are available per `rating`.
SELECT rating, count(title) AS Films FROM film GROUP BY rating;
  
## 19. Find total number of customers per `store_id`.
SELECT * from staff; 

## 20. Find average film length per `rating`.
SELECT avg(length), rating FROM film GROUP BY rating;

## 21. Show ratings that have **more than 200 films**.
SELECT count(title) AS Films, rating FROM film GROUP BY rating HAVING Films > 200;

## 22. Find customers who have rented **more than 30 times**.
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, COUNT(r.rental_id) AS total_rentals
FROM customer AS c JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 30;


## 23. Display film categories where average rental rate is **greater than 2.5**.

24. Extract **year** from `rental_date` in the `rental` table.
25. Extract **month** from `payment_date` in the `payment` table.
26. Count number of rentals per **year**.
27. Count number of payments per **month**.
28. Find total revenue generated **per year**.

29. Display top 10 longest films.
30. Show customers ordered by `last_name` (A–Z).
31. Show highest to lowest total payment per customer.

32. Show customer name with their rental date.
33. Display film title with its category name.
34. Show total rentals per customer (customer name + count).
35. Find total revenue per film.


36. Find total revenue per **store**.
37. Find number of films per **category**.
38. Find top 5 customers based on total payment.

39. Find monthly revenue trend.
40. Find year-wise total rentals.
41. Find which **month has the highest revenue**.

42. Find customers whose email contains **'gmail'**.
43. Find films whose title starts with **'S'** and their categories.

44. Find customers who paid more than **average payment amount**.
45. Find films with rental rate higher than **average rental rate**.
46. Find customers who rented more films than the **average customer**.

47. Categorize films as:

* 'Short' if length < 60
* 'Medium' if length 60–120
* 'Long' if length > 120

48. Categorize customers as **High Value / Medium Value / Low Value** based on total payment.

49. Which film category generates the **highest revenue**?
50. Which city has the **maximum number of customers**?
51. Find top 3 most rented films.
52. Find customers who haven't rented any film in the last **6 months**.
