create DATABASE assignments

-- task 1

CREATE TABLE students (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
course VARCHAR(50)
);
use assignments

show TABLES

SELECT * FROM students;

INSERT INTO students (name,course) VALUES
('Ram','Python'),
('John','Java'),
('Sara','React'),
('Ravi','SQL');

--task 2
SET AUTOCOMMIT=0;
DELETE FROM students
WHERE id = 2;

ROLLBACK

--task 3

DELETE FROM students
WHERE id = 3;

COMMIT

--task4

DELETE FROM students;

--task 5
TRUNCATE TABLE students;

SHOW TABLES;    


ROLLBACK

SELECT * FROM students;

-- task 6

DROP TABLE students;

use rocky;

show tables



















