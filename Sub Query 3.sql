-- A correlated subquery in MySQL is a subquery that depends on the outer query.
-- Unlike a normal subquery (which runs once), a correlated subquery is executed once for each row processed by the outer query.
-- Execute repeatedly based on values of outer query.
USE test;
CREATE TABLE employee (
    eid INT PRIMARY KEY,
    ename VARCHAR(50),
    salary INT,
    department_name VARCHAR(50)
);

INSERT INTO employee (eid, ename, salary, department_name) VALUES
(1,  'Emp1',  30000, 'HR'),
(2,  'Emp2',  32000, 'HR'),
(3,  'Emp3',  34000, 'HR'),
(4,  'Emp4',  36000, 'HR'),
(5,  'Emp5',  38000, 'HR'),

(6,  'Emp6',  50000, 'IT'),
(7,  'Emp7',  52000, 'IT'),
(8,  'Emp8',  54000, 'IT'),
(9,  'Emp9',  56000, 'IT'),
(10, 'Emp10', 58000, 'IT'),

(11, 'Emp11', 60000, 'Finance'),
(12, 'Emp12', 62000, 'Finance'),
(13, 'Emp13', 64000, 'Finance'),
(14, 'Emp14', 66000, 'Finance'),
(15, 'Emp15', 68000, 'Finance'),

(16, 'Emp16', 40000, 'Sales'),
(17, 'Emp17', 42000, 'Sales'),
(18, 'Emp18', 44000, 'Sales'),
(19, 'Emp19', 46000, 'Sales'),
(20, 'Emp20', 48000, 'Sales');

SELECT * FROM employee;

SELECT eid, ename, salary, department_name
FROM employee
WHERE salary > 
				(SELECT AVG(salary) FROM employee AS e
                  WHERE e.department_name = employee.department_name);

SELECT ename, salary, department_name 
FROM employee 
WHERE salary = 
				(SELECT MIN(salary) FROM employee AS e 
                WHERE e.department_name = employee.department_name);
-- Another way
SELECT ename, salary, department_name 
FROM employee 
WHERE salary <= 
				ALL(SELECT MIN(salary) FROM employee AS e 
                WHERE e.department_name = employee.department_name);