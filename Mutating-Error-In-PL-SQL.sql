-- Mutating Error in Triggers 

--Example 01 : - 
-- this is not example of mutating Error in Cursor.


create or replace trigger bef_update_emp_trigger
before
update
on employee
for each row

declare

max_salary number := 30000;

begin
if :new.emp_salary >= max_salary then
dbms_output.put_line('You can not assign the salary.');
RAISE_APPLICATION_ERROR(-20100, 'You can not assign this salary to this employee');
else
dbms_output.put_line('You are assign the salary success fully.');
end if;
end;

update employee
set emp_salary = 550000
where emp_id = 103;

-- **************************************         That Raise Error like **************************************************************************

Error starting at line : 26 in command -
update employee
set emp_salary = 550000
where emp_id = 103
Error report -
ORA-20100: You can not assign this salary to this employee
ORA-06512: at "APPS.BEF_UPDATE_EMP_TRIGGER", line 8
ORA-04088: error during execution of trigger 'APPS.BEF_UPDATE_EMP_TRIGGER'


-- Here Not give Error ok
update employee
set emp_salary = 3000
where emp_id = 103;

-- Mutating Error in Triggers 

--Example 02 : - 
-- ******************************                     Mutating Error in Triggers ********************************************************
 

create or replace trigger bef_update_emp_trigger
before
update
on employee
for each row

declare

max_salary number;

begin

select emp_salary into max_salary 
from employee
where emp_salary = 500000;

if :new.emp_salary >= max_salary then
dbms_output.put_line('You can not assign the salary.');
RAISE_APPLICATION_ERROR(-20100, 'You can not assign this salary to this employee');
else
dbms_output.put_line('You are assign the salary success fully.');
end if;
end;


-- Here i am update min salary of this employee but this code give an Error 
update employee
set emp_salary = 3000
where emp_id = 103;


-- Error is : -

Error starting at line : 31 in command -
update employee
set emp_salary = 3000
where emp_id = 103
Error report -
ORA-04091: table APPS.EMPLOYEE is mutating, trigger/function may not see it
ORA-06512: at "APPS.BEF_UPDATE_EMP_TRIGGER", line 7
ORA-04088: error during execution of trigger 'APPS.BEF_UPDATE_EMP_TRIGGER'


 -- ***************************************************              This is Example of # Mutating Error      ******************************************************








