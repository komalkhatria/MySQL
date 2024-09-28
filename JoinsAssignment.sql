create database Joins;
use Joins;

-- 1
select employees.name, departments.department_name 
from employees inner join departments 
ON employees.department_id=departments.id;

-- 2
select customers.customer_name, orders.id from customers
left join orders 
on customers.id=orders.customer_id;

-- 3
select products.product_name, categories.category_name 
from products inner join categories 
ON products.category_id=categories.id;

-- 4
select students.student_name, courses.course_name 
from students left join enrollments
ON students.id=enrollments.student_id
left join courses
ON enrollments.course_id=courses.id;

-- 5
select sales.*, customers.customer_name 
from sales left join customers
on sales.customer_id=customers.id;

-- 6
select orders.*, order_items.product_id, order_items.quantity,
products.product_name  from orders inner join order_items 
on orders.id=order_items.order_id 
inner join products on order_items.product_id= products.id;

-- 7
select books.*, authors.name from books left join authors
on books.author_id=authors.id;

-- 8
select projects.project_name, employees.name 
from projects left join project_assignments
on projects.id=project_assignments.project_id 
left join employees 
on project_assignments.employee_id= employees.id;

-- 9
select orders.*, customers.customer_name 
from orders inner join customers 
on orders.customer_id=customers.id 
where month(order_date)=12;

-- 10
select products.product_name from products 
left join order_items on products.id= order_items.product_id
where order_items.product_id is null;


-- 9
-- SELECT orders.*, customers.customer_name FROM orders
-- INNER JOIN customers ON orders.customer_id = customers.id
-- WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
-- AND order_date < CURDATE();