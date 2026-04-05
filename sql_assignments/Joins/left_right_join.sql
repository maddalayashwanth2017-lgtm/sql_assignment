CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

INSERT INTO departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Marketing'),
(105,'Sales'),
(106,'Support'),
(107,'Admin'),
(108,'Operations'),
(109,'Security'),
(110,'Logistics'),
(111,'Design'),
(112,'Testing'),
(113,'Research'),
(114,'Training'),
(115,NULL),
(116,'Legal'),
(117,'Procurement'),
(118,NULL),
(119,'Quality'),
(120,'Analytics');

INSERT INTO employees VALUES
(1,'Rahul',101),
(2,'Amit',102),
(3,'Sneha',NULL),
(4,'Priya',101),
(5,'Kiran',NULL),
(6,'Arjun',105),
(7,'Ravi',106),
(8,'Neha',NULL),
(9,'Divya',108),
(10,'Karthik',NULL),
(11,'Meena',110),
(12,'Suresh',111),
(13,'Anita',NULL),
(14,'Varun',113),
(15,'Pooja',114),
(16,'Nikhil',115),
(17,'Lakshmi',NULL),
(18,'Vikas',118),
(19,'Ramesh',119),
(20,'Deepa',NULL);

-- ✅ 1
-- 👉 Write a query to display all employees and their department names.

SELECT emp_name,dept_name
from departments
LEFT JOIN employees
ON employees.dept_id=departments.dept_id

-- ✅ 2
-- 👉 Write a query to display all employees along with department names
-- , and show "No Department" if an employee is not assigned to any department.

SELECT ifnull(emp_name,"No department"),dept_name
from departments
LEFT JOIN employees
ON employees.dept_id=departments.dept_id

-- ✅ 3
-- 👉 Write a query to find employees who do not belong to any department.

SELECT emp_name
from departments
LEFT JOIN employees
ON employees.dept_id=departments.dept_id
WHERE departments.dept_name is null

-- ✅ 4
-- 👉 Write a query to display all departments and the number of employees in each department.
SELECT departments.dept_name,count(employees.emp_id) as employees
FROM employees
RIGHT JOIN departments
ON employees.dept_id=departments.dept_id
GROUP BY departments.dept_name

-- ✅ 5
-- 👉 Write a query to display all employees and only their department name if it is 'IT', otherwise show NULL.


SELECT employees.emp_name,if(dept_name="it",dept_name,null) as dept_name
from departments
LEFT JOIN employees
ON employees.dept_id=departments.dept_id

-- ✅ 6
-- 👉 Write a query to display only employees who belong to the 'HR' department.
SELECT employees.emp_name
from departments
LEFT JOIN employees
ON employees.dept_id=departments.dept_id
WHERE departments.dept_name="HR"

-- ✅ 7
-- 👉 Write a query to display employee name and department name, but only include departments where dept_id = 101 using LEFT JOIN condition.
SELECT employees.emp_name,departments.dept_name
from departments
LEFT JOIN employees
ON employees.dept_id=departments.dept_id
WHERE departments.dept_id=101

-- ✅ 8
-- 👉 Write a query to display all departments that do not have any employees.

SELECT departments.dept_name
FROM employees
RIGHT JOIN departments
ON employees.dept_id=departments.dept_id
WHERE employees.emp_name is null

-- ✅ 9
-- 👉 Write a query to display employee name and department name, sorted by department name.
SELECT departments.dept_name
FROM employees
RIGHT JOIN departments
ON employees.dept_id=departments.dept_id
ORDER BY departments.dept_name

-- ✅ 10
-- 👉 Write a query to display:
-- employee name
-- department name
-- a new column status
-- "Assigned" if employee has a department
-- "Not Assigned" if no department



yashayshdahds