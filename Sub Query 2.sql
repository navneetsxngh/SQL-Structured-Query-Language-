USE sakila;

-- Single Row Subquery
-- It returns 
SELECT payment_id, customer_id, amount
FROM payment
WHERE amount > (
    SELECT AVG(amount)
    FROM payment
);
SELECT amount FROM payment WHERE payment_id = 2; 
SELECT * FROM payment WHERE amount = (SELECT amount FROM payment WHERE payment_id = 2);

SELECT * FROM payment 
WHERE amount = 
(
	SELECT amount FROM payment 
    WHERE payment_id = 2 OR payment_id = 3
    );
-- Error Code: 1242. Subquery returns more than 1 row

-- Correct Way
SELECT * FROM payment 
WHERE amount IN 
(
	SELECT amount FROM payment 
	WHERE payment_id = 2 OR payment_id = 3
    );
SELECT * FROM payment 
WHERE amount NOT IN 
(
	SELECT amount FROM payment 
    WHERE payment_id = 2 OR payment_id = 3);

-- 'ANY' same as 'IN'
SELECT * FROM payment WHERE amount =  ANY(SELECT amount FROM payment WHERE payment_id = 2 OR payment_id = 3);

-- Greater than any value of Subquery
SELECT * FROM payment WHERE amount >=  ANY(SELECT amount FROM payment WHERE payment_id = 2 OR payment_id = 3);

-- Less than any value of subquery
SELECT * FROM payment WHERE amount <=  ANY(SELECT amount FROM payment WHERE payment_id = 2 OR payment_id = 3);

-- Greater than larger value of Subquery
SELECT * FROM payment WHERE amount >  ALL(SELECT amount FROM payment WHERE payment_id = 2 OR payment_id = 3);

-- Less than smaller value of Subquery
SELECT * FROM payment WHERE amount <  ALL(SELECT amount FROM payment WHERE payment_id = 2 OR payment_id = 3);

-- Question ---> Get all the payment information where the month of payment should be same as of payment_id 2 or 3
SELECT * FROM payment WHERE MONTH(payment_date) = ANY(SELECT MONTH(payment_date) FROM payment WHERE payment_id = 2 OR payment_id = 3);
SELECT * FROM payment WHERE MONTH(payment_date) IN (SELECT MONTH(payment_date) FROM payment WHERE payment_id = 2 OR payment_id = 3);

-- Question ---> Get all the Payment Information whose amount is larger than among all the amount of payment_id = 2 to 8?
SELECT amount FROM payment WHERE payment_id BETWEEN 2 AND 8;
SELECT * FROM payment WHERE amount > (SELECT MAX(amount) FROM payment WHERE payment_id BETWEEN 2 AND 8);
SELECT * FROM payment WHERE amount > ALL(SELECT (amount) FROM payment WHERE payment_id BETWEEN 2 AND 8);