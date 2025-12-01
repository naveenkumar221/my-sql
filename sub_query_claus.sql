use practice;
select * from customers;
select * from departments;
select * from employees;
select * from orders;
select * from products;


-- Get all employees whose salary is greater than 50,000.  
select first_name, last_name from employees where salary > 40000;

-- Show all products in ascending order of price. 
select product_name, price from products order by price ASC;

-- Show top 5 highest-paid employees.
select first_name, salary  from employees order by salary DESC limit 3;

-- Get unique department names. 
select distinct dept_name  from departments;

-- Find customers whose names start with 'A'.
select customer_name from customers where customer_name like 'A%';

-- Find products priced between 100 and 500.
select product_name from products where price between 1000 and 5000;


-- Fetch employees who work in (HR, IT, Finance).
select e.first_name, d.dept_name from employees e join departments d
on e.dept_id = d.dept_id where d.dept_name IN ('HR', 'IT', 'Finance');


-- List customers whose subscription ends in 2025
select customer_name, subscription_end from customers
where year(subscription_end) = 2025;


-- Count employees in each department
select dept_id, count(*) as total_employees from employees
group by dept_id;


-- Total salary expense per department
select dept_id, sum(salary) as total_salary from employees
group by dept_id;

-- Subquery: Employees earning above average salary
select first_name, salary from employees 
where salary > (
select avg(salary) from employees );

-- Subquery: Departments of employees earning > 50k
select dept_id from employees
where salary > 50000;
-- or
select dept_name from departments where dept_id in (
select dept_id from employees where salary > 50000);


-- Subquery: Products priced higher than average price
select product_name, price from products
where price > (
    select avg(price) from products
);

-- Get product with the maximum price
select * from products
where price = (select max(price) from products);


-- Delete employees whose salary is below 30,000
delete from employees where salary < 30000;