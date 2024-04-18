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

create or replace view view_name as
select t1.col1 , t1.col2 , t2.col3 , t2.col1 , t2.col2
from table1 t1 , table2 t2
where t1.comman_col = t2.comman_col;












