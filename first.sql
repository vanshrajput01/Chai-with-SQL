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





