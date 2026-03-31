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
ON customers.customer_id = products.customer_id



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










