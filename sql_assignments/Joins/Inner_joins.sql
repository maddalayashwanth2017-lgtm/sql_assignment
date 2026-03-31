CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),

    city VARCHAR(50)

)

CREATE TABLE products(

    order_id INT PRIMARY KEY,
    customer_id INT, 
    pruduct_name VARCHAR(20),
    amount INT NOT NULL,
    order_date date,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)



)

alter table products
rename column pruduct_name to product_name;

INSERT INTO customers (customer_id, name, city)
VALUES
(2, 'Priya', 'Chennai'),
(3, 'Arjun', 'Bangalore'),
(4, 'Sneha', 'Mumbai'),
(5, 'Vikram', 'Delhi'),
(6, 'Anjali', 'Pune');
INSERT INTO customers (customer_id, name, city)
VALUES (1, 'Rahul', 'Hyderabad');

INSERT INTO products (order_id, customer_id, product_name, amount, order_date)
VALUES
(101, 1, 'Laptop', 55000, '2026-03-10'),
(102, 2, 'Mobile', 20000, '2026-03-12'),
(103, 3, 'Headphones', 2500, '2026-03-15'),
(104, 4, 'Keyboard', 1500, '2026-03-18'),
(105, 5, 'Monitor', 12000, '2026-03-20');


    SELECT*
    FROM customers
INNER JOIN products
ON customers.c_id = products.c_id



-- 1.
-- Get customer names and product names for all orders
 
SELECT customers.name , products.product_name
FROM customers
INNER JOIN products
ON customers.customer_id = products.customer_id;





ALTER TABLE customers
RENAME column customer_id to c_id;
ALTER TABLE products
RENAME column customer_id to c_id;

-- 2.
-- Find customers who placed orders with amount greater than 20000

SELECT customers.name,products.amount
FROM customers
INNER JOIN products
ON customers.c_id = products.c_id
WHERE amount > 20000


-- 3.
-- Get customer name, city, and product name where city is 'Hyderabad'

SELECT customers.name,city,products.product_name
FROM customers
INNER JOIN products
ON customers.c_id=products.c_id
WHERE city = "hyderabad"

-- 4.
-- Find all orders where product name starts with 'S' and amount is greater than 10000

SELECT*
FROM customers
INNER JOIN products
ON customers.c_id = products.c_id
WHERE name like "s%" and amount > 1000;

-- 5.
-- Get customers who ordered products between amount 10000 and 50000


SELECT*
FROM customers
INNER JOIN products
ON customers.c_id = products.c_id
WHERE amount BETWEEN 10000 and 50000;

-- 6.
-- Find customer names who ordered either 'Laptop' or 'Mobile'

SELECT*
FROM customers
INNER JOIN products
ON customers.c_id = products.c_id
WHERE product_name ="laptop" OR "Mobile"


-- 7.
-- Get top 5 highest order amounts with customer names

SELECT customers.name,max(amount) as spent
FROM customers
INNER JOIN products
ON customers.c_id = products.c_id
GROUP BY customers.name,amount
ORDER BY spent DESC



-- 8.
-- Skip first 5 highest orders and get next 5 records with customer name and amount

SELECT customers.name,max(amount) as spent
FROM customers
INNER JOIN products
ON customers.c_id = products.c_id
GROUP BY customers.name
ORDER BY spent DESC
LIMIT 5 OFFSET 2;





-- 9.
-- Find customers whose name starts with 'A' and who placed orders greater than 30000

SELECT*
FROM customers
INNER JOIN products
ON customers.c_id = products.c_id
WHERE name LIKE "a%" and amount>2000


INSERT INTO customers (c_id, name, city)
VALUES
(7, 'Kiran', 'Hyderabad'),
(8, 'Meena', 'Chennai'),
(9, 'Ravi', 'Bangalore'),
(10, 'Lakshmi', 'Mumbai'),
(11, 'Suresh', 'Delhi'),
(12, 'Divya', 'Pune');

INSERT INTO products (order_id, c_id, product_name, amount, order_date)
VALUES
(207, 7, 'HP ProBook', 72000, '2026-03-26'),
(208, 8, 'Dell Pro Laptop', 68000, '2026-03-27'),
(209, 9, 'Realme Pro Phone', 22000, '2026-03-28'),
(210, 10, 'Oppo Pro Mobile', 25000, '2026-03-29'),
(211, 11, 'Vivo Pro Phone', 21000, '2026-03-30'),
(212, 12, 'Canon Pro Camera', 85000, '2026-03-31');


-- Get customer name, city, product name where:
-- city is 'Delhi' OR 'Mumbai'
-- amount > 20000
-- product name contains 'Pro'
-- show only 3 records after skipping first 2 records

--using group by
SELECT customers.name,city , products.product_name as p_name , products.amount as p_amount
FROM customers
INNER JOIN products
ON customers.c_id=products.c_id
GROUP BY customers.name,city,p_name,p_amount
HAVING (city = "delhi" or city = "mumbai") and p_name like "%pro%" and p_amount>20000
LIMIT 3 OFFSET 2

-- using WHERE clause
SELECT customers.name,city , products.product_name , products.amount
FROM customers
INNER JOIN products
ON customers.c_id=products.c_id
WHERE  (city = "delhi" or city = "mumbai") and products.product_name like "%pro%" and products.amount>20000
LIMIT 3 OFFSET 2







