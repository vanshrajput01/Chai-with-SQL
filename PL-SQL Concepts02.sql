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

=======================================================================  Parameterized CURSOR ===============================================================================


--parameterized cursor in PL=SQL

--Example 01 : -

declare
cursor c1(v_dept_id number) is
select * from employee
where dept_id = v_dept_id;
begin
for i in c1(1) loop
dbms_output.put_line(i.emp_name || ' ' ||i.emp_salary);
end loop;
exception
when others then
dbms_output.put_line('Error' || SQLERRM);
end;


--parameterized cursor in PL=SQL

--Example 02 : -

declare
cursor c1(v_dept_id number) is
select * from employee
where dept_id = v_dept_id;
begin
for i in c1(:dept_no) loop
dbms_output.put_line(i.emp_name || ' ' ||i.emp_salary);
end loop;
exception
when others then
dbms_output.put_line('Error' || SQLERRM);
end;

============================================================== parameterized cursor with open fetch close ================================================================


declare
dept department%rowtype;
cursor c1(v_dept_id number) is
select * from department
where dept_id = v_Dept_id;
begin
open c1(1);
loop
fetch c1 into dept;
exit when c1%notfound;
dbms_output.put_line('Department details :-  ' || dept.dept_name || ' ' || dept.dept_location);
end loop;
close c1;
exception
when others then
dbms_output.put_line('Error ' || SQLERRM);
end;


 =====================================================================    Parameterized cursor with multiple arguments   =======================================================
-- Example 01 :-  
declare
v_dept number := :dept_no;
v_salary number := :salary; 
cursor c1(v_dept_id number,v_emp_salary number) is
select * from employee
where dept_id = v_Dept_id and emp_salary >= v_emp_salary;
begin
if v_Dept is null or v_salary is null then
dbms_output.put_line('please give me value of all argumnets.');
else
for i in c1(v_dept,v_salary) loop
dbms_output.put_line('Employee details : '|| i.emp_name || ' ' ||i.emp_salary);
end loop;
end if;
exception
when others then
dbms_output.put_line('Error : -'||SQLERRM);
end;



========================================================      REF CURSOR ========================================================================================================

declare
emp employee%rowtype;
type ref_cur is ref cursor;
rc ref_cur;
begin
open rc for select * from employee;
loop
fetch rc into emp;
exit when rc%notfound;
dbms_output.put_line('Employee details is ' || emp.emp_name || ' ' || emp.emp_salary);
end loop;
close rc;
exception
when others then
dbms_output.put_line('Error '||SQLERRM);
end;


=======================================================================   Ref cursor is use to get data from multiple table  ==========================================================
--Ref cursor in PL-SQL.
declare
emp employee%rowtype;
dept department%rowtype;
type ref_cur is ref cursor;
rc ref_cur;
begin
open rc for select * from employee;
dbms_output.put_line('=====================    employee details =================================');
loop
fetch rc into emp;
exit when rc%notfound;
dbms_output.put_line('Employee details ' || emp.emp_name || ' ' ||emp.emp_salary);
end loop;
close rc;
open rc for select * from department;
dbms_output.put_line('=====================    Department details =================================');
loop
fetch rc into dept;
exit when rc%notfound;
dbms_output.put_line('Department details ' || dept.dept_name || ' ' ||dept.dept_location);
end loop;
close rc;
exception
when others then
dbms_output.put_line('Error : '|| SQLERRM);
end;


===========================================================  STRONG REF CURSOR ==========================================================================================


--Strong ref cursor
declare
emp employee%rowtype;
dept department%rowtype;
type ref_cur_strong is ref cursor RETURN employee%rowtype;
rcs ref_cur_strong;
begin
open rcs for select * from employee;
loop
fetch rcs into emp;
exit when rcs%notfound;
dbms_output.put_line('Employee details : '|| emp.emp_name||' ' ||emp.emp_salary);
end loop;
close rcs;
exception
when others then
dbms_output.put_line('Error is '||SQLERRM);
end;



=========================================================================  SYS_REFCURSOR ================================================================================



--Strong ref cursor another example

declare
dept department%rowtype; 
rcs sys_refcursor;
begin
open rcs for select * from department;
loop
fetch rcs into dept;
exit when rcs%notfound;
dbms_output.put_line('Employee details : '||dept.dept_name || ' ' ||dept.dept_location);
end loop;
close rcs;
exception
when others then
dbms_output.put_line('Error '||SQLERRM);
end;


======================================================================  Paramterized procedure in PL/SQL ===============================================================


create or replace procedure emp_count_proce(
v_dept_id in number,
count_emp out number
)as
begin
select count(*) into count_emp from employee
WHERE dept_id = v_dept_id;
end;

declare
v_dept_id number := 1;
v_output_count number;
begin
emp_count_proce(v_dept_id,v_output_count);
dbms_output.put_line('Employee count of '||v_output_count);
end;



========================================================================   Parameterized procedure =====================================================================================

create or replace procedure update_emp_salary_proce(v_dept_id in number,
v_new_salary in number)
as
cursor c1 is
select * from employee
where dept_id = v_dept_id;

begin
for i in c1 loop
update employee
set emp_salary = i.emp_salary + v_new_salary
where dept_id = v_dept_id;
end loop;
end;


declare
v_new_salary number := 1000;
v_dept_id number := 2;
begin
UPDATE_EMP_SALARY_PROCE(v_dept_id,v_new_salary);
dbms_output.put_line('salary updated success fully!!');
end;


=========================================================================  Function in PL-SQL  ========================================================================================


--Function in PL-SQL

create or replace function add_func(
num1 number,
num2 number
)
return number is
sum_of_values number;
begin
sum_of_values := num1 + num2;
return sum_of_values;
end;

declare
result_of_values number;
begin
result_of_values := add_func(10,20);
dbms_output.put_line(result_of_values);
end;

=============================================================================   

create or replace procedure update_data_emp(
v_dept_id in number,
date_value in varchar2
) as
begin
if v_dept_id != 1 and v_dept_id != 2 and v_dept_id != 3 and v_dept_id != 4 then
dbms_output.put_line('Invalid department id!! Enter valid dept_id..');
else
update employee
set updation_date = date_value
where dept_id = v_dept_id;
dbms_output.put_line('************* Update success fully!!*************');
end if;
end; 


declare
v_date varchar(20) := '20-04-24';
v_dept_id number := 3;
begin
update_data_emp(v_dept_id,v_date);
end;

declare
v_date varchar(20) := '10-04-24';
v_dept_id number := 1;
begin
update_data_emp(v_dept_id,v_date);
end;

select * from employee;


=========================================================================== another example of paramterized cursor ================================================================


create or replace procedure add_date_emp_ex_proce(v_dept_id in number) as
begin
if v_dept_id != 1 and v_dept_id != 2 and v_dept_id != 3 then
dbms_output.put_line('please give me valid department id.');
else
update employee_ex
set creation_date  = '29-04-24'
where dept_id = v_dept_id;
dbms_output.put_line('Data updated success fully!!!');
end if;
end;


declare
v_dept_id number := 3;
begin
ADD_DATE_EMP_EX_PROCE(v_dept_id);
end;

select * from employee_ex;

=================================================================  Trigger in PLSQL ===========================================================================================

--before update Row level trigger

create or replace trigger update_bef_emp_Ex_tri
before
update
on employee_Ex
FOR EACH ROW
begin
dbms_output.put_line('****************  before update row level trigger *******************');
end;








































