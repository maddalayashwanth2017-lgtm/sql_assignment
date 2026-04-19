CREATE DATABASE job_dashboard

CREATE DATABASE job_dashboard;
USE job_dashboard;
CREATE TABLE candidates (
name VARCHAR(100),
age INT,
skills VARCHAR(255),
qualification VARCHAR(255),
experience INT,
email VARCHAR(100) PRIMARY KEY
);

CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(100),
password VARCHAR(100),
role VARCHAR(50)
);

INSERT INTO users (username,password,role)
VALUES ('admin','admin123','admin');
