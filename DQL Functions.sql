CREATE DATABASE day2_db;
USE day2_db;

CREATE TABLE IF NOT EXISTS employee
(
	ID INT,
    Name VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO employee 
VALUES (1, 'Navneet Singh', 'Jagatpura', 'Jaipur');

SELECT * FROM employee;

-- Adding new Column
ALTER TABLE employee ADD Date_of_Birth DATE;

SELECT * FROM employee;

-- Modify existing column in a table or change datatype of name column
ALTER TABLE employee MODIFY COLUMN Name VARCHAR(100);

SHOW CREATE TABLE employee;

-- Delete existing column from given table or remove city column from employee
ALTER TABLE employee DROP COLUMN City;

SELECT * FROM employee;

-- Rename the existing name
ALTER TABLE employee RENAME COLUMN Name TO Full_Name;

DROP TABLE employee;

-- Creating new Table
CREATE TABLE IF NOT EXISTS employee
(
ID INT,
Name VARCHAR(50),
Age INT,
Hiring_Date DATE,
Salary INT,
City VARCHAR(50)
);
INSERT INTO employee
VALUES (1, 'Navneet Singh', 24, '2025-12-12', 50000, 'Mathura'),
		(2, 'Manish Jainav', 22, '2025-12-11',45000, 'Rohtak'),
        (3, 'Devendra Sharma', 26, '2025-12-11',40000, 'Jaipur'),
        (4, 'Priyansh Gaud', 20, '2025-12-08',35000, 'Goverdhan'),
        (5, 'Ubaid Ali', 22, '2025-12-08',30000, 'Jaipur'),
        (6, 'Khushi Morwal', 22, '2025-12-07',25000, 'Phulera');
SELECT * FROM employee;

-- Adding Constraint using ALTER command
ALTER TABLE employee ADD CONSTRAINT id_unique UNIQUE(ID);

INSERT INTO employee 
VALUES (1, 'XYZ', 25, '2021-08-10', 50000, 'Gurgoan');
-- Error Code: 1062. Duplicate entry '1' for key 'employee.id_unique'

-- Drop Constraint Using Alter command
ALTER TABLE employee DROP CONSTRAINT id_unique;

INSERT INTO employee 
VALUES (1, 'XYZ', 25, '2021-08-10', 50000, 'Gurgoan');

SELECT * FROM employee;

-- Create table with Primary key
-- Constraint pk Primary Key (id)

CREATE TABLE persons
(
ID INT,
Name VARCHAR(50),
Age INT,
PRIMARY KEY (ID)
);
INSERT INTO persons VALUES
(1, 'Navneet Singh', 24),
(2, 'Manish Jainav', 22);

INSERT INTO persons VALUES
(1, 'Rahul', 28);
-- Error Code: 1062. Duplicate entry '1' for key 'persons.PRIMARY'
INSERT INTO persons VALUES
(NULL, 'Rahul', 28);
-- Error Code: 1048. Column 'ID' cannot be null

-- Creating Table for Foreign key
CREATE TABLE IF NOT EXISTS customer
(
	cust_id INT,
    name VARCHAR(50),
    age INT,
    CONSTRAINT pk PRIMARY KEY (cust_id)
);

CREATE TABLE orders
(
	order_id INT,
    order_num INT,
    customer_id INT,
    CONSTRAINT pk PRIMARY KEY (order_id),
    CONSTRAINT fk FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);

INSERT INTO customer VALUES
(1, 'Shashank', 29),
(2, 'Rahul', 29);

SELECT * FROM customer;

INSERT INTO orders VALUES
(1001, 20, 1),
(1002, 30, 2);

SELECT * FROM orders; 

INSERT INTO orders VALUES
(1003, 40, 5);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`day2_db`.`orders`, CONSTRAINT `fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`cust_id`))

-- Difference Between Drop and Truncate
SELECT * FROM persons;

TRUNCATE TABLE persons;       -- It will delete the content of the table.
DROP TABLE persons;           -- It will delete the entire table.
DROP TABLE employee;
SELECT * FROM employee;

-- To count total records
SELECT COUNT(*) FROM employee;
-- For each row it will put a star on every row and counts them.

SELECT COUNT(1) FROM employee;
-- Same as Star
SELECT COUNT(1000) FROM employee;
-- Like a Marker.

-- Alias Declaration
SELECT COUNT(*) AS Total_row FROM employee;
SELECT Name, Salary FROM employee;

-- Alias for Multiple Comlumns
SELECT Name AS Emp_Name, Salary AS Emp_Salary
FROM employee;

SELECT * FROM employee;

-- Print Unique hiring_date from the employee table
SELECT DISTINCT(Hiring_Date) AS Distinct_Hiring_date FROM employee;

SELECT COUNT(DISTINCT(Hiring_Date)) AS Distinct_Hiring_date_counts FROM employee;

-- Mathematical Operations
SELECT ID, Name, Salary AS Old_Salary, 
			(Salary + 0.20 * Salary) AS New_Salary
FROM employee;
