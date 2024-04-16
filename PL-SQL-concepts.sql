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








