SHOW DATABASES;     -- Command to see the list of Databases

-- Create a Databases
CREATE DATABASE test;

-- Command to delete database
DROP DATABASE test;

-- Command to get inside a database
USE test;

-- Command to create a table (DDL)
CREATE TABLE IF NOT EXISTS employee
(
	id INT,
    emp_name VARCHAR(20)
);

CREATE DATABASE tempdb;
CREATE TABLE IF NOT EXISTS tempdb.employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(20)
);


-- Command to see thelist of Tables
SHOW TABLES;

-- Creating Tables with few more columns
CREATE TABLE IF NOT EXISTS employee_v1
(
	id INT,
    name VARCHAR(50),
    salary DOUBLE,
    hiring_date DATE 
);

SHOW TABLES;   -- Now it gives two tables

SHOW CREATE TABLE employee_v1;   -- It gives the command of how we created the table.
-- Copy from the output
/*
CREATE TABLE `employee_v1` (
   `id` int DEFAULT NULL,
   `name` varchar(50) DEFAULT NULL,
   `salary` double DEFAULT NULL,
   `hiring_date` date DEFAULT NULL
 )*/
 
 -- Inserting data into the tables (DML)
 
 -- SYNTAX 1 to insert data into a table
 INSERT INTO employee_v1 
 VALUES (1, 'Navneet Singh', 25000, '2025-12-10');    -- Date(yyyy-mm-dd)
 
 INSERT INTO employee_v1
 VALUES (1, 'Navneet Singh', '2025-12-10');
 -- Error Code: 1136. Column count doesn't match value count at row 1
 
 -- SYNATX 2 to insert data into a table
 INSERT INTO employee_v1(salary, name, id) 
 VALUES (20000, 'Rahul', 2);
 
 -- Command to Insert multiple records into a table
 INSERT INTO employee_v1 
 VALUES (3, 'Amit', 22000, '2025-12-09'),
		(4, 'Nitin', 23000, '2025-12-08'),
        (5, 'Khushi', 30000, '2025-12-07');

-- To fetch the data from a table(DQL)
SELECT * FROM employee_v1;
SELECT name, salary FROM employee_v1;

-- Example table for integrity constraints
CREATE TABLE IF NOT EXISTS employee_constraint
(
	ID INT,
    Name VARCHAR(50) NOT NULL,
    Salary DOUBLE,
    Hiring_date DATE DEFAULT '2021-01-01',
    UNIQUE (ID),
    CHECK (Salary > 1000)
);

INSERT INTO employee_constraint
VALUES (1, NULL, 30000, '2025-12-12');
-- Error Code: 1048. Column 'Name' cannot be null

INSERT INTO employee_constraint
VALUES (1, 'Navneet Singh', 30000, '2025-12-12');

INSERT INTO employee_constraint
VALUES (1, 'Navneet Singh', 30000, '2025-12-12');
-- Error Code: 1062. Duplicate entry '1' for key 'employee_constraint.ID'

-- In the Unique constraint 'NULL' values are allowed.
INSERT INTO employee_constraint
VALUES (NULL, 'Navneet Singh', 30000, '2025-12-12');

INSERT INTO employee_constraint
VALUES (NULL, 'Divya', 20000, '2025-12-10');

INSERT INTO employee_constraint
VALUES (5, 'Manish', 500, '2025-12-12');
-- Error Code: 3819. Check constraint 'employee_constraint_chk_1' is violated.

INSERT INTO employee_constraint(ID, Name, Salary)
VALUES (7, 'Neeraj', 3000);

SELECT * FROM employee_constraint;

CREATE TABLE IF NOT EXISTS employee_constraint_temp
(
	ID INT,
    Name VARCHAR(50) NOT NULL,
    Salary DOUBLE,
    Hiring_date DATE DEFAULT '2021-01-01',
    CONSTRAINT unique_emp_id UNIQUE (ID),             -- Constraint is defined
    CONSTRAINT salary_check CHECK (Salary > 1000)     -- Constraint is defined
);
INSERT INTO employee_constraint_temp
VALUES (5, 'Manish', 500, '2025-12-12');
-- Error Code: 3819. Check constraint 'salary_check' is violated.
