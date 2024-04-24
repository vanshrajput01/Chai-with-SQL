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



