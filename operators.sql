use navee;
show tables;
select * from emp;
select * from dept;

-- 1 Display all employees with their salary increased by 500.
select ename,sal as original_sal, sal+500 as increased_sal from emp;

-- Show employee name, original salary, and double of salary.
select ename, sal as original_sal, sal*2 as double_of_sal from emp;

-- Find employees whose commission is more than 10% of their salary.
select ename,comm from emp where comm>0.1*sal;

-- Display employees whose annual salary (sal * 12) is greater than 30000.
select ename, sal, sal*12 as annual_salary from emp where sal*12>30000;

-- Show employee name, job, and net income (salary + commission).
select ename,job,sal + ifnull(comm, 0) AS net_income from emp;

-- List all employees whose salary is equal to 3000.
select ename,sal from emp where sal=3000;

-- Find employees who earn more than 2500.
select ename,sal from emp where sal>2500;


-- Display employees whose salary is between 1000 and 2000.
select ename, sal from emp where sal between 1000 and 2000;

-- Show employees whose job is 'MANAGER'.
select ename,sal,job from emp where job='manager';

-- List employees who were hired after 01-JAN-1981.
select ename, sal,hiredate from emp where hiredate> '1981-01-01';

-- Show employees whose job is 'CLERK' and salary is less than 1500.
select ename,job,sal from emp where job='clerk' and sal<1500;

-- Find employees who are either 'SALESMAN' or 'CLERK'.
select ename,job from emp where job='salesman' or 'clerk';

-- Display employees whose salary is between 1000 and 2000 and work in department 30.
select ename,sal from emp where sal between 1000 and 2000 and deptno=30;

-- Find employees who are not managers.
select ename,job from emp where job <> 'manager';

-- List employees who do not have any commission.
select ename,sal, comm from emp where comm is null;

-- Show employees whose hiredate is between '1981-01-01' and '1981-12-31'.
select ename,hiredate from emp where hiredate between '1981-01-01' and '1981-12-31';


-- List employees working in department numbers 10, 20, or 30 using IN.
select ename,job,deptno from emp where deptno in(10,20,30);

-- Find employees whose name starts with 'S'.
select ename,job from emp where ename like "s%";

-- Find employees whose name ends with 'N'.
select ename,job from emp where ename like '%n';

-- List employees whose name contains the letter 'A'.
select ename, job from emp where ename like '%a%';

-- Show employees who don't have a manager (mgr is NULL).
select ename,job,mgr from emp where mgr is null;

-- List employees who have not been given commission.
select ename,job,comm from emp where comm is null or comm=0;

-- Display employees who have a commission assigned (IS NOT NULL).
select ename,job,comm from emp where comm is not null;

-- Find employees with NULL salary (hypothetical; will return none).
select ename from emp where sal is null;

-- Check which departments have NULL location (if any).
select deptno,loc from dept where loc is null;

-- Find employees whose job starts with ‘M’.
select ename,job from emp where job like 'm%';

-- Show employees whose names are exactly 5 characters long.
select ename from emp where length(ename)=5;

-- List employees whose job ends with 'MAN'.
select ename,job from emp where job like '%man';

-- List employees whose name ends with 's'.
select ename,job from emp where ename like '%s';

-- Find all employees whose name contains 'AA's.
select ename, job from emp where ename like '%AA%';

-- Display employees whose name starts with 'S' and ends with 'H'.
select ename,job from emp where ename like 's%h';

-- List all employees and show a bonus of 15% on their salary.
select ename,sal, sal*0.15 as bonus from emp;

-- Display employee salary in INR assuming 1 USD = 83 INR.(given in USD)
select ename,sal, sal*83 as sal_in_inr from emp;

-- Show commission-to-salary ratio of all salesmen.
select ename, comm/sal as comm_sal_ratio from emp where job = 'salesman';

-- Show employee name with their monthly and yearly salaries.
select ename, sal as month_sal, sal*12 as yearly_sal from emp;

-- Find employees whose salary is more than 1500 and who were hired in 1981.
select ename,sal,hiredate from emp where sal>1500 and  year(hiredate) = '1981';

-- Show employees whose job is not 'CLERK' and whose salary is greater than 2000.
select ename,job,sal from emp where job<>'clerk' and sal>2000;

-- List employees who have commission but earn less than 2000 salary.
select ename, sal, comm from emp where comm is not null and sal < 2000;

-- Find employees hired after 1981
select ename,hiredate,job,sal  from emp where year(hiredate)>1981;

-- List employees whose department is 10 ,20.
select ename,deptno,job,sal from emp where deptno in (10,20);

