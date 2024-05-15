--Anonyous code Block in PL-SQL
declare
v_name1 varchar(20) := 'Oracle';
v_name2 varchar(10) := 'Tech';
begin
dbms_output.put_line(v_name1|| ' ' ||v_name2);
exception
when others then
dbms_output.put_line('Error :- '||SQLERRM);
end;

--Bind variable

declare
v_fname varchar(10) := :first_name; --Bind variable
v_lname varchar(10) := :last_name;  --Bind_variable
begin
dbms_output.put_line(v_fname || ' ' ||v_lname);
exception
when others then
dbms_output.put_line('Error');
end;

--get value in the table using anonyous block

declare
v_emp_name employee_t2.emp_name%type;
v_emp_id employee_t2.emp_id%type;
begin
select emp_id,emp_name into v_emp_id , v_emp_name from employee_t2
where emp_id = 105;
dbms_output.put_line(v_emp_id || ' ' ||v_emp_name);
end;


