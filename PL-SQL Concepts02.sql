-- PL/SQL Concepts

-- Anonymous Block in PL-SQL
-- These are two type of Anonymous Block in PLS/SQL

-- 01. Static Anonymous Block :- 
-- Example 01 :- 
declare
v_num1 number:= 10;
v_num2 number:= 20;
v_total number;
begin
v_total := v_num1 + v_num2;
dbms_output.put_line(v_total);

exception 
when others then
dbms_output.put_line('Error' || SQLERRM);
end;


-- 02. Dynamic Anonymous Block

-- Example 01 :-

declare
v_num1 number := :value1; --Bind Variable
v_num2 number := :value2;  --Bind Variable
v_total number;
begin
v_total := v_num1+ v_num2;
dbms_output.put_line(v_total);
exception
when others then
dbms_output.put_line('Error' || SQLERRM);
end;

-- ****************************************************************                    INTO Statement in PL/SQL          ************************************************************
-- Example 01 :---

declare
v_emp_id number; -- declare variable if table column data is kown .
v_emp_name varchar(20);
v_emp_salary number;
begin
select emp_id,emp_name,emp_salary into v_emp_id,v_emp_name,v_emp_salary
from employee
where emp_id = :employee_id;-- employee_id is bind variable. value is assign to bind variable at run time.
DBMS_OUTPUT.put_line('Employee details is :- '||v_emp_id || ' ' || v_emp_name || ' ' || v_emp_salary);
exception
when others then
dbms_output.put_line('Error' || SQLERRM);
end;

-- =========================================================================    %TYPE in PL/SQL  ========================================================================================

-- synatax of %Type

-- your_varibale_name table_name.column_name%type;

-- Example 01 :- 

declare
v_emp_name employee.emp_name%type;
v_emp_salary employee.emp_salary%type;
begin
select emp_name,emp_salary into v_emp_name,v_emp_salary
from employee
where emp_id = :employee_id;
dbms_output.put_line('employee details is : '||v_emp_name || ' ' ||v_emp_salary);
exception
when others then
dbms_output.put_line('Error is : ' || SQLERRM);
end;

-- Example 02 :- 
declare
v_dept_id department.dept_id%type;
v_dept_name department.dept_name%type;
v_dept_location department.dept_location%type;
begin
select dept_id,dept_name,dept_location into v_dept_id,v_dept_name,v_dept_location
from department
where dept_id = :department_no;
dbms_output.put_line('Department details is : '|| v_dept_id || ' ' || v_dept_name || ' ' ||v_dept_location);
exception
when others then 
dbms_output.put_line('Error is : '||SQLERRM );
end;


=================================================================  %rowtype     =================================================================================================

declare
emp employee%rowtype;
begin
select emp_name,emp_salary into emp.emp_name,emp.emp_salary
from employee
where emp_id = :employee_no;
dbms_output.put_line('Employee details is : '|| emp.emp_name || ' ' ||emp.emp_salary);
exception
when others then
dbms_output.put_line('Error is : '||SQLERRM);
end;


-- Example := 02

declare
dept department%rowtype;
begin
select dept_name,dept_location into dept.dept_name,dept.dept_location
from department
where dept_id = :department_no;
dbms_output.put_line('Department details is : '|| dept.dept_name || ' ' ||dept.dept_location);

exception
when others then
dbms_output.put_line('Error'|| SQLERRM);
end;


====================================================================  RECORD DATA TYPE IN PL/SQL ===================================================================================

Example 01 := 
--Record Data type in PL/SQL

declare
type emp_record is record(
v_emp_name varchar(20),
v_emp_salary number
);    -- Here declare record data type;

er emp_record;
begin
select emp_name,emp_salary into er.v_emp_name,er.v_emp_salary
from employee
where emp_id = :employee_no;
dbms_output.put_line('Employee details is : '|| er.v_emp_name || ' ' || er.v_emp_salary);
exception
when others then
dbms_output.put_line('Error'|| SQLERRM);
end;

-- Example 02 : - 
declare
type dept_cur is record(
v_dept_name department.dept_name%type,
v_dept_loc department.dept_location%type
);

dc dept_cur;
begin
select dept_name,dept_location into dc.v_dept_name,dc.v_dept_loc 
from department
where dept_id = :dept_no; 
dbms_output.put_line('Department details :- ' || dc.v_dept_name || ' ' ||dc.v_dept_loc);

exception
when others then
dbms_output.put_line('Error is :- '|| SQLERRM);
end;


===================================================================   IF ELSE STATEMENT ============================================================================================

--IF END
declare
v_age number := :your_age;
begin

IF v_age < 18 then
dbms_output.put_line('You age is not valid for driving');
else
dbms_output.put_line('You are is valid for driving');
end if;
exception when others then
dbms_output.put_line('Error' || SQLERRM);
end;



