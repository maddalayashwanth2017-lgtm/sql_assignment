show DATABASES

SHOW tables

CREATE TABLE students(
    s_id INT PRIMARY KEY,
    name VARCHAR(20),
    marks INT
)

CREATE TABLE placement(
    p_id INT PRIMARY KEY,
    s_id INT,
    placed VARCHAR(10),
    Foreign Key (s_id) REFERENCES students(s_id)
)

INSERT INTO students (s_id, name, marks) VALUES
(1, 'Rahul', 85),
(2, 'Sneha', 92),
(3, 'Arjun', 76),
(4, 'Priya', 88),
(5, 'Kiran', 69),
(6, 'Anjali', 95),
(7, 'Ravi', 73),
(8, 'Meena', 81),
(9, 'Vikram', 67),
(10, 'Neha', 90);

INSERT INTO placement (p_id, s_id, placed) VALUES
(101, 1, 'Yes'),
(102, 2, 'Yes'),
(103, 3, 'No'),
(104, 4, 'Yes'),
(105, 5, 'No'),
(106, 6, 'Yes'),
(107, 7, 'No'),
(108, 8, 'Yes'),
(109, 9, 'No'),
(110, 10, 'Yes');


