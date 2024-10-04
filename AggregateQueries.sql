create database practice;
use practice;

CREATE TABLE Customers (
    customerID INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    totalSpending DECIMAL(10, 2)
);

INSERT INTO Customers (CustomerID, Name, Email, City, TotalSpending)
VALUES
(1, 'Alice', 'alice@example.com', 'New York', 5000.00),
(2, 'Bob', 'bob@example.com', 'Los Angeles', 3000.00),
(3, 'Charlie', 'charlie@example.com', 'Chicago', 4000.00),
(4, 'David', 'david@example.com', 'Miami', 4500.00),
(5, 'Eve', 'eve@example.com', 'New York', 6000.00);


CREATE TABLE Orders (
    orderID INT PRIMARY KEY,
    customerID INT,
    orderDate DATE,
    totalAmount DECIMAL(10, 2),
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2023-09-01', 1000.00),
(2, 2, '2023-09-02', 750.00),
(3, 3, '2023-09-05', 1200.00),
(4, 4, '2023-09-07', NULL),
(5, 5, '2023-09-08', 800.00);


CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Widget A', 'Widgets', 50.00),
(2, 'Widget B', 'Widgets', 60.00),
(3, 'Gadget A', 'Gadgets', 75.00),
(4, 'Gadget B', 'Gadgets', 85.00),
(5, 'Gizmo A', 'Gizmos', 100.00);



CREATE TABLE OrderDetails (
    orderDetailID INT PRIMARY KEY,
    orderID INT,
	productID INT,
    quantity INT,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3),
(4, 3, 4, 4),
(5, 4, 5, 5);


CREATE TABLE Sales (
    saleID INT PRIMARY KEY,
    productID INT,
    orderID INT,
    saleDate DATE,
    saleAmount DECIMAL(10, 2),
    FOREIGN KEY (productID) REFERENCES Products(productID),
    FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

INSERT INTO Sales (SaleID, ProductID, OrderID, SaleDate, SaleAmount)
VALUES
(1, 1, 1, '2023-09-01', 100.00),
(2, 2, 2, '2023-09-05', 200.00),
(3, 3, 3, '2023-09-10', NULL),
(4, 4, 4, '2023-09-15', 150.00);


select * from Customers;
select * from Orders;
select * from Products;
select * from OrderDetails;
select * from Sales;


-- Write a SQL query to calculate the total number of orders placed by each customer. Include customers who have not placed any orders.
select c.name, count(o.orderID) as total_orders 
from Customers c left join Orders o 
on c.customerID = o.customerID 
group by c.name;


-- How would you find the average order value for all customers? Include orders with a total amount of NULL.
select c.name, avg(totalAmount) as averageOrderValue
from Customers c left join Orders o
on c.customerID= o.customerID
group by c.name;		


-- Construct a query to display the total sales for each product category, using the SUM function.
select p.category, sum(s.saleAmount) as totalSales from
Products p inner join Sales s on p.productID= s.productID
group by p.category;


-- Write a query to list the top 5 customers based on their total spending, showing their names and total amounts. 
select name as topCustomers, totalSpending from Customers 
order by totalSpending desc limit 5;


-- Count the number of orders placed each month including months with zero orders. 
select monthname(orderDate) as month, 
count(orderID) as orderCount
from Orders group by month;


-- Create a query that calculates the average quantity of products ordered per order. 
select p.productName, avg(o.quantity) as averageQuantity 
from Products p inner join OrderDetails o
on p.productID= o.productID
group by p.productName;


-- Write a query to find all customers who have placed orders, but their total order amount is null. 
select c.name from Customers c inner join Orders o
on c.customerID= o.customerID
where o.totalAmount is NULL;

 -- Construct a query to find the total quantity sold for each product, ordering the results by the total quantity in descending order.
select p.productName, sum(o.quantity) as totalQuantity
 from Products p inner join OrderDetails o 
 on p.productID= o.orderID 
group by p.productName order by totalQuantity desc;


-- Write a query to calculate the total sales amount for each month, including months where no sales occurred.
select monthname(saleDate) as month, 
sum(saleAmount) as totalSale from Sales group by month;


-- How would you find customers whose total spending is below the average spending of all customers?
select name, totalSpending from Customers 
where totalSpending < (
select avg(totalSpending) from Customers
);


-- Create a query to group orders by customer and count how many orders each customer has placed.
select c.name, count(o.orderID) as totalOrders 
from Customers c inner join Orders o
on c.customerID = o.customerID 
group by c.name;


-- Write a SQL query to show the total and average spending for each customer.
select name, totalSpending from Customers,
(select avg(totalSpending) as averageSpending from Customers);


-- Construct a query to find products that have been ordered more than a specific number of times, say 10.
select p.productName, sum(o.quantity) as quantityOrdered
from Products p inner join OrderDetails o 
on p.productID= o.productID
group by p.productName having quantityOrdered > 3;


-- Write a SQL query to find the total sales amount for orders that included a discount, using SUM.
select s.orderID, SUM(s.saleAmount) as TotalSaleAmount
from Sales s group by s.orderID having SUM(s.saleAmount) <
(select o.totalAmount from Orders o where o.orderID=s.orderID);


-- Create a query to count the total number of orders, including any with NULL values in the order amount.
select count(orderID) as totalOrders from Orders;


-- How would you group customers into categories based on their total spending (e.g., 'Low', 'Medium', 'High')?
select name, totalSpending, case
when totalSpending<4000 then 'Low'
when totalSpending between 4000 and 5000 then 'Medium'
else 'High'
end as spendingCategory
from Customers 
order by totalSpending;


-- Write a query to find customers who have not placed any orders in the last year, including those with NULL values for the last order date.
select c.name from Customers c 
left join orders o on c.customerID= o.customerID
where (o.orderDate is null or 
o.orderDate < curdate() - interval 1 year);


-- Construct a query to list products that have sold below the average quantity sold across all products.
select p.productName, o.quantity as QuantityPerProduct
from Products p inner join OrderDetails o 
on p.productID= o.productID group by p.productName 
having o.quantity < 
(select avg(o.quantity) as averageQuantity from OrderDetails o);


-- Write a query that groups orders by product and filters to show only those products with total sales exceeding a certain threshold.
select p.productName, sum(o.quantity) as totalOrders 
from Products p inner join OrderDetails o
on p.productID= o.productID
group by p.productName having sum(o.quantity) > 3;


-- Create a query to calculate both the total and average order amounts for all orders, including those with NULLs.
select sum(TotalAmount) as totalOrderAmount,
avg(TotalAmount) as AverageOrderAmount from Orders;