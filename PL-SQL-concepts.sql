
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

-- Example 03 :- 
create or replace procedure insert_data_in_table(
e_id number,
e_name varchar2,
e_salary number,
e_position varchar2
) as

cursor c1 is
select * from employee where emp_id = e_id;

begin
insert into employee values(e_id,e_name,e_salary,e_position);
dbms_output.put_line('data insert success Fully!!');

begin

for i in c1 loop
dbms_output.put_line('added data is this : - ' ||i.emp_id || ' ' || i.emp_name || ' ' || i.emp_salary);
end loop;
end;

end;

begin
insert_data_in_table(107,'june',50000,'juinor-manager');
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


--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&                      IF-ELSE-ELSIF condition statement        *****************************************************************

--Example 03 :-

declare
stud_grade char(1) := :grade;
begin

IF stud_grade = 'A' then
dbms_output.put_line('Excellent');
ELSIF stud_grade = 'B' then
dbms_output.put_line('Very Good');
ELSIF stud_grade = 'C' then
dbms_output.put_line('Good');
else
dbms_output.put_line('Enter valid grade');
end if;

end;


-- **************************************************   Parameter IN, OUT, IN OUT ********************************************************


-- Parameter LIKe - IN , OUT ,IN OUT

--Example 01 :- IN paramter

create or replace function power_of_func (num1 in number,num2 in number) return number
is
result number := 1;

begin
for i in 1..num2 loop
result := result * num1;

end loop;
return result;
end;


declare
x number := 2;
y number := 3;
z number;
begin
z := power_of_func(x,y);
dbms_output.put_line('Result is :- '||z);
end;



--Example 02 :- OUT paramter

create or replace procedure power_of_proce(num1 in number,num2 in number,result out number) as
num3 number := 1;
BEGIN
for i in 1..num2 loop
num3 := num3 * num1;
end loop;
result := num3; 
end;



declare
x number := 3;
y number := 3;
result number;
begin
POWER_OF_PROCE(x,y,result);
dbms_output.put_line(result);
end;














