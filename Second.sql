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

===========================================================



