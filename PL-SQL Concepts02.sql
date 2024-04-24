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


-- 
















