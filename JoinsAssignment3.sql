use joins;

-- create categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- insert data into categories table
INSERT INTO categories (category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Sports');


-- create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    price DECIMAL(10, 2));

-- insert data into products table
INSERT INTO products (product_id, product_name, category_id, price)
VALUES
(1, 'Laptop', 1, 1200),
(2, 'Smartphone', 1, 800),
(3, 'T-shirt', 2, 25),
(4, 'Blender', 3, 150),
(5, 'Novel', 4, 15),
(6, 'Soccer Ball', 5, 30),
(7, 'Headphones', 1, 100),
(8, 'Jacket', 2, 60),
(9, 'Coffee Maker', 3, 80),
(10, 'Cookbook', 4, 25);


-- create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    referrer_id INT
);

-- insert data into customers table
INSERT INTO customers (customer_id, customer_name, referrer_id)
VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', NULL),
(5, 'Eva', 2);


-- create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

-- insert data into orders table
INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1, 1, '2023-01-01'),
(2, 1, '2023-01-02'),
(3, 2, '2023-01-03'),
(4, 3, '2023-01-04'),
(5, 2, '2023-01-05'),
(6, 4, '2023-01-06');


-- create order_items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

-- insert data into order_items table
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES 
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 3, 4, 1),
(5, 4, 5, 1),
(6, 5, 6, 2),
(7, 6, 7, 1),
(8, 1, 8, 1);


-- BASIC QUERIES

-- Write a query to retrieve all products and their corresponding category names using `INNER JOIN`.
select p.product_name, c.category_name from
products p inner join categories c 
on p.category_id = c.category_id;


-- How can you get all categories and the products in them, including categories with no products using `LEFT JOIN`?
select c.category_name, p.product_name from 
categories c left join products p 
on c.category_id = p.category_id;


-- How do you find all customers who have not placed any orders using a `LEFT JOIN`?
select c.customer_name from customers c left join 
orders o on c.customer_id = o.customer_id 
where o.order_id is null;


-- Write a query to retrieve the names of products and their corresponding category names, ordered by category name using `INNER JOIN`.
select p.product_name, c.category_name from products p 
inner join categories c 
on p.category_id = c.category_id
order by c.category_name;


-- INTERMEDIATE QUERIES

-- How can you count the number of products in each category using `GROUP BY`?
select c.category_name, count(p.product_id) as total_products
from categories c inner join products p 
on c.category_id = p.category_id 
group by c.category_name;


-- Write a query to find all categories that do not have any products using `LEFT JOIN` and `WHERE`.
select c.category_name from categories c 
left join products p 
on c.category_id = p.category_id 
where p.product_id is null;


-- How can you find the maximum price of products in each category using `INNER JOIN` and `GROUP BY`?
select c.category_name, max(p.price) as max_price from products  p inner join 
categories c on p.category_id = c.category_id 
group by c.category_name;


-- Write a query to list all orders along with the number of items in each order using `LEFT JOIN` and `GROUP BY`.
select o.order_id, count(oi.product_id) as item_count 
from orders o left join order_items oi 
on o.order_id= oi.order_id 
group by o.order_id;


-- How can you find all products that have been ordered more than five times using `GROUP BY` and `HAVING`?
select oi.product_id, count(oi.order_id) as order_count 
from order_items oi group by oi.product_id 
having count(oi.order_id)>5;



-- ADVANCED QUERIES

-- Write a query to find products that belong to the Electronics category using `INNER JOIN`.
select p.product_name from products p inner join categories c 
on p.category_id= c.category_id 
where c.category_name="Electronics";


-- How do you use `GROUP BY` to calculate the average price of products in each category?
select c.category_name, avg(p.price) as average_price 
from categories c inner join products p 
on c.category_id = p.category_id 
group by c.category_name;


-- Write a query to list all customers with their orders, showing customers without orders using `LEFT JOIN`.
select c.customer_name, o.order_id from customers c
left join orders o on c.customer_id = o.customer_id;


-- How can you find customers who have not referred anyone using `LEFT JOIN`?
select c1.customer_name from customers c1
left join customers c2 on c1.customer_id = c2.referrer_id
where c2.referrer_id is null;


-- Write a query to get the total number of products in each category using `INNER JOIN` and `GROUP BY`.
select c.category_name, count(p.product_id) as total_products 
from categories c inner join products p 
on c.category_id = p.category_id 
group by c.category_name;


-- How can you create a sales report showing the total sales amount by category using `GROUP BY`?
select c.category_name, sum(oi.quantity*p.price) as total_sales
from categories c inner join products p
on c.category_id= p.category_id
inner join order_items oi on p.product_id = oi.product_id
group by c.category_name;


-- Write a query to find categories with more than three products using `GROUP BY` and `HAVING`.
select c.category_name from categories c 
inner join products p on c.category_id = p.category_id 
group by c.category_name 
having count(p.product_id)>3;


-- How do you order products by price within each category using `INNER JOIN`?
select p.product_name, c.category_name, p.price 
from products p inner join categories c on 
p.category_id= c.category_id order by c.category_name,
p.price asc;


-- Write a query to find the category with the most expensive product using `GROUP BY` and `ORDER BY`.
select c.category_name, max(p.price) as highest_price 
from categories c inner join products p
on c.category_id = p.category_id
group by c.category_name order by highest_price desc limit 1;


-- How can you retrieve customers who have placed more than five orders using `GROUP BY` and `HAVING`?
select c.customer_name, count(o.order_id) as order_count 
from customers c inner join orders o
on c.customer_id = o.customer_id 
group by c.customer_name 
having count(o.order_id)>5;