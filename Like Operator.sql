USE day2_db;
/* To use LIKE operation in WHERE clause
'%' ---> zero, one or more than one characters
'_' ---> Only one Character */ 
DROP TABLE employee;
CREATE TABLE employee(
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DOUBLE,
    Hiring_date DATE,
    City VARCHAR(50)
);
INSERT INTO employee(ID, Name, Age, Salary, Hiring_date, City)
VALUES
(1, 'Navneet', 24, 50000, '2025-12-12', 'Mathura'),
(2, 'Manish', 22, 45000, '2025-12-11','Rohtak'),
(3, 'Devendra', 26, 40000, '2025-12-11', 'Jaipur'),
(4, 'Priyansh', 20, 35000, '2025-12-08', 'Goverdhan'),
(5, 'Ubaid', 22, 30000, '2025-12-08', 'Jaipur'),
(6, 'Khushi', 22, 25000, '2025-12-07', 'Phulera'),
(7, 'Vikas', 41, 88000, '2015-04-08', 'Delhi'),
(8, 'Pooja', 24, 32000, '2022-06-14', 'Jaipur'),
(9, 'Karan', 31, 54000, '2019-08-30', 'Mumbai'),
(10, 'Anjali', 27, 40000, '2021-01-19', 'Pune'),
(11, 'Rohit', 34, 65000, '2018-12-11', 'Bangalore'),
(12, 'Nisha', 30, 50000, '2019-10-07', 'Chennai'),
(13, 'Suresh', 45, 95000, '2014-05-23', 'Delhi'),
(14, 'Meena', 28, 43000, '2020-09-01', 'Hyderabad'),
(15, 'Akash', 26, 36000, '2022-03-17', 'Indore'),
(16, 'Kriti', 33, 60000, '2018-06-25', 'Bhopal'),
(17, 'Manish', 39, 82000, '2016-11-09', 'Mumbai'),
(18, 'Isha', 24, 30000, '2023-01-05', 'Noida'),
(19, 'Deepak', 36, 70000, '2017-08-14', 'Delhi'),
(20, 'Simran', 29, 48000, '2020-04-28', 'Chandigarh'),
(21, 'Nitin', 31, 56000, '2019-02-20', 'Pune'),
(22, 'Payal', 27, 39000, '2021-07-15', 'Jaipur'),
(23, 'Rajesh', 44, 92000, '2014-03-18', 'Kolkata'),
(24, 'Shalini', 35, 68000, '2017-10-09', 'Delhi'),
(25, 'Varun', 28, 45000, '2020-05-13', 'Bangalore'),
(26, 'Tanya', 26, 37000, '2022-02-01', 'Mumbai'),
(27, 'Ashok', 48, 105000, '2012-09-27', 'Chennai'),
(28, 'Ritu', 34, 64000, '2018-04-11', 'Indore'),
(29, 'Mohit', 29, 47000, '2021-06-23', 'Noida'),
(30, 'Kavya', 25, 34000, '2022-08-19', 'Pune'),
(31, 'Sunil', 42, 87000, '2015-12-30', 'Delhi'),
(32, 'Ayesha', 31, 56000, '2019-09-16', 'Hyderabad'),
(33, 'Gaurav', 37, 74000, '2017-03-05', 'Gurgaon'),
(34, 'Priya', 28, 41000, '2020-01-25', 'Bangalore'),
(35, 'Hemant', 46, 98000, '2013-07-12', 'Mumbai'),
(36, 'Shreya', 24, 31000, '2023-04-03', 'Pune'),
(37, 'Ankit', 33, 62000, '2018-10-20', 'Noida'),
(38, 'Divya', 27, 39000, '2021-11-08', 'Delhi'),
(39, 'Ramesh', 50, 110000, '2011-06-18', 'Chennai'),
(40, 'Sonali', 35, 69000, '2017-02-14', 'Bhopal'),
(41, 'Abhishek', 29, 48000, '2020-12-01', 'Indore'),
(42, 'Pankaj', 41, 86000, '2016-08-22', 'Delhi'),
(43, 'Monika', 26, 36000, '2022-09-09', 'Jaipur'),
(44, 'Vivek', 38, 76000, '2017-05-16', 'Gurgaon'),
(45, 'Sakshi', 32, 58000, '2019-04-07', 'Mumbai'),
(46, 'Ravi', 47, 99000, '2013-11-27', 'Kolkata'),
(47, 'Pallavi', 28, 42000, '2021-03-18', 'Pune'),
(48, 'Yash', 25, 33000, '2022-10-30', 'Bangalore'),
(49, 'Kishore', 44, 91000, '2014-01-11', 'Hyderabad'),
(50, 'Nupur', 34, 65000, '2018-09-06', 'Delhi'),
(51, 'Sanjay', 52, 115000, '2010-05-25', 'Mumbai'),
(52, 'Aditi', 29, 47000, '2020-06-14', 'Pune'),
(53, 'Harsh', 36, 71000, '2017-12-03', 'Noida'),
(54, 'Rekha', 41, 85000, '2016-02-19', 'Chennai'),
(55, 'Naveen', 27, 39000, '2021-09-01', 'Bangalore'),
(56, 'Bhavna', 33, 61000, '2018-08-17', 'Delhi'),
(57, 'Ajay', 45, 94000, '2014-06-29', 'Indore'),
(58, 'Kajal', 24, 30000, '2023-05-11', 'Pune'),
(59, 'Tarun', 31, 56000, '2019-11-04', 'Gurgaon'),
(60, 'Shashank', 37, 73000, '2017-01-15', 'Mumbai'),
(61, 'Lokesh', 28, 43000, '2021-10-07', 'Jaipur'),
(62, 'Swati', 34, 66000, '2018-03-12', 'Bhopal'),
(63, 'Dinesh', 48, 102000, '2012-12-21', 'Delhi'),
(64, 'Anu', 26, 37000, '2022-07-03', 'Noida'),
(65, 'Prakash', 39, 82000, '2016-04-09', 'Chennai'),
(66, 'Nandini', 31, 55000, '2019-06-26', 'Bangalore'),
(67, 'Sameer', 43, 89000, '2015-10-18', 'Mumbai'),
(68, 'Preeti', 27, 40000, '2021-02-02', 'Pune'),
(69, 'Rajat', 35, 68000, '2017-09-14', 'Delhi'),
(70, 'Kirti', 29, 47000, '2020-08-08', 'Indore'),
(71, 'Alok', 46, 97000, '2013-03-27', 'Kolkata'),
(72, 'Mehul', 33, 60000, '2018-05-19', 'Noida'),
(73, 'Priti', 25, 34000, '2022-11-15', 'Jaipur'),
(74, 'Jatin', 38, 75000, '2017-06-22', 'Delhi'),
(75, 'Nikita', 30, 52000, '2019-07-29', 'Mumbai'),
(76, 'Om', 41, 86000, '2016-01-13', 'Chennai'),
(77, 'Shivani', 28, 43000, '2021-04-20', 'Pune'),
(78, 'Rohini', 35, 69000, '2017-11-01', 'Bangalore'),
(79, 'Mahesh', 50, 112000, '2011-08-09', 'Hyderabad'),
(80, 'Aarav', 24, 31000, '2023-02-17', 'Delhi'),
(81, 'Puneet', 34, 65000, '2018-07-06', 'Gurgaon'),
(82, 'Tanvi', 27, 41000, '2021-01-09', 'Mumbai'),
(83, 'Vinod', 45, 96000, '2014-09-24', 'Indore'),
(84, 'Rupal', 32, 58000, '2019-12-16', 'Pune'),
(85, 'Kunal', 29, 48000, '2020-10-05', 'Bangalore'),
(86, 'Lata', 41, 85000, '2016-06-01', 'Delhi'),
(87, 'Aman', 26, 36000, '2022-03-27', 'Noida'),
(88, 'Sonal', 37, 72000, '2017-04-12', 'Mumbai'),
(89, 'Narendra', 52, 118000, '2010-02-08', 'Chennai'),
(90, 'Ishita', 31, 55000, '2019-05-21', 'Pune'),
(91, 'Kapil', 44, 93000, '2014-12-02', 'Delhi'),
(92, 'Pooja', 28, 42000, '2021-08-19', 'Jaipur'),
(93, 'Arvind', 39, 81000, '2016-09-28', 'Gurgaon'),
(94, 'Kiran', 34, 66000, '2018-02-11', 'Bangalore'),
(95, 'Suman', 47, 98000, '2013-10-06', 'Mumbai'),
(96, 'Richa', 25, 33000, '2022-12-14', 'Noida'),
(97, 'Nilesh', 36, 70000, '2017-07-01', 'Indore'),
(98, 'Bhavesh', 41, 86000, '2016-05-17', 'Chennai'),
(99, 'Mitali', 29, 47000, '2020-03-23', 'Pune'),
(100, 'Dev', 33, 61000, '2018-11-30', 'Delhi');
SELECT * FROM employee;

## Get all those employees whose name starts with 'S'
SELECT * FROM employee WHERE Name LIKE 'S%';

## Get all those employees whose name ends with 'L'
SELECT * FROM employee WHERE Name LIKE '%L';

## Get all those employees whose name starts with 'S' and ends with 'K'
SELECT * FROM employee WHERE Name LIKE 'S%K';

## Get all those employees whose name will have exact 5 characters
SELECT * FROM employee WHERE Name LIKE '_____';
SELECT * FROM employee WHERE LENGTH(Name) = 5;

## Return all those employees whose name contains atleast 5 charcters.
SELECT * FROM employee WHERE Name LIKE '%_____%';
SELECT * FROM employee WHERE LENGTH(Name) >= 5;
SELECT * FROM employee WHERE Name LIKE '_____%';
SELECT * FROM employee WHERE Name LIKE '%_____';