 CREATE TABLE Empss (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT
);

-- 🟢 1. Employees earning more than company average
SELECT name,salary
FROM Empss
WHERE salary > (
    SELECT AVG(salary) FROM empss
)

-- 🟢 2. Employees earning more than their manager
SELECT name,salary
FROM Empss e
WHERE salary > (
    SELECT salary FROM empss
    WHERE e.manager_id=empss.emp_id
)


-- 🟢 3. Employees earning less than highest salary
SELECT name,salary
FROM empss
WHERE salary<(
    SELECT MAX(salary)from empss
)

-- 🟢 4. Employees earning equal to lowest salary

SELECT name,salary
FROM empss
WHERE salary=(
    SELECT MIN(salary)from empss
)

-- 🟢 5. Employees earning more than HR department average

SELECT name,salary
FROM empss
WHERE salary > (
    SELECT AVG(salary) FROM empss
    WHERE department="hr"
)

-- 🔥 1. Second Highest Salary (Simple)
SELECT MAX(salary)
FROM empss
WHERE salary < (
    SELECT MAX(salary) from empss
)


SELECT name,salary
FROM empss
WHERE salary = (
    SELECT MAX(salary) 
    FROM empss
    WHERE salary<(
        SELECT MAX (salary)
        FROM empss

    )

)

-- 👉 Question:
--  Find employees who work in departments where at least one employee earns more than 60,000.
 
SELECT name,department,salary
FROM empss
WHERE salary>60000 AND department IN (
    SELECT department FROM empss
    WHERE salary > 60000
)   

-- 👉 Question:
--  Find employees whose salary is greater than any employee in HR department.

SELECT name,salary
from empss
WHERE salary > ANY  (
    SELECT salary 
    FROM empss
    WHERE department= "it"
)

-- 👉 Question:
--  Find employees whose salary is greater than all employees in Finance department.
SELECT name,salary
from empss
WHERE salary > ALL (
    SELECT salary 
    FROM empss
    WHERE department= "finanne"
)

SELECT department from empss
where department = "finanane"
    

    