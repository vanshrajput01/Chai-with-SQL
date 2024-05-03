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


============================================================================  unique Constraint =================================================================================

create table employee_Ex(
emp_id number unique,
emp_name varchar(20)
);

insert into employee_ex values (101,'emp1');
 
insert into employee_ex values (101,'emp1');

-- Error in this line
Error starting at line : 6 in command -
insert into employee_ex values (101,'emp1')
Error report -
ORA-00001: unique constraint (APPS.SYS_C001769546) violated


-- if table is already created but add column with unique Constraint

alter table employee_Ex
add dept_id number unique;

create table employee_Ex(
emp_id number unique,
emp_name varchar(20),
dept_id number
);

-- how to add constraint if column is already created


alter table employee_Ex
modify dept_id unique;

====================================================================        Check constraint ===================================================================================
--check Constraint in sql
  
create table employee_Ex(
emp_id number primary key,
emp_name varchar(20),
emp_age number CHECK (emp_age > 18)
);

insert into employee_Ex values (101,'emp01',19);
-- Error table 
insert into employee_Ex values (102,'emp02',18);

-- Error starting at line : 10 in command -
insert into employee_Ex values (102,'emp02',18)
Error report -
ORA-02290: check constraint (APPS.SYS_C001769550) violated

alter table employee_Ex
add emp_gender char(1) check (emp_gender = 'M' or emp_gender = 'F');

insert into employee_Ex (emp_id,emp_name,emp_age,emp_gender)values (102,'emp02',20,'M');

insert into employee_Ex (emp_id,emp_name,emp_age,emp_gender)values (103,'emp03',20,'F');

insert into employee_Ex (emp_id,emp_name,emp_age,emp_gender)values (104,'emp04',20,'S');

-- Error is 
Error starting at line : 24 in command -
insert into employee_Ex (emp_id,emp_name,emp_age,emp_gender)values (104,'emp04',20,'S')
Error report -
ORA-02290: check constraint (APPS.SYS_C001769553) violated








