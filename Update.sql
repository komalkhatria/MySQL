USE ECommerceDB;

-- increase the price of the product with product_id = 3 by 10%.
UPDATE Products SET price = price*1.10 WHERE product_id=3;

-- update the quantity_in_stock for the product with product_id = 1. Reduce the stock by 15 units.
UPDATE Products SET quantity_in_stock= quantity_in_stock -15 WHERE product_id=1;

-- decrease the price of all products in the Clothing category by 10%.
UPDATE Products SET price= price*0.90 WHERE category="Clothing";

-- update the product name for product_id = 5 from "Backpack" to "Travel Backpack."
UPDATE Products SET product_name="Travel Backpack" WHERE product_id=5;

-- set the price of all products priced below $100 to a fixed value of $99.
UPDATE Products SET price=99 WHERE price<100;

-- set the quantity_in_stock for all products with quantity_in_stock less than 50 to 50 units.
UPDATE Products SET quantity_in_stock=50 WHERE quantity_in_stock<50;

-- verifying updates
SELECT * FROM products;


-- refer to Create_Insert.sql for the original Products table