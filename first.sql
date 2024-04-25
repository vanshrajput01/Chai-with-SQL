-- How to create table using sql

CREATE TABLE EMPLOYEE
(
  EMP_ID INT PRIMARY KEY,
  EMP_NAME VARCHAR(20) NOT NULL,
  EMP_CITY VARCHAR(20) NOT NULL,
  EMP_SALARY INT NOT NULL
);

-- Insert data in table
INSERT INTO EMPLOYEE (EMP_ID,EMP_NAME,EMP_CITY,EMP_SALARY) VALUES (101,'Alice','Mumbai',14000);

INSERT INTO EMPLOYEE (EMP_ID,EMP_NAME,EMP_CITY,EMP_SALARY) VALUES (102,'Bob','Bengaluru',200000);

-- show table data


SELECT * FROM EMPLOYEE;  -- Use to select all data in table.

SELECT EMP_NAME,EMP_CITY FROM EMPLOYEE; 

-- Add column in exiting table

ALTER TABLE EMPLOYEE
ADD EMP_POISITION VARCHAR(50);

-- How to update table or set the value of this newly add column (EMP_POISITION)

UPDATE EMPLOYEE
SET EMP_POISITION = 'DEVELOPER'
WHERE EMP_ID = 101;

UPDATE EMPLOYEE
SET EMP_POISITION = 'PROGRAMMER'
WHERE EMP_ID = 102;

-- Who to handle null value in table

-- These are two way to handle null value

-- 1. NVL Function
-- 2. NVL2 Function

-- Example 01 : - 

select emp_name,emp_salary,emp_bonus,(emp_salary + nvl(emp_bonus,0))total_salary from employee_ex;


-- Example 02 :- 

select emp_name,emp_salary,emp_bonus,(emp_salary + nvl2(emp_bonus,emp_bonus,0))total_salary from employee_ex;

-- DISTINCT In sql :- used to find unique records

-- Example 01 :- 

select DISTINCT dept_id from employee;


--Aggregation function in Sql

--1. Count
--2. Sum
--3. Min
--4. Max
--5. Avg

-- Total Number of employee in company

select count(*) from employee;

--how to calculate max salary of employee table

select max(emp_salary) from employee;


--how to calculate min salary of employee table

select min(emp_salary) from employee;

--how to calculate avg salary of employee table

select avg(emp_salary) from employee;


-- How to total salary 
select sum(emp_salary) from employee;


================================================================ LIKE OR NOT LIKE   =======================================================================================

select * from employee_table
where employeename like 'John%';

select * from employee_table
where employeename like '%hn%';

select * from employee_table
where employeename like 'John Do_';

select * from employee_table
where employeename like '__hn Doe';


select * from employee_table
where employeename not like '%Doe';

select * from employee_table
where employeesalary like '6%'


========================================================================          IN , NOT IN         ============================================================================== 

select * from employee_table
where departmentname in ('HR','Marketing');

--departmentname in ('HR','Marketing')  means departmentname = 'HR' and departmentname = 'marketing'

select * from employee_table
where employeesalary in (50000,80000);

select * from employee_table
where employeename not in ('John Doe','Mike Johnson');


=========================================================================            Between in sql              ======================================================================
--Between means range 
select * from employee_table
where employeesalary BETWEEN 50000 and 80000;


========================================================================  Joins IN SQL   =========================================================================================

--INNER JOIN IN SQL

select e.emp_name,e.emp_salary,d.dept_name,d.dept_location 
from employee_ex e inner join department_ex d
on e.dept_id = d.dept_id;

--                   OR

select e.emp_name,e.emp_salary,d.dept_name,d.dept_location 
from employee_ex e join department_ex d
on e.dept_id = d.dept_id;

--LEFT JOININ SQL

select e.emp_name,e.emp_salary,d.dept_name,d.dept_location
from employee_ex e left join department_ex d
on e.dept_id = d.dept_id;

--RIGHT JOIN IN SQL.
select e.emp_name,e.emp_salary,d.dept_name,d.dept_location
from employee_ex e right join department_ex d
on e.dept_id = d.dept_id;

--FULL JOIN IN SQL.
SELECT e.emp_name,e.emp_salary,d.dept_name,d.dept_location 
from employee_ex e  FULL JOIN department_ex d
on e.dept_id = d.dept_id;



=========================================================================  UNION ALL AND UNION ===========================================================================


select * from employee_ex where dept_id in(1,3)
union all -- That give me duplicate record 
select * from employee_ex where dept_id in (2,3);


select * from employee_ex where dept_id in(1,3)
union 
select * from employee_ex where dept_id in (2,3);


===========================================================         Group by   ====================================================================================

-- Example 01 :- thata give me total number of employee in each department
  
  select count(emp_id),dept_id from employee
  group by dept_id;



  -- Example 02 :- 
select count(*) order_numbers,customer_id from orders
where order_date like '%23'
group by customer_id
order by order_numbers desc;


-- Example 03 :- if employee and department bothare different table.

-- select avg(emp_salary) avg_salary_of_dept ,dept_name from (select e.emp_name,e.emp_salary,e.dept_id,d.dept_name from employee e , department d
-- where e.dept_id = d.dept_id)
-- group by dept_name
-- order by avg_salary_of_dept desc;


OR

SELECT 
    dept_id,
    AVG(emp_salary) AS average_salary
FROM 
    employee
GROUP BY 
    dept_id
ORDER BY 
    average_salary DESC;


======================================================================================== NVL ================================================================================


-- NVL 
-- Exampple 01 :-  

select emp_name,emp_salary,nvl(emp_salary,0)null_handle from employee; 

================================================================================        NVL2         =============================================================================
-- example 01 :- 
select emp_name,emp_salary,nvl2(emp_salary,emp_salary,0)null2_handler from employee;

==============================================================================    DECODE  =====================================================================================
select emp_name,emp_salary,decode(emp_salary, '',10,10000,100,20000,200,12000,120,emp_salary)deummy_Salary from employee;


======================================================================= CASE =============================================================================================


-- Example 01 : =

select emp_name,emp_Salary ,case 
    		when emp_salary is null then 10
			when emp_salary > 10000 then 100
			else 10  
			end as case_salary from employee;






