-- create database
CREATE DATABASE ECommerceDB;

-- use database
USE ECommerceDB;

-- create table
CREATE TABLE Products(
product_id int,
product_name varchar(100),
price decimal(10,2),
quantity_in_stock int,
category varchar(50));

-- describe table structure
DESC Products;

-- insert values in table
INSERT INTO Products
(product_id, product_name, price, quantity_in_stock, category)
VALUES
(1, "Smartphone", 699.99, 50, "Electronics"),
(2, "Wireless Headphones", 149.99, 120, "Electronics"),
(3, "Running Shoes", 89.50, 200, "Clothing"),
(4, "Laptop", 1099.00, 30, "Electronics"),
(5, "Backpack", 59.99, 150, "Accessories");

-- display all products
SELECT * FROM Products;