--Execute Immediate in PL/SQL
-- Static SQL 

-- Example 01 :- 

declare
v_count number;
begin
select count(*) into v_count from employee 
where dept_id = 3;
dbms_output.put_line('Department 2 entry is : - '||v_count);
end;
