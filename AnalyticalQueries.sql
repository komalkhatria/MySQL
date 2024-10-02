create database joins2;
use joins2;

create table Customers(
customerID int primary key,
customerName varchar(50),
email varchar(50));

create table Orders(
orderID int primary key,
customerID int,
orderDate date,
totalAmount decimal(10,2),
shippingDate date,
foreign key(customerID) references Customers(customerID));

create table Products(
productID int primary key,
productName varchar(50),
price decimal(10,2),
categoryID int);

create table Sales(
saleID int primary key,
productID int,
saleDate date,
quantity int,
foreign key(productID) references Products(productID));

create table Employees(
employeeID int primary key,
employeeName varchar(100),
salary int,
departmentID int,
managerID int);

create table Departments(
departmentID int primary key,
departmentName varchar(50));

create table ProductReviews(
productID int primary key,
rating float);


INSERT INTO Customers (customerID, customerName, email)
VALUES 
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Bob Brown', 'bob@example.com');


INSERT INTO Orders (orderID, customerID, orderDate, totalAmount, shippingDate)
VALUES 
(101, 1, '2023-09-01', 150.00, '2023-09-02'),
(102, 2, '2023-09-05', 200.00, NULL),
(103, 1, '2023-09-10', 75.00, '2023-09-12'),
(104, 3, '2023-09-15', 100.00, '2023-09-16');


INSERT INTO Products (productID, productName, price, categoryID)
VALUES 
(1, 'Laptop', 1000.00, 1),
(2, 'Smartphone', 500.00, 1),
(3, 'Desk Chair', 150.00, 2),
(4, 'Monitor', 300.00, 1);


INSERT INTO Sales (saleID, productID, saleDate, quantity)
VALUES 
(1, 1, '2023-09-05', 2),
(2, 2, '2023-09-07', 5),
(3, 3, '2023-09-08', 10),
(4, 4, '2023-09-10', 3);


INSERT INTO Employees (employeeID, employeeName, salary, departmentID, managerID)
VALUES 
(1, 'Sarah Connor', 70000, 1, NULL),
(2, 'Kyle Reese', 60000, 1, 1),
(3, 'John Connor', 80000, 2, NULL),
(4, 'Linda Hamilton', 55000, 2, 3);


INSERT INTO Departments (departmentID, departmentName)
VALUES 
(1, 'IT'),
(2, 'HR');


INSERT INTO ProductReviews (productID, rating)
VALUES 
(1, 4.5),
(2, 4.0),
(3, NULL),
(4, 5.0);



select * from Customers;
select * from Orders;
select * from Products;
select * from Sales;
select * from Employees;
select * from Departments;
select * from ProductReviews;



-- Find the total sales amount for each product in the Sales table.
select p.productName, (s.quantity * p.price) as totalSales 
from products p left join sales s
on p.productID = s.productID 
group by p.productName;


-- Find the average salary of employees in each department from the Employees table.
select d.departmentName, avg(e.salary) as averageSalary 
from departments d left join employees e 
on d.departmentID= e.departmentID
group by d.departmentName;


-- Count the number of orders in the Orders table where the ShippingDate is NULL.
select count(orderID) as notShipped from orders
where shippingDate is null;


-- Find the minimum price of products in the Products table for each category.
select categoryID, MIN(price) as minimumPrice 
from Products group by categoryID;


-- List the top 5 highest-paid employees from the Employees table.
select employeeName as highestPaid, salary from Employees 
order by salary desc limit 5;


-- Find the total number of customers and the average order value from the Orders table.
select count(distinct(customerID)) as totalCustomers ,
avg(totalAmount) as averageOrderValue from Orders;


-- Find the total sales for each product by year from the Sales table.
select productID, year(saleDate) as saleYear,
sum(quantity) as totalSales
from Sales group by productID, saleYear;


-- Find all departments with more than 5 employees from the Departments table.
select d.departmentName from Departments d 
inner join Employees e on d.departmentID= e.departmentID
group by d.departmentName having count(e.employeeID)>5; 


-- Calculate the average rating of products from the ProductReviews table, excluding NULL ratings.
select avg(rating) as averageRating from ProductReviews
where rating is not null;


-- Find the department with the highest average salary from the Employees table.
select d.departmentName, avg(e.salary) as highestAverageSalary
from Departments d inner join Employees e
on e.departmentID = d.departmentID group by d.departmentName
order by highestAverageSalary desc limit 1;
