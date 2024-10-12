create database subquery;
use subquery;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments (department_id, department_name)
VALUES
(101, 'HR'),
(102, 'Sales'),
(103, 'IT');

INSERT INTO Employees (employee_id, name, salary, department_id)
VALUES
(1, 'John', 50000, 101),
(2, 'Jane', 60000, 102),
(3, 'Michael', 70000, 101),
(4, 'Emily', 55000, 103),
(5, 'Daniel', 80000, 101);

select * from Departments;
select * from Employees;

-- 1. Find the employees who have a salary greater than the average salary of all employees.
select name, salary from employees where salary > 
(select avg(salary) from employees);


-- 2. Find the names of employees who work in departments with department_id 101 or 102.
select name from employees where department_id IN 
(select department_id from Departments where 
department_id IN (101, 102));


-- 3. Find employees who belong to departments that have at least one employee with a salary greater than 60000.
select name from Employees e where exists 
(select 1 from Employees where 
department_id= e.department_id
and salary >60000);


-- 4. Display the name and salary of each employee, along with the average salary in their department.
select e.name, e.salary, (select avg(salary) from Employees 
where department_id= e.department_id) as avg_department_salary
from Employees e;


-- 5. Find the names of employees and the names of their departments, where their salary is greater than the average salary in their department.
select e.name as employee_name, 
d.department_name as department_name from Employees e 
inner join Departments d 
on e.department_id= d.department_id where e.salary>
(select avg(salary) from Employees 
where department_id= e.department_id);


-- 6. Find employees whose salary is greater than the average salary of their own department.
select name from employees e where salary >
(select avg(salary) from employees 
where department_id=e.department_id);


-- PRACTICE EXERCISES

-- 1. Write a query that finds all employees who earn the highest salary in the company.
select name, salary as highestSalary from Employees 
where salary= (select max(salary) from Employees);


-- 2. Find the department with the highest number of employees.
SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY num_employees DESC
LIMIT 1;


-- 3. Find the employees who do not belong to department 102.
select name from Employees
where department_id not in(select department_id from Departments 
where department_id= 102);


-- 4. Write a query to list all departments that have more than one employee.
select department_name from Departments d
where d.department_id= (select department_id from employees group by department_id
having count(*) >1);


-- 5. Find employees whose salary is between the average salary and the highest salary in the company.
SELECT name, salary
FROM Employees
WHERE salary BETWEEN (SELECT AVG(salary) FROM Employees) AND (SELECT MAX(salary) FROM Employees);