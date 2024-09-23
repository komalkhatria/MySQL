use company;
create table products(
product_id int primary key,
product_name varchar(50) not null,
bar_code int unique,
mfg_date date default ('2024-05-01'),
price decimal(10,2) check(price>99)
);

insert into products values(101, "cookies", 2987659, '2024-08-12', 150);

insert into products (product_id, bar_code, price) values(102, 27798659, 150);
insert into products (product_id, product_name, bar_code, price) values(103, "bread", 243569, 150);

select * from products;

insert into products (product_id, product_name, bar_code, price) values(104, "chocolate", 24789, 250);

insert into products (product_id, bar_code, price) values(105, 809789, 200); 

select * from products where price>100;
select * from products where product_name is null;
