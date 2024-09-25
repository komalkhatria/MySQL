-- use database
USE ECommerceDB;

-- SELECT USED TO RETRIEVE DATA
-- display all products from the Products table.
SELECT * FROM Products;

-- WHERE USED FOR CONDITION/ FILTERING DATA
-- display all products from the Electronics category.
SELECT * FROM Products WHERE category = "Electronics";

-- BETWEEN USED FOR RANGE
-- Write a query to find all products priced between $100 and $800.
SELECT * FROM Products WHERE price BETWEEN 100 and 800;

-- ORDER BY USED FOR SORTING RESULTS
-- display all products, sorted by price in descending order
SELECT * FROM Products ORDER BY price desc;

-- retrieve all products with quantity_in_stock less than 100.
SELECT * FROM Products WHERE quantity_in_stock<100;

-- UPDATE USED TO MODIFY EXISTING DATA
-- update the quantity_in_stock for the product with product_id = 1. Assume 5 new units were added to the stock.
UPDATE Products SET quantity_in_stock= quantity_in_stock+5 WHERE product_id=1;

-- Increase the price of all products in the Accessories category by 10%.
UPDATE Products SET price= price*0.10 WHERE category="Accessories";

