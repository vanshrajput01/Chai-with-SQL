
-- Anonymous code block in PL/SQL
-- Example 01 :- 
declare
num1 int := :num1;
num2 int := :num2;
total int;

begin
total := num1 + num2;
dbms_output.put_line('total num' || '-' || total);

end;

-- Example 02 :-

num1 int := 10;
num2 int := 20;
total int;

begin
total := num1 + num2;
dbms_output.put_line('total num' || '-' || total);

end;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++            Procedure in PL/SQL            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Example 01 :- thing Table is already created and using procedure to insert data;


-- Here create or replace Procedure 
create or replace procedure insert_data_in_table as
e_id int := 101;
e_name varchar(20) := 'Jockey';
e_salary int := 10000;
e_position varchar(30) := 'developer-intern';

begin
insert into employee values(e_id,e_name,e_salary,e_position);
dbms_output.put_line('Data insert into employee successfully!!');
end;

 
-- Here Completed Procedure
begin
insert_data_in_table;
end;

--**************************************************************       Parameter Procedure in PL/SQL           **************************************************************************
--Example 01 :- thing Table is already created and using procedure to insert data;


-- Here create or replace Procedure 
create or replace procedure insert_data_in_table(
e_id in int,
e_name in varchar2,
e_salary in int,
e_position in varchar2
)as

begin
insert into employee values(e_id,e_name,e_salary,e_position);
dbms_output.put_line('Data insert into employee successfully!!');
end;

 
-- Here Completed Procedure
begin
insert_data_in_table(102,'Jone',30000,'Developer');
end;


--**************************************************************       Parameter Procedure in PL/SQL           **************************************************************************
--Example 01 :- thing Table is already created and using procedure to print data;

create or replace procedure print_data_of_table(
employee_id in int
) as
e_id int;
e_name varchar(20);
e_salary int;
begin
select emp_id,emp_name,emp_salary into e_id,e_name,e_salary
from employee
where emp_id = employee_id;
dbms_output.put_line('Employee details id : - ' || e_id || ' ' || e_name || ' ' || e_salary);

end;

begin
PRINT_DATA_OF_TABLE(101);
end;


--****************************************                         Conditional statement in PL-SQL      ***************************************************************************

--IF condition statement

--Example 01 :- 

declare
num1 int := 20;
num2 int := 0;
result int := 0;

begin
if num1 != 0 and num2 != 0 then
result := num1 / num2;
end if;

dbms_output.put_line('Result is :- '|| result); 

end;

--IF-ELSE condition statement

--Example 02 :- 

declare
num1 int := 20;
num2 int := 0;
result int := 0;

begin
if num1 != 0 and num2 != 0 then
result := num1 / num2;
dbms_output.put_line('Result is :- '|| result); 
else
dbms_output.put_line('give valid value to num2');
end if;

end;











