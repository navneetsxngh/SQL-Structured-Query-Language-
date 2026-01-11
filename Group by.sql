USE sakila;

SHOW TABLES;
SELECT * FROM payment;

SELECT count(amount) FROM payment WHERE amount =2.99;
SELECT sum(customer_id) FROM payment GROUP BY customer_id;

## Payment done by each customer in the month of May 
SELECT customer_id, count(amount) FROM payment WHERE month(payment_date) = 05 GROUP BY customer_id;

## Find out the max amount of transaction, the avg transaction amount, and the total transaction amount done through each staff.
SELECT staff_id, max(amount) AS Maximum_Amount, avg(amount) AS Average_Amount, sum(amount) AS Total_Amount 
FROM payment GROUP BY staff_id;

## Find out the max amount of transaction, the avg transaction amount, and the total transaction amount done through each staff for even customers.
SELECT staff_id, max(amount) AS Maximum_Amount, avg(amount) AS Average_Amount, sum(amount) AS Total_Amount 
FROM payment WHERE customer_id % 2 =0  GROUP BY staff_id;

## Get the amount and the total transaction done for each amount only for the payments done through staff_id '1' 
## and the total trannsaction should be greater than 30
SELECT amount, sum(amount) FROM payment WHERE staff_id = 1 
GROUP BY amount HAVING count(amount) > 30;

## Find out the number of customer served along with the average amount and the total amount spend in each month for staff_id 1 and 2
SELECT count(customer_id) AS Total_customers, month(payment_date), avg(amount) AS Average_amount, sum(amount) AS Total_amount FROM payment
WHERE staff_id = 1
GROUP BY month(payment_date);

SELECT count(customer_id) AS Total_customers, month(payment_date), avg(amount) AS Average_amount, sum(amount) AS Total_amount FROM payment
WHERE staff_id = 2
GROUP BY month(payment_date);


## Find out the number of customer served along with the average amount and the total amount spend in each month of each year for staff_id 1 and 2
SELECT count(customer_id) AS Total_customers, month(payment_date) AS Month, year(payment_date) AS Year, avg(amount) AS Average_amount, sum(amount) AS Total_amount 
FROM payment
WHERE staff_id = 1
GROUP BY month(payment_date), Year(payment_date);

SELECT count(customer_id) AS Total_customers, month(payment_date) AS Month, year(payment_date) AS Year, avg(amount) AS Average_amount, sum(amount) AS Total_amount 
FROM payment
WHERE staff_id = 2
GROUP BY month(payment_date), year(payment_date);