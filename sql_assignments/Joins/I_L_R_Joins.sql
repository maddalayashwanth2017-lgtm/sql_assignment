CREATE TABLE Students2 (
   student_id INT PRIMARY KEY,
   name VARCHAR(50),
   email VARCHAR(100),
   phone VARCHAR(15),
   city VARCHAR(50),
   gender VARCHAR(10),
   dob DATE,
   course_id INT,
   join_date DATE
);

CREATE TABLE Courses (
   course_id INT PRIMARY KEY,
   course_name VARCHAR(50),
   duration_months INT,
   fees INT,
   trainer_name VARCHAR(50),
   mode VARCHAR(20), -- Online / Offline
   start_date DATE
   

);

INSERT INTO Courses VALUES
(101, 'Python', 6, 25000, 'Rahul Sharma', 'Online', '2025-01-15'),
(102, 'Data Science', 8, 45000, 'Anita Verma', 'Offline', '2025-02-01'),
(103, 'SQL', 4, 15000, 'Vikas Rao', 'Online', '2025-03-10'),
(104, 'Java', 6, 30000, 'Suresh Kumar', 'Offline', '2025-01-25'),
(105, 'Web Development', 7, 35000, 'Priya Singh', 'Online', '2025-04-05'),
(106, 'Machine Learning', 9, 50000, 'Ramesh Patel', 'Offline', '2025-02-20'),
(107, 'Power BI', 3, 12000, 'Neha Reddy', 'Online', '2025-03-01'),
(108, 'Cyber Security', 6, 40000, 'Amit Joshi', 'Offline', '2025-05-12');

INSERT INTO Students2 VALUES
(1, 'Yash', 'yash@gmail.com', '9876543210', 'Hyderabad', 'Male', '2002-05-14', 101, '2025-01-16'),
(2, 'Priya', 'priya@gmail.com', '9876501234', 'Delhi', 'Female', '2001-07-22', 102, '2025-02-02'),
(3, 'Rahul', 'rahul@gmail.com', '9123456789', 'Mumbai', 'Male', '2000-09-10', 103, '2025-03-12'),
(4, 'Sneha', 'sneha@gmail.com', '9988776655', 'Chennai', 'Female', '2003-01-18', 104, '2025-01-26'),
(5, 'Arjun', 'arjun@gmail.com', '9871234567', 'Bangalore', 'Male', '2002-11-30', 105, '2025-04-06'),
(6, 'Kavya', 'kavya@gmail.com', '9012345678', 'Pune', 'Female', '2001-03-25', 106, '2025-02-22'),
(7, 'Rohit', 'rohit@gmail.com', '9345678123', 'Hyderabad', 'Male', '2000-12-05', 107, '2025-03-03'),
(8, 'Meena', 'meena@gmail.com', '9567890123', 'Kolkata', 'Female', '2003-06-19', 108, '2025-05-13'),
(9, 'Vikram', 'vikram@gmail.com', '9234567812', 'Delhi', 'Male', '2002-08-08', 101, '2025-01-18'),
(10, 'Anjali', 'anjali@gmail.com', '9789012345', 'Mumbai', 'Female', '2001-04-12', 102, '2025-02-05');



-- 🔵 INNER JOIN (Intermediate – Real-Time)
-- 1.
-- Show student name, course name, and fees where course fees are between 30,000 and 80,000 and student city is Hyderabad.
--  👉 Scenario: City-based premium course analysis

SELECT students2.name,courses.course_name,courses.fees
FROM students2
INNER JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.fees between 30000 and 800000 and students2.city="hyderabad"

-- 2.
-- Find students whose course mode is Online and whose names start with 'S'.
--  👉 Use LIKE
--  👉 Scenario: Filtering online learners

SELECT *
FROM students2
INNER JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.mode="online" and students2.name like "S%"

-- 3.
-- Display course name and total number of students enrolled, but only for courses having more than 2 students.
--  👉 Use GROUP BY + HAVING
--  👉 Scenario: Popular course tracking

SELECT  courses.course_name, count(students2.student_id) as total_students
FROM students2
INNER JOIN courses
ON students2.course_id=courses.course_id
GROUP BY courses.course_name
HAVING total_students > 2


-- 4.
-- List students who joined before course start date and course duration is greater than 6 months.
--  👉 Scenario: Early enrollment analysis

SELECT students2.student_id,
students2.name ,
MIN(courses.start_date),
COUNT(courses.duration_months) as duration
FROM students2
INNER JOIN courses
ON students2.course_id=courses.course_id
GROUP BY  students2.student_id,students2.name 
HAVING MIN(courses.start_date) and duration > 6

-- 5.
-- Find students enrolled in courses handled by trainers 'Ravi' or 'Kiran' and fees greater than 40,000.
--  👉 Use IN + AND
--  👉 Scenario: Trainer performance


SELECT *
FROM students2
INNER JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.trainer_name in ("Ravi","kiran")  and courses.fees > 40000



