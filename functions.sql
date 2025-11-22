create database practice;
use practice;
CREATE TABLE departments (
dept_id int primary key,
dept_name varchar(100)
); 

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    phone VARCHAR(20),
    join_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Naveen', 'Kumar', 45000, '9876543210', '2023-04-10', 1),
(102, 'Rohan', 'Sharma', 52000, NULL, '2022-12-05', 1),
(103, 'Priya', 'Mehta', 30000, '9871234567', '2024-01-22', 2),
(104, 'Akash', 'Verma', 28000, '9123456780', '2023-11-11', 3),
(105, 'Rita', 'Singh', 60000, NULL, '2021-07-15', 4),
(106, 'Amit', 'Patil', 35000, '9988776655', '2023-05-06', 5),
(107, 'Neha', 'Gupta', 75000, '9090909090', '2022-09-19', 1),
(108, 'Kiran', 'Das', 40000, NULL, '2023-06-25', 5);



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    subscription_end DATE
);

INSERT INTO customers VALUES
(1, 'Arjun Rao', '2025-01-15'),
(2, 'Sneha Reddy', '2024-12-30'),
(3, 'Michael Lee', '2025-03-10'),
(4, 'Sara Khan', '2024-11-25'),
(5, 'John Paul', '2025-02-18');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(201, 'Laptop Pro Max', 89999.99),
(202, 'Wireless Mouse', 799.50),
(203, 'Mechanical Keyboard', 3499.00),
(204, 'USB-C Cable', 299.99),
(205, 'Noise Cancelling Headphones', 14999.00);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(501, 1, 201, '2024-10-01', 1),
(502, 2, 202, '2024-11-15', 2),
(503, 3, 205, '2024-12-05', 1),
(504, 1, 204, '2024-12-20', 3),
(505, 4, 203, '2024-10-30', 1),
(506, 5, 202, '2024-11-05', 4);


show tables;

desc employees; 
select * from customers;
select * from departments;
select * from employees;
select * from ordes;
select * from products;


-- Find the total salary of all employees.
select sum(salary) as total_salry from employees;

-- Find the average salary in the IT department 
select avg(salary) as av_salary_it from employees where dept_id=1;
 
 
 -- Count how many employees have a phone number
 select count(phone) as phone_number from employees;
 
 -- Get highest salary
 select max(salary) as maximum_salary from employees;
 
-- Lowest product price 
select min(price) as minum_price from products;


-- Show all employee names in uppercase
select upper(first_name) as name_upper from employees;

-- Combine first name + last name
select concat(first_name,' ', last_name) as full_name from employees;

-- Get names containing 'a'
select first_name from employees where first_name like '%a%';

-- Length of each customer name
select customer_name, length(customer_name) as name_length from customers;


-- Replace spaces with hyphens in product names
select product_name,replace(product_name, ' ','_') from products;


-- Find employees who joined in 2023
select first_name,join_date from employees 
where year(join_date)=2023;

-- Show current date and time
select now();


-- Extract month name from order_date 
select order_id, monthname(order_id) as month_name from orders;


-- Orders in last 30 days
select * from orders
where order_date >= curdate() - interval 30 day;

-- Round product price to 2 decimals
select product_name,round(price,2) as rounded_price from products;

-- Next highest integer of price
select product_name, ceil(price) as ceil_price
from products;


-- Remainder when quantity is divided by 5
select order_id, mod(quantity, 5) as remainder from orders;


-- Replace NULL salary with 0
select first_name, ifnull(phone, 'No Phone') as phone_status from employees;


-- Salary category using CASE
select first_name, salary,
case 
    when salary > 50000 then 'High'
    when salary between 30000 and 50000 then 'Medium'
    else 'Low'
end as salary_category
from employees;


-- Show employees whose salary is greater than the average salary
select first_name, salary from employees
where salary > (select avg(salary) from employees);

-- Display employee name and number of characters in the full name
select concat(first_name,' ',last_name) as full_name,
length(concat(first_name,' ',last_name)) as name_length
from employees;

-- Extract year, month, and day from join_date
select first_name,
year(join_date) as join_year,
month(join_date) as join_month,
day(join_date) as join_day from employees;


-- Show products with prices rounded to nearest integer
select product_name, round(price) as round_price from products;

-- Display the order date + 10 days
select order_id, order_date, date_add(order_date, interval 10 day) as delivery_date from orders;


-- Convert product name to lowercase
select product_name, lower(product_name) as lower_name from products;

-- Show month name and year for each order
select order_id, monthname(order_date) as month_name,
year(order_date) as order_year from orders;


-- Find total quantity of products ordered
select sum(quantity) as total_quantity from orders;


-- Find employee with the longest name
select concat(first_name, ' ', last_name) as full_name,
       length(CONCAT(first_name, ' ', last_name)) As len
from employees
order by len desc
limit 1;




