use joins;
show tables;

create table employees(
employee_id int,
employee_name varchar(50),
department_id int,
manager_id int,
title varchar(50),
salary int);

insert into employees
(employee_id, employee_name, department_id, title, salary) 
values(1, "Alice", 1, "Manager", 90000);

insert into employees values
(2, "Bob", 1, 1, "Developer", 70000);

insert into employees values
(3, "Charlie", 2, 1, "Developer", 75000),
(4, "David", 2, 1, "Developer", 65000);

insert into employees
(employee_id, employee_name, department_id, title, salary) 
values(5, "Eve", 3, "Manager", 95000);

insert into employees values
(6, "Frank", 3, 5, "Developer", 60000);

insert into employees(employee_id, employee_name, title, salary) 
values(7, "Grace", "Intern", 40000);


create table departments(
department_id int,
department_name varchar(50));

insert into departments values
(1, "Sales"), (2, "Engineering"), (3, "Marketing"), (4, "HR");


create table projects(
project_id int,
project_name varchar(50));

insert into projects values
(1, "Project Alpha"), (2, "Project Beta"), (3, "Project Gamma");


create table projectAssignments
(assignment_id int, employee_id int, project_id int);

insert into projectAssignments values
(1, 2, 1),
(2, 3, 1),
(3, 4, 2),
(4, 5, 3),
(5, 6, 3);


select * from employees;
select * from departments;
select * from projects;
select * from projectAssignments;


-- Write a query to retrieve all employees and their corresponding department names using INNER JOIN.
select e.employee_id, e.employee_name, d. department_name
from employees e inner join departments d 
on e.department_id= d.department_id;


-- Write a query to get all departments and the employees in them, including departments with no employees using LEFT JOIN.
select d.department_name, e.employee_name from departments d 
left join employees e 
on d.department_id= e.department_id;

-- Write a query to list all employees and their managers, using a self-join.
select e.employee_name AS employee, m.employee_name AS manager 
from employees e left join employees m 
on e.manager_id = m.employee_id;

-- Write a query to retrieve all records from employees and their department names, using FULL OUTER JOIN.
select e.employee_name, d.department_name from 
employees e left join departments d 
on e.department_id= d.department_id
union
select e.employee_name, d.department_name from 
employees e right join departments d 
on e.department_id = d.department_id;

-- Write a query to count the number of employees in each department using GROUP BY with INNER JOIN.
select d.department_name, count(e.employee_id) as employee_count 
from departments d inner join employees e 
on d.department_id = e.department_id 
group by d.department_name; 

-- Write a query to find all employees who are not assigned to any project using a LEFT JOIN.
select e.employee_name from employees e left join 
projectAssignments p 
on e.employee_id=p.employee_id
where p.project_id is null;

-- Write a query to retrieve the names of employees and their respective department names, ordered by department name using INNER JOIN.
select e.employee_name, d.department_name from employees e
inner join departments d 
on e.department_id = d.department_id 
order by d.department_name;

-- Write a query to find all departments that do not have any employees using LEFT JOIN and WHERE clause.
select d.department_name from departments d left join 
employees e on d.department_id = e.department_id 
where e.employee_id is null;

-- Write a query to list all projects along with the number of employees assigned to each project using LEFT JOIN and GROUP BY.
select p.project_name, count(pa.employee_id) as employee_count 
from projects p left join projectAssignments pa 
on p.project_id= pa.project_id 
group by p.project_id;

-- Write a query to find employees who have the same manager using a self-join.
select e.employee_name as employee1, 
m.employee_name as employee2 from employees e
inner join employees m 
on e.manager_id= m.manager_id 
where e.employee_id<> m.employee_id;

-- Write a query to get the highest salary in each department using INNER JOIN and GROUP BY.
select d.department_name, max(e.salary) as highest_salary 
from departments d inner join employees e 
on d.department_id = e.department_id 
group by d.department_id;

-- Write a query to find all employees who work in the Sales department using INNER JOIN.
select e.employee_name from employees e inner join
departments d on e.department_id= d.department_id 
where d.department_name= "Sales";

-- Write a query to list all employees with their project names, showing employees without projects using LEFT JOIN.
select e.employee_name, p.project_name from
employees e left join projectAssignments pa 
on e.employee_id = pa.employee_id 
left join projects p 
on p.project_id=pa.project_id;

-- Write a query to find all projects that have been assigned to more than two employees using GROUP BY and HAVING.
select p.project_name from projects p
inner join projectAssignments pa 
on p.project_id= pa.project_id
group by p.project_name
having count(pa.employee_id)>2;


-- Write a query to retrieve employees and their department names, showing only employees with a specific title using INNER JOIN.
select e.employee_name, d.department_name from
employees e inner join departments d 
on e.department_id = d.department_id 
where e.title= "Manager";

-- Write a query to find employees who do not have any managers using LEFT JOIN.
select e.employee_name from employees e left join 
employees m on e.manager_id = m.employee_id 
where m.employee_id is null;

-- Write a query to get the total number of projects assigned to each employee using INNER JOIN and GROUP BY.
select e.employee_name, count(pa.project_id) as total_projects
from employees e inner join projectAssignments pa 
on e.employee_id = pa.employee_id 
group by e.employee_name;

-- Write a query to find departments with more than five employees using GROUP BY and HAVING.
select d.department_name from departments d 
inner join employees e 
on e.department_id= d.department_id 
group by d.department_name 
having count(e.employee_id)>5;









-- write a query to retrieve all products and their corresponding category names using 'INNER JOIN'
select p.product_id, p.product_name, c.category_name from products p 
inner join categories c 
on p.category_id = c.category_id;

-- How can you get all categories and the products in them, including categories with no products using 'LEFT JOIN'
select c.category_name, p.products_name from categories c 
left join products p 
on p.category_id = c.category_id;

-- customer_id customer_name referrer_id


