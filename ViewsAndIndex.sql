use joins2;
show tables;
select * from departments;
select * from employees;

-- VIEWS

-- Write a SQL statement to create a view named EmployeeSalary that contains the EmployeeID, EmployeeName, and Salary from the Employees table.
create view EmployeeSalary as
select employeeID, employeeName, salary from Employees;

select * from EmployeeSalary;


-- Create a view called EmployeeDepartment that shows the EmployeeName and DepartmentName by joining the Employees table and the Departments table on DepartmentID.
create view EmployeeDepartment as
select e.employeeName, d.departmentName from 
Employees e inner join Departments d
on e.departmentID= d.departmentID;

select * from EmployeeDepartment;


-- Write a SQL query to create a view named DepartmentAverageSalary that shows the DepartmentID and the average salary of employees in each department from the Employees table.
create view DepartmentAverageSalary as
select d.departmentID, avg(e.salary) as AverageSalary
from departments d inner join employees e 
group by e.departmentID;

select * from DepartmentAverageSalary;


-- Create a view named HighEarners that displays the EmployeeName, Salary, and HireDate for all employees earning more than $100,000.
create view HighEarners as
select employeeName, salary, hireDate from employees 
where salary > 100000;


-- Is it possible to update data in a view? If yes, explain when and how updates can be
-- performed on a view. If not, provide a valid reason.
-- Yes, it is possible to update data in a view which is created 
-- from only one table, but if the view is created using joins 
-- , then updating it is not possible.


-- Write a view that displays the EmployeeID, EmployeeName, and the Salary of employees whose salaries are above 70000.
create view EmployeeSalaries as
select employeeID, employeeName, salary from employees 
where salary > 70000;

select * from EmployeeSalaries;


-- Write the SQL query to drop the view named EmployeeSalary that was previously created.
drop view EmployeeSalary;


-- Create a view named EmployeeDetails that includes the following columns:
--  EmployeeID
--  EmployeeName
--  DepartmentName
--  ManagerName Use the Employees, Departments, and Managers tables.

create view EmployeeDetails as
select e.employeeID, e.employeeName, d.departmentName,
m.managerName from departments d inner join
employees e on e.departmentID= d.departmentID
inner join managers m 
on e.employeeID= m.employeeID;

select * from EmployeeDetails;



-- INDEXES

-- basic index creation
create index idx_employee_name on employees(employeeName);


-- composite index
create index idx_employee_department on 
employees(employeeID, departmentID);


-- unique index
create unique index idx_unique_employee_email on 
employees(email);


-- index usage
create index idx_employee_salary on 
employees(employeeID, salary);
-- this makes retrieval easy as directly indexes are checked instead of the whole data


-- dropping an index
drop index idx_employee_name on employees;


-- Index on a iew
-- generally we don't create index on views, 
-- but yes, index can be created on a view only if the view is a materialized view


-- Clustered Index vs Non-Clustered Index
-- There can be only one clustered index per table.
-- clustered index is useful mainly when we are searching on columns based on primary keys.
-- There can be only multiple non-clustered indexes per table.
-- non-clustered index is useful mainly when we are searching on columns other than primary key.


-- Covering Index
-- A covering index is a non-clustered index that includes all the columns required to satisfy a query, 
-- so the database can retrieve the data directly from the index without accessing the actual table. 


-- Index Maintenance
-- downsides of creating too many indexes in a database:
-- increased storage, slower operations, high maintenance, performance degradation for complex queries


-- Index Optimization
-- You have a query that joins two large tables, Orders and Customers, on the CustomerID field. 
-- What kind of index or indexes would you create to optimize this query?
-- We should consider creating indexes on the CustomerID column in both tables.
-- Because of faster join performance, reduced query execution time