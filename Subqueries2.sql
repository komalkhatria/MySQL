use subquery;

-- 1. Retrieve the name and salary of employees who have a salary greater than the average salary in the company.
select name, salary from Employees where salary > 
(select avg(salary) from employees);


-- 2. Find the employees who work in the department with the maximum number of employees.
select name from employees where department_id =
(select department_id
 from Employees group by department_id
order by count(*) desc limit 1);


 -- 3. Find the average salary for each department from the employees table.
 select department_id , avg(salary) from Employees group by
 department_id;
 
 
 -- 4. List the names of employees who have a salary greater than the salary of any employee in the HR department.
 select name from Employees where salary> 
 (select max(salary) from Employees e 
 inner join Departments d
 on e.department_id= d.department_id
 where d.department_name="HR");
 
 
 -- 5. Find the departments that have more than 3 employees whose salary is higher than the average salary of the department.
 select department_id from Employees where salary > 
 (select avg(salary) from Employees group by department_id);
 
 
 -- 6. Find the names of employees who are in the same department as the employee with id = 5.
 select name from Employees where department_id= 
 (select department_id from Employees where employee_id=5);
 
 
 -- 7. Find the names of employees and their salaries, and the highest salary in their department.
 select name, salary, (select max(salary) from Employees 
 where department_id= e.department_id) 
 as highest_salary_in_department
 from Employees e;
 
 
 -- 8. List the names of employees who work in any department with more than 5 employees.
 select name from Employees where department_id= 
 (select department_id from Employees group by department_id 
 having count(*) > 5);
 
 
 -- 9. Find the employees who do not work in a department that has any employee earning a salary greater than 80,000.
 select name, department_id from Employees
 where department_id not in 
 (select department_id from Employees where salary >80000);
 
 
 -- 10. Find all employees whose salary is higher than the average salary of employees in their own department, and who work in a department with more than 2 employees.
select name from employees e where salary >
(select avg(salary) from employees 
where e.department_id= department_id) 
and department_id=
(select department_id from Employees group by department_id
 having count(*) > 2);
 