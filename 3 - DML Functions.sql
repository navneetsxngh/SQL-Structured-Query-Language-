USE day2_db;
DROP TABLE employee;
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
SET SQL_SAFE_UPDATES = 0;

-- UPDATE - It Will be made for all Rows.
UPDATE employee SET Age = 20;
UPDATE employee SET Age = 25, Salary = Salary * 1.2;

-- For Specific Update
-- WHERE clause which is used to filter out the columns.
SELECT * FROM employee WHERE Hiring_Date = '2025-12-11';
UPDATE employee SET Salary = 80000 WHERE Hiring_Date = '2025-12-11';
SELECT * FROM employee;

-- DELETE command removes the data in the table.
DELETE FROM employee where Hiring_Date = '2025-12-07';
ROLLBACK;  -- It reverts the actions
COMMIT;   -- It saves the actions

-- Auto-Increment
CREATE TABLE auto_inc_ex
(
	ID INT AUTO_INCREMENT,
    Name VARCHAR(20),
    PRIMARY KEY (ID)
);
INSERT INTO auto_inc_ex(Name) 
VALUES ('Navneet Singh'),
		('Aakansha Singh');
SELECT * FROM auto_inc_ex;

-- For the first two rows
SELECT * FROM employee LIMIT 2;
SELECT * FROM employee;

-- Arrange data in Ascending Order
SELECT * FROM employee ORDER BY Name;

-- In Descending Order
SELECT * FROM employee ORDER BY Name DESC;

UPDATE employee SET Salary = 40000 WHERE Name = 'Priyansh Gaud';

-- Display employee data in desc order of salary and if salaries are same.
SELECT * FROM employee ORDER BY Salary DESC, NAME ASC;

## Write a Query to find the employee who is getting maximum Salary? Only one row.
SELECT * FROM employee ORDER BY Salary DESC LIMIT 1;

## Write a Query to find the employee who is getting minimum Salary? Only one row.
SELECT * FROM employee ORDER BY Salary LIMIT 1;