-- Advance SQL

=================================================================   Constraints in SQL  ==============================================================================================

-- These are mainly 6-7 type of constraint in sql

1.NOT NULL

======================================================================   NOT NULL CONSTRAINTS IN SQL ================================================================================
-- Example 01 := 

  -- at creation time

CREATE table employee(
  emp_id number NOT NULL,
  emp_name varchar(30),
  emp_salary number
);


-- IF table is already created How to add assign Constraint to column:- 

alter table employee_ex
modify emp_salary number not null;


-- if table is created 

alter table employee_ex
add dept_id number not null;

insert into employee_ex values(1,'emp1',20000,1);

-- This line give en error 

insert into employee_ex (emp_id,emp_name,emp_salary)values(2,'emp1',10000);


Error starting at line : 25 in command -
insert into employee_ex (emp_id,emp_name,emp_salary)values(2,'emp1',10000)
Error report -
ORA-01400: cannot insert NULL into ("APPS"."EMPLOYEE_EX"."DEPT_ID")

=====================================================================  DEFAULT Constraint   =================================================================================



create table employee_ex(
emp_id number,
emp_name varchar(20),
emp_salary number DEFAULT 20000,
emp_bouns number

);

insert into employee_ex (emp_id,emp_name) values (101,'emp1');  -- that is not give Error.

select * from employee_ex;

-- if table is already created 
alter table employee_ex
add dept_id number DEFAULT 1;


-- -- IF table is already created How to add assign Constraint to column:- 
alter table employee_Ex
modify emp_bouns number DEFAULT 200;







