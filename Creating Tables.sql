USE regex;

CREATE TABLE IF NOT EXISTS customer9
	(c_id INT PRIMARY KEY,
    c_name VARCHAR(20)
);
INSERT INTO customer9 
VALUES (10, 'Aman'),
		(11, 'Shubham');

CREATE TABLE IF NOT EXISTS order9
	(o_id INT PRIMARY KEY,
    city VARCHAR(20),
    c_id INT,
    FOREIGN KEY (c_id) REFERENCES customer9(c_id)
);
INSERT INTO order9
VALUES (1009, 'Jaipur', 10),
		(1010, 'Goa', 11),
        (1011, 'Jammu', 10)
--        (1012, 'Ranchi', 90)
;

DROP TABLE customer9;
DROP TABLE order9;

SELECT * FROM customer9;
SELECT * FROM order9;