INSERT INTO Courses VALUES
(109, 'Python', 6, 25000, 'Rahul Sharma', 'Online', '2025-01-15'),
(110, 'Data Science', 8, 45000, NULL, 'Offline', '2025-02-01'),
(111, 'SQL', NULL, 15000, 'Vikas Rao', 'Online', '2025-03-10'),
(112, 'Java', 6, NULL, 'Suresh Kumar', 'Offline', '2025-01-25'),
(113, 'Web Development', 7, 35000, 'Priya Singh', NULL, '2025-04-05'),
(114, 'Machine Learning', 9, 50000, 'Ramesh Patel', 'Offline', NULL),
(115, 'Power BI', 3, 12000, NULL, 'Online', '2025-03-01'),
(116, 'Cyber Security', NULL, NULL, 'Amit Joshi', 'Offline', '2025-05-12');

INSERT INTO Students2 VALUES
(11, 'Yash', 'yash@gmail.com', '9876543210', 'Hyderabad', 'Male', '2002-05-14', 109, '2025-01-16'),
(12, 'Priya', NULL, '9876501234', 'Delhi', 'Female', '2001-07-22', 110, '2025-02-02'),
(13, 'Rahul', 'rahul@gmail.com', NULL, 'Mumbai', 'Male', '2000-09-10', 111, '2025-03-12'),
(14, 'Sneha', 'sneha@gmail.com', '9988776655', NULL, 'Female', '2003-01-18', 112, '2025-01-26'),
(15, 'Arjun', 'arjun@gmail.com', '9871234567', 'Bangalore', 'Male', NULL, 113, '2025-04-06'),
(16, 'Kavya', 'kavya@gmail.com', '9012345678', 'Pune', 'Female', '2001-03-25', NULL, '2025-02-22'),
(17, 'Rohit', NULL, '9345678123', 'Hyderabad', 'Male', '2000-12-05', 115, NULL),
(18, 'Meena', 'meena@gmail.com', '9567890123', 'Kolkata', NULL, '2003-06-19', 116, '2025-05-13');



-- 🟢 LEFT JOIN (Intermediate – Real-Time)
-- 6.
-- Show all students and their course details where course fees are greater than 50,000 OR student has no course assigned.
--  👉 Use OR + NULL logic
--  👉 Scenario: Premium + unassigned students

SELECT*
FROM students2
LEFT JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.fees > 50000 OR courses.course_name is null

-- 7.
-- Find students who are not enrolled in any course OR enrolled in Offline courses.
--  👉 Scenario: Offline marketing campaign

SELECT*
FROM students2
LEFT JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.course_id is null or courses.mode= "offline"



-- 8.
-- Display course name and number of students, including courses with zero students, and show only courses with student count less than 3.
--  👉 Use GROUP BY + HAVING
--  👉 Scenario: Low enrollment detection

SELECT ifnull (courses.course_name,"no course"),count(student_id) 
FROM students2
LEFT JOIN courses
ON students2.course_id=courses.course_id
GROUP BY courses.course_name
HAVING count(student_id) < 3


-- 9.
-- Show students whose course start date is between '2024-01-01' and '2024-12-31' OR who have no course.
--  👉 Use BETWEEN
--  👉 Scenario: New batch tracking


SELECT*
FROM students2
LEFT JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.start_date BETWEEN '2024-01-01' and '2024-12-31' OR courses.course_name is null




-- 10.
-- List all students and display course name only if course fees are above average fees, otherwise show NULL.
--  👉 Use subquery concept
--  👉 Scenario: High-value course filtering

SELECT*
FROM students2
LEFT JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.fees>(
   SELECT AVG (courses.fees)
   FROM courses
)



-- 🔴 RIGHT JOIN (Intermediate – Real-Time)
-- 11.
-- Show all courses with student names where course fees are greater than 40,000.
--  👉 Scenario: Premium course dashboard

SELECT courses.course_name,students2.name
FROM students2
RIGHT JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.fees > 40000


-- 12.
-- Find courses that have no students OR duration is less than 3 months.
--  👉 Scenario: Course optimization

SELECT courses.course_name,students2.name
FROM students2
RIGHT JOIN courses
ON students2.course_id=courses.course_id
WHERE students2.student_id is null  OR courses.duration_months > 3


-- 13.
-- Display course name and total students, and show only courses where total students are between 1 and 5.
--  👉 Use BETWEEN + HAVING
--  👉 Scenario: Medium batch analysis

SELECT courses.course_name,count(Students2.name) as total_students
FROM students2
RIGHT JOIN courses
ON students2.course_id=courses.course_id
GROUP BY courses.course_name 
HAVING total_students BETWEEN 1 and 5

-- 14.
-- List all courses where trainer name contains 'a' and show student names if available.
--  👉 Use LIKE
--  👉 Scenario: Trainer-based insights

SELECT courses.course_name,courses.course_id,courses.trainer_name
FROM students2
RIGHT JOIN courses
ON students2.course_id=courses.course_id
WHERE courses.trainer_name like "%a%"

-- 15.
-- Show all courses and students where student join date is after '2023-01-01', but still include courses with no students.
--  👉 Scenario: Recent enrollment tracking

SELECT courses.course_name,students2.name
FROM students2
RIGHT JOIN courses
ON students2.course_id=courses.course_id
WHERE students2.join_date > '2023-01-01' or students2.course_id is null

