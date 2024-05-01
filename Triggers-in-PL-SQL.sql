-- Triggers in PL/SQL

-- Trigger systax in PL/SQL

-- CREATE OR REPLACE TRIGGER TRIGGER_NAME
-- [BEFORE/AFTER/INSTEAD OF]
-- [INSERT/UPDATE/DELETE]
-- [OF COLUMN_NAME] Optional Part
-- ON TABLE_NAME
-- [REFERENCE OLD ASO NEW AS N] Optional Part
-- FOR EACH ROW -- IF THIS IS ROW LEVEL TRIGGER
-- BEGIN
-- END;


-- Example of ************************   BEFORE UPDATE ROW LEVEL TRIGGER  **************************************************************
create or replace trigger befer_update_row
before
update
on employee
for each row
begin
dbms_output.put_line('************Row Level - Before update Row level trigger *****************');
end;


-- Example of ******************************************************   After UPDATE ROW LEVEL TRIGGER  **************************************************************
create or replace trigger after_update_row
after
update
on employee
for each row
begin
dbms_output.put_line('************Row Level - After update Row level trigger *****************');
end;

-- Example of ******************************************************   before UPDATE STATEMENT LEVEL TRIGGER  **************************************************************
create or replace trigger before_update_statement 
before
update
on employee
begin
dbms_output.put_line('************statement Level - Before update statement level trigger *****************');
end;

-- Example of ******************************************************   AFTER UPDATE STATEMENT LEVEL TRIGGER  **************************************************************
create or replace trigger before_update_statement 
AFTER
update
on employee
begin
dbms_output.put_line('************statement Level - AFTER update statement level trigger *****************');
end;

-- Performing  Update operation on table
-- Like this : -
update employee
set emp_salary = 3000
where dept_name = 'HR';


-- ******************************************************************************     Instead of Trigger   ******************************************************************

-- How to create view in PL/SQL
-- Example 01: - 

-- Basic view
create or replace view view_name as
select col1 , col2 , col3 from table_name;

-- Complex View

create or replace view view_name as
select t1.col1 , t1.col2 , t2.col3 , t2.col1 , t2.col2
from table1 t1 , table2 t2
where t1.comman_col = t2.comman_col;


-- Eample 02 :-  Basic View 

create or replace view employee_view as
select emp_id,emp_name,emp_salary from employee;


-- ************************************************************ Perform DML operation on Basic View *******************************************************************************


begin
insert into employee_view values (109,'emp9',6500);
end;


-- Example of Complex view
-- Example 01: - 

create or replace view emp_view as
select e.emp_id,e.emp_name,e.emp_salary,e.dept_id,d.dept_name 
from employee e , department d
where e.dept_id = d.dept_id;

-- ******************************************** Performing DML operation on Complex View *******************************************
begin
insert into emp_view values (109,'emp9',3600,'Manager');
end;  
-- This Code give Error : - 
Error report -
-- ORA-01776: cannot modify more than one base table through a join view
-- ORA-06512: at line 2
-- 01776. 00000 -  "cannot modify more than one base table through a join view"
-- *Cause:    Columns belonging to more than one underlying table were either
--            inserted into or updated.
-- *Action:   Phrase the statement as two or more separate statements.


-- ****************************   Using Instead of Trigger to Performing DML Operation on Complex view ********************************************


select * from department;
select * from employee;

select * from emp_view;

create or replace view emp_view as
select e.emp_id,e.emp_name,e.emp_salary,e.dept_id,d.dept_name 
from employee e , department d
where e.dept_id = d.dept_id;


--Instead of Trigger
create or replace trigger Ist_of_update_tri 
INSTEAD of insert on emp_view
for each row

declare
i_count number := 0;
i_dept_id number;
i_emp_count number;


begin
select count(*) into i_emp_count from employee
where emp_id = :new.emp_id;

if i_emp_count > 0 then null;
else
insert into employee(emp_id,emp_name,emp_salary,dept_id) values (:new.emp_id,:new.emp_name,:new.emp_salary,:new.dept_id)
returning dept_id into i_dept_id;
dbms_output.put_line('Employee table inserted successfully!!');
end if;
select count(*)into i_count from department
where dept_id = i_dept_id;

select count(*)into i_count from department
where dept_id = :new.dept_id;

if i_count > 0 then null;
else
insert into department(dept_id,dept_name) values (:new.dept_id,:new.dept_name);
dbms_output.put_line('department table inserted successfully!!');
end if;
end;

insert into emp_view values(110,'emp10',1800,4,'Finance');


====================================================================== compound trigger in pl-sql ==================================================================================

--compund trigger un PL-SQL

create or replace trigger compound_emp_ex_tri1
for insert or update or delete
on employee_Ex
compound TRIGGER

before statement is
begin
dbms_output.put_line('****************  before statement compound trigger ******************');
end before statement;

before each row is
begin
dbms_output.put_line('****************  before row level compound trigger ******************');
end before each row;


after each row is
begin
dbms_output.put_line('****************  after row compound trigger ******************');
end after each row;

after statement is
begin
dbms_output.put_line('****************  after statement compound trigger ******************');
end after statement;

end compound_emp_ex_tri1;

delete from employee_ex
where emp_id = 101;


















