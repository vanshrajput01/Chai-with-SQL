-- Update emp-salary if you konw employee id

declare

cursor c1 is 
select * from employee
where dept_id = 3;

begin
for i in c1 loop
dbms_output.put_line('Employee details is where department id is 3 ' || i.emp_name || ' ' || i.emp_salary || ' ' ||i.dept_id);

update employee
set emp_salary = 100
where dept_id = 3;
end loop;
end;


--  *********************************************              if not know employee id that update all rows           *****************************************************


--Current of Clause 

declare

cursor c1 is 
select * from employee
where dept_id = 3;

begin
for i in c1 loop
dbms_output.put_line('Employee details is where department id is 3 ' || i.emp_name || ' ' || i.emp_salary || ' ' ||i.dept_id);

update employee
set emp_salary = 100;

end loop;
end;


--  *********************************************              if not know employee id that update all rows but my task not update all row.          *****************************************************

-- *********************************************  that why i am using ***************        Current of Clause        ******************************************


-- Example of current of clause

--Current of Clause 

declare

cursor c1 is 
select * from employee
where dept_id = 3
for update;

begin
for i in c1 loop
dbms_output.put_line('Employee details is where department id is 3 ' || i.emp_name || ' ' || i.emp_salary || ' ' ||i.dept_id);

update employee
set emp_salary = 1000
where current of c1;
end loop;
end;


======================================================================= Current of clause ====================================================================================

--select * from employee_ex;

--current of cursor

declare
emp EMPLOYEE%ROWTYPE;
cursor c1 is
select * from employee where dept_id = 1
for update;

begin
for i in c1 loop
dbms_output.put_line(i.emp_name || i.emp_salary);
update employee
set emp_salary = 10
where current of c1;
end loop;
end;



















