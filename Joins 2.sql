CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

SELECT * FROM customers;
SELECT * FROM orders;

## This is Inner Join in which we only get the common rows
SELECT c.customer_id, o.customer_id, c.customer_name, o.order_id, o.amount FROM customers AS c
INNER JOIN orders AS o ON
c.customer_id = o.customer_id;
## We haven't got the data for c_id = 4 and 7 because they haven't placed the order

## We need the data for those customers who haven't placed the order
SELECT c.customer_id, o.customer_id, c.customer_name, o.order_id, o.amount FROM customers AS c
LEFT JOIN orders AS o ON
c.customer_id = o.customer_id;
## We also get the information who didn't placed the order

## Similarly for right Join
SELECT c.customer_id, o.customer_id, c.customer_name, o.order_id, o.amount FROM customers AS c
RIGHT JOIN orders AS o ON
c.customer_id = o.customer_id;

## Natural Join -- We do not define any condition
SELECT c.customer_id, o.customer_id, c.customer_name, o.order_id, o.amount FROM customers AS c
NATURAL JOIN orders AS o;
-- Name of Columns should be the same in both of the tables.

ALTER TABLE customers RENAME COLUMN customer_id TO cid;
DROP TABLE customers;

SELECT c.cid, o.customer_id, c.customer_name, o.order_id, o.amount FROM customers AS c
NATURAL JOIN orders AS o;

## Cross/Cartesian Join
SELECT c.cid, o.customer_id, c.customer_name, o.order_id, o.amount FROM customers AS c
CROSS JOIN orders AS o;

## Group by on Joins
SELECT customer_name, sum(amount) FROM customers AS c
INNER JOIN orders AS o WHERE
c.customer_id = o.customer_id GROUP BY customer_name;

SELECT customer_id, SUM(amount) AS total_amount
FROM (
    SELECT 
        c.customer_id,
        o.amount
    FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
) AS t
GROUP BY customer_id;

## Find actor_id, name and total no of movies from actor and film in sakila?
USE sakila;
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT a.actor_id, count(*), CONCAT(a.first_name, ' ', a.last_name) AS full_name
FROM actor AS a
JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;