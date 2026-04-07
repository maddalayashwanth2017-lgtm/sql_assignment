 CREATE TABLE Empss (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT
);



INSERT INTO Empss VALUES
(1, 'Vamsi', 'HR', 50000, NULL),
(2, 'Ravi', 'HR', 40000, 1),
(3, 'Suresh', 'HR', 42000, 1),
(4, 'Anjali', 'Finance', 60000, NULL),
(5, 'Kiran', 'Finance', 45000, 4),
(6, 'Meena', 'Finance', 47000, 4),
(7, 'Raj', 'IT', 70000, NULL),
(8, 'Teja', 'IT', 50000, 7),
(9, 'Akhil', 'IT', 52000, 7),
(10, 'Divya', 'IT', 48000, 7),
(11, 'Sneha', 'Marketing', 55000, NULL),
(12, 'Arjun', 'Marketing', 40000, 11),
(13, 'Pooja', 'Marketing', 42000, 11),
(14, 'Nikhil', 'Sales', 65000, NULL),
(15, 'Ramesh', 'Sales', 50000, 14),
(16, 'Kavya', 'Sales', 48000, 14),
(17, 'Deepak', 'IT', 51000, 7),
(18, 'Lakshmi', 'Finance', 46000, 4),
(19, 'Harsha', 'HR', 39000, 1),
(20, 'Varun', 'Marketing', 41000, 11);


-- Show each employee along with their manager name.
SELECT e.name as employee,m.name as manager
from Empss e
JOIN Empss m
ON e.manager_id =  m.emp_id

--  List all employees who do not have a manager.


SELECT name,manager_id
from Empss 
WHERE manager_id is NULL 

-- Show managers Along with their department
SELECT e.name as employee,m.name as manager
from Empss e
JOIN Empss m
ON e.manager_id =  m.emp_id

-- Show managers Along with their department
--distinct = modifer keyword
SELECT distinct m.name,m.department
FROM empss e
JOIN empss m
ON e.manager_id = m .emp_id;

-- Show employee names and their department along with their manager’s name. 

SELECT e.name as employee, m.name as manager ,m.department
FROM empss e
JOIN empss m
ON e.manager_id = m .emp_id;

-- Display the salary of employees along with their manager’s salary.

SELECT e.name as employee,e.salary, m.name as manager,m.salary,m.department
FROM empss e
JOIN empss m
ON e.manager_id = m .emp_id;


-- Find employees who earn more than their manager.

SELECT e.name as employee
FROM empss e
JOIN empss m
ON e.manager_id = m .emp_id
WHERE e.salary>m.salary

-- Show employees whose manager works in a different department

SELECT e.name as employee 
FROM empss e
JOIN empss m
ON e.manager_id = m .emp_id
WHERE e.department <> m.department




-- NUMBER OF E
select m.name,count(e.emp_id) as totalTeam
from empss e
join empss m
on e.manager_id = m .emp_id
group by m.name
having totalTeam>=2