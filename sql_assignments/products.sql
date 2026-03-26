use rocky;
 

CREATE TABLE products (
   product_id INT PRIMARY KEY,
   product_name VARCHAR(50),
   category VARCHAR(30),
   price DECIMAL(10,2),
   stock INT,
   brand VARCHAR(30)
);

INSERT INTO products VALUES
(1, 'iPhone 13', 'Mobile', 70000, 10, 'Apple'),
(2, 'Galaxy S21', 'Mobile', 60000, 15, 'Samsung'),
(3, 'Redmi Note 11', 'Mobile', 20000, 25, 'Xiaomi'),
(4, 'MacBook Air', 'Laptop', 90000, 5, 'Apple'),
(5, 'Dell Inspiron', 'Laptop', 55000, 8, 'Dell'),
(6, 'HP Pavilion', 'Laptop', 60000, 7, 'HP'),
(7, 'Sony Headphones', 'Accessories', 8000, 20, 'Sony'),
(8, 'Boat Earbuds', 'Accessories', 2000, 50, 'Boat'),
(9, 'iPad', 'Tablet', 50000, 12, 'Apple'),
(10, 'Samsung Tab', 'Tablet', 30000, 18, 'Samsung'),
(11, 'Asus Laptop', 'Laptop', 65000, 6, 'Asus'),
(12, 'OnePlus 11', 'Mobile', 55000, 14, 'OnePlus'),
(13, 'Realme Narzo', 'Mobile', 15000, 30, 'Realme'),
(14, 'Lenovo ThinkPad', 'Laptop', 75000, 4, 'Lenovo'),
(15, 'JBL Speaker', 'Accessories', 10000, 22, 'JBL'),
(16, 'Mi Pad', 'Tablet', 25000, 16, 'Xiaomi'),
(17, 'AirPods', 'Accessories', 15000, 9, 'Apple'),
(18, 'Oppo F21', 'Mobile', 22000, 19, 'Oppo'),
(19, 'Vivo V27', 'Mobile', 28000, 17, 'Vivo'),
(20, 'Noise Watch', 'Accessories', 5000, 40, 'Noise');
















-- 🔹 LIMIT (Top Results)
-- Get top 5 most expensive products


-- Get 3 cheapest products



-- 🔹 LIMIT + OFFSET (Pagination Concept)
-- Skip first 5 highest priced products and get next 5


-- Get 4 products starting from the 3rd cheapest product


-- -


--  GROUP BY (Basic → Intermediate)
-- Find total number of products in each category
SELECT category, count(*) as total_products
FROM products
GROUP BY category

-- Find total stock available for each category
SELECT category,count(stock) as stock_avialable
FROM products
GROUP BY category

-- Find average price of products in each brand
SELECT brand , avg(price) as avg_price
FROM products
group by brand

-- Count how many products each brand has
SELECT brand , count(product_id) as total_products
FROM products
GROUP BY brand

-- Find maximum price in each category
SELECT category , MAX(price) AS COSTLY_product
FROM products
GROUP BY category




-- 🔹 GROUP BY + ORDER BY
-- Find total stock per brand and sort it in descending order
SELECT brand , COUNT(stock) as stock
FROM products
GROUP BY brand
ORDER BY COUNT(stock) DESC

-- Find average price per category and display highest first
SELECT category, avg(price)
FROM products
GROUP BY category
ORDER BY avg(price) DESC

-- Count products per category and sort by count (low to high)
SELECT category , COUNT(product_id)
FROM products
GROUP BY category
ORDER BY COUNT(product_id) ASC




-- 🔹 HAVING (Filtering Groups)
-- Show categories having more than 3 products
SELECT category , COUNT(*) 
FROM products
GROUP BY category 
HAVING count(*) >3


-- Show brands where total stock is greater than 40
SELECT brand , count(stock) as stock_avil
FROM products
GROUP BY brand
having count(stock)>40

-- Find categories where average price is less than 30,000
SELECT category , avg(price) as avg_price
FROM products
GROUP BY category
having avg_price >30000

-- Show brands having more than 2 products
SELECT brand , COUNT(product_id) as total_products
FROM products
GROUP BY brand
HAVING total_products>2

-- Find categories where maximum price is above 70,000
SELECT category , MAX(price) as max_price
FROM products
GROUP BY category
having max_price >700000





UPDATE  products
SET stock= stock+25
WHERE product_id <=20

select* from products



-- 🔹 GROUP BY + HAVING + ORDER BY (Important)


-- Show categories with avg price > 40,000 and sort highest first


-- Count products per brand, show only brands with count ≥ 2, sort by count desc


-- Find brands with total stock > 30 and sort by stock descending
SELECT brand , SUM(stock) as stock_avil
FROM products
GROUP BY brand
HAVING stock_avil>30
ORDER BY stock_avil DESC


SELECT category,AVG(price) as avg_price
FROM products
GROUP BY category
HAVING avg_price>40000
ORDER BY avg_price DESC

SELECT brand ,count(product_id) as total_products
FROM products
GROUP BY brand
HAVING total_products>=2
ORDER BY total_products DESC


SELECT product_name , max(price) as expensive_products
FROM products
GROUP BY product_name
ORDER BY expensive_products DESC
LIMIT 5

SELECT product_name , min(price) as cheap_products
FROM products
GROUP BY product_name
ORDER BY cheap_products ASC
LIMIT 3

SELECT product_name , max(price) as expensive_products
FROM products
GROUP BY product_name
ORDER BY expensive_products DESC
LIMIT 5 OFFSET 5


SELECT product_name , min(price) as cheap_products
FROM products
GROUP BY product_name
ORDER BY cheap_products ASC
LIMIT 4 OFFSET 3















