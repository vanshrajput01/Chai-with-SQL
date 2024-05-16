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


--Conditional statementsin PLSQL

declare
v_num1 number := :num1;
v_num2 number := :num2;
v_sum number;
begin
if v_num1 != 0 and  v_num2 != 0 then
v_sum := v_num1 + v_num2;
dbms_output.put_line(v_sum);
else
dbms_output.put_line('give valid value of num1 and num2');
end if;
end;

--Another example

declare
v_grade char := :grade;
begin
if v_grade = 'A' or v_grade = 'a' then
dbms_output.put_line('Very good');
elsif v_grade = 'B' or v_grade = 'b' then
dbms_output.put_line('Good');
elsif v_grade = 'C' or v_grade = 'c' then
dbms_output.put_line('not bad');
else
dbms_output.put_line('Give me valid grade');
end if;
end;


--Case statement 

declare
v_grade char := :grade;
begin
case v_grade
when 'A' then
dbms_output.put_line('Very good');
when 'B' then
dbms_output.put_line('Good');
when 'C' then
dbms_output.put_line('Not bad');
else
dbms_output.put_line('Give me valid grade!!');
end case;
end;

--Another example of CASE statement
declare
v_age number := :your_age;
begin
case
when v_age < 18 then
dbms_output.put_line('Your age is not valid for Driving!!');
when v_age >= 18 then
dbms_output.put_line('Your age is valid for Drive!!');
else
dbms_output.put_line('Your age is not valid!!!');
end case;
end;

--Loop in pl-sql;
--Loop

declare
x int := 1;
begin
loop
exit when x = 11;
dbms_output.put_line(x);
x := x + 1;
end loop;
end;

--For loop in PL-SQL

declare
v_table int := :num;
begin
for i in 1..10 loop
dbms_output.put_line(v_table * i);
end loop;
end;

--While Loop in SQL

declare
v_end_num number := :end_num;
i int := 2;
begin
while i <= v_end_num loop
if mod(i,2) = 0 then
dbms_output.put_line(i ||' is even');
else
dbms_output.put_line(i || ' is odd');
end if;
i := i+1;
end loop;
end;