=================================================================================          IF-ELSIF-ELSE           =======================================================================
--Example01 : -  

declare
v_age number:= :your_age;
begin
if v_age >= 1 and v_age < 18 then
dbms_output.put_line('You are child.');
elsif v_age > 18 and v_age < 55 then
dbms_output.put_line('You are Young.');
elsif v_age > 55 then
dbms_output.put_line('You are old.');
else
dbms_output.put_line('Oo,Enter your vaild age.');
end if;
exception
when others then
dbms_output.put_line('Error '|| SQLERRM);
end;


-- Example 02 :- 

declare
v_grade CHAR := :your_grade;
begin
if v_grade = 'A' then
dbms_output.put_line('Excellent');
elsif v_grade = 'B' then
dbms_output.put_line('Very Good');
elsif v_grade = 'C' then
dbms_output.put_line('Good');
elsif v_grade = 'D' then
dbms_output.put_line('Not Bad');
else
dbms_output.put_line('Enter your valid grade.');
end if;
exception
when others then
dbms_output.put_line('Error : '||SQLERRM);
end;


=====================================================================================  LOOPS IN PL-SQL ==============================================================================

--Loops in PL/SQL

--1. LOOP

declare
v_table number := :table_no;
i number := 1;
v_result number;
begin
loop
v_result := v_table * i;
exit when i = 11; 
dbms_output.put_line(v_result);
i := i +1;
end loop;
exception
when others then
dbms_output.put_line('ERROR '|| SQLERRM);
end;

====================================================================      FOR LOOP =============================================================================
-- Example 01 :- 

declare
i number;
begin
for i in 1..10 loop
dbms_output.put_line(i);
end loop;
exception
when others then
dbms_output.put_line('Error : '||SQLERRM);
end;

-- Example 02 : -

declare
v_table number := :table_no;
i number;
begin
for i in 1..10 loop
dbms_output.put_line(v_table * i);
end loop;
exception
when others then 
dbms_output.put_line('Error '|| SQLERRM);
end;


===============================================================   WHILE LOOP =============================================================================================

-- While in sql
declare
v_result number;
v_table number := :table_no;
i number := 1;
begin
while i <= 10 loop
v_result := v_table * i;
dbms_output.put_line(v_result);
i := i + 1;
end loop;
exception 
when others then
dbms_output.put_line('Error' || SQLERRM);
end;


==========================================================================  Continue statement in PL-SQL ==============================================================================

--Example 01:- 
declare
i number := 1;
BEGIN
while i <= 10 loop
i := i+1;
if i = 3 then
CONTINUE;
end if;
dbms_output.put_line(i);
end loop;
EXCEPTION
when others then
dbms_output.put_line('Error'|| SQLERRM);
END;


========================================================================   GOTO STATEMENT =========================================================================

declare
i number;
begin
for i in 1..10 loop
dbms_output.put_line(i);
if i = 3 then
goto jump; 
elsif i = 7 then
goto hello;
dbms_output.put_line(i);
end if;
end loop;

<<jump>>
dbms_output.put_line('i am 3');

<<hello>>
dbms_output.put_line('i am 7');

exception when others then
dbms_output.put_line('Error:' || SQLERRM);
end;


================================================================   Explict cursor =======================================================================================

--open fetch close


declare
v_emp_name varchar(20);
cursor c1 is
select emp_name from employee;
begin
open c1;
loop
fetch c1 into v_emp_name;
exit when c1%notfound;
dbms_output.put_line(v_emp_name);
end loop;
close c1;

exception
when others then
dbms_output.put_line('Error '|| SQLERRM);
end;

--Example 02:- 
============================================================================  perform update operation using cursor ===============================================================

declare
cursor c1 is
select * from employee;
begin
for i in c1 loop
if i.emp_salary < 2500 then
update employee
set creation_date = '01-04-24'
where emp_id = i.emp_id;
dbms_output.put_line(i.emp_name || ' Employee modify succcess fully.');
end if;
if i.emp_salary >= 2500 then
update employee
set creation_date = '04-02-24'
where emp_id = i.emp_id;
dbms_output.put_line(i.emp_name || ' Employee modify succcess fully.');
end if;
end loop;

exception 
when others then
dbms_output.put_line('ERROR : -'||SQLERRM);
end;


=========================================================================   perfrom delete opertaion using CURSOR ==================================================================


declare
cursor c1 is
select * from employee;
begin
for i in c1 loop
if i.emp_salary <= 1000 then
delete from employee
where emp_salary = i.emp_salary; 
end if;
end loop;
exception
when others then
dbms_output.put_line('Error '||SQLERRM);

end;




































