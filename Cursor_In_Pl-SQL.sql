-- Cursor in PL/SQL
-- Two type of curosr in PL/SQL
-- 1.Implicit cursor
-- 2.explicit curosr

-- 1. Implicit cursor
declare
e_name employee.emp_name%type;
begin
  select emp_name into e_name 
  from employee
  where emp_id = :emp_id_no;
  dbms_output.put_line('Employee details is : -' || e_name);
end;


-- Explicit Cursor 
-- these are two ways to define explicit Cursor
-- 1. OPEN , FETCH and CLOSE 
-- 2.loop


-- Example 1. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- if fetch single trecord in table OR know how many record in the table;
declare
e_id employee.emp_id%type;
cursor c1 is
  select emp_id from employee;
begin
  open c1;
    fetch c1 into e_id;
    dbms_output.put_line(c1%rowcount || '-' || e_id);
    fetch c1 into e_id;
    dbms_output.put_line(c1%rowcount || '-' || e_id);
    fetch c1 into e_id;
    dbms_output.put_line(c1%rowcount || '-' || e_id);
  close c1;
end;


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Example 2 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- fetch the multiple record in table using loop.
declare
e_id employee.emp_id%type;
e_name employee.emp_name%type;

cursor c1 is
select emp_id,emp_name from employee;

begin
  open c1;
  loop
  fetch c1 into e_id,e_name;
  exit when c1%notfound;
  dbms_output.put_line(c1%rowcount || '-' || e_id || ' ' || e_name);
  end loop;
  close c1;
end;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Example 03 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

declare
emp employee%rowtype;

cursor c1 is
select * from employee;

begin
open c1;
loop
fetch c1 into emp;
exit when c1%notfound;
dbms_output.put_line('Employee details : -' ||  emp.emp_id|| ' ' || emp.emp_name || ' ' || emp.emp_salary || ' ' || emp.emp_position);
end loop;
close c1;
end;


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++ Implicit cursor with %found Attribute +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Implicit cursor with %found attribute;

declare
e_id number := :emp_no;

begin
delete from employee
where emp_id = e_id;

if sql%found then
dbms_output.put_line('yes.');
else
dbms_output.put_line('No.');
end if;
end;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++ -- Implicit cursor with %notfound attribute +++++++++++++++++++++++++++++++++++++++++++++++++++++

declare
e_id number := :emp_no;
e_name varchar(20);

begin
select emp_name into e_name from employee
where emp_id = e_id;

if sql%notfound then
dbms_output.put_line('No. data is not found this employee id');
else
dbms_output.put_line('yes. data is found this employee id');
end if;
end;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++ Implicit cursor with %rowcount attribute ++++++++++++++++++++++++++++++++++++

declare
e_id number := :emp_no;
e_name varchar(20);

begin
select emp_name into e_name from employee
where emp_id = e_id;

dbms_output.put_line(sql%rowcount);
end;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++ Explicit cursor with %ispen attribute ++++++++++++++++++

--Explicit cursor with %isopen attribute

declare
emp employee%rowtype;

cursor c1 is
select * from employee;

begin
  
if not c1%isopen then
open c1;
end if;

loop
fetch c1 into emp;
exit when c1%notfound;
dbms_output.put_line('Employee details is  : - ' || emp.emp_name ||' ' || emp.emp_salary); 
end loop;

if c1%isopen then
close c1;
end if;

end;

-- +++++++++++++++++++++++++++++++++++++++++++ Explicit cursor with %found attribute ++++++++++++++++++++++++++++++++++++++++

--Explicit cursor with %found attribute

declare
emp employee%rowtype;

cursor c1 is
select * from employee;

begin
if not c1%isopen then
open c1;
end if;

loop
fetch c1 into emp;
exit when c1%notfound;
if c1%found then
dbms_output.put_line('Employee details is  : - ' || emp.emp_name ||' ' || emp.emp_salary); 
else
exit;
end if;
end loop;

if c1%isopen then
close c1;
end if;
end;


-- +++++++++++++++++++++++++++++++++++++++++++++++ Parameterized Explicit Cursor +++++++++++++++++++++++++++++++++++++++++++++

-- Example 01 : - 
declare
e_name employee.emp_name%type;
e_salary employee.emp_salary%type;

cursor c1 is 
select emp_name,emp_salary from employee
where dept_id = 1;

cursor c2 is 
select emp_name,emp_salary from employee
where dept_id = 2;
begin
dbms_output.put_line('++++++++++++++++++++++++++++++++dept_id :- 01 ++++++++++++++++++++++++++++++++');
open c1;
loop
fetch c1 into e_name,e_salary;
exit when c1%notfound;
dbms_output.put_line('Employee name : - ' || e_name ||'Employee salary : - ' || e_salary);  
end loop;
close c1;

dbms_output.put_line('++++++++++++++++++++++++++++++++dept_id :- 02 ++++++++++++++++++++++++++++++++');

open c2;
loop
fetch c2 into e_name,e_salary;
exit when c2%notfound;
dbms_output.put_line('Employee name : - ' || e_name ||'Employee salary : - ' || e_salary);  
end loop;
close c2;

end;


  
--++++++++++++++++++++++++++++++++++++++++++++++++++++++  Example 02 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
declare
e_name employee.emp_name%type;
e_salary employee.emp_salary%type;

cursor c1(dept_no number) is
select emp_name,emp_salary from employee where dept_id = dept_no;

begin
open c1(1);
loop
fetch c1 into e_name,e_salary;
exit when c1%notfound;
dbms_output.put_line('Employee deatils : - ' || e_name || e_salary);
end loop;
close c1;
end;


--+++++++++++++++++++++++++++++++++++++++++++++++++ Parameterized Explicit cursor ++++++++++++++++++++++++++++++++++++++++++++++++++
--Example 03 :- 

declare
cursor c1 is
select * from employee 
where dept_id = 1;

cursor c2 is
select * from employee 
where dept_id = 2;

begin
for i in c1 loop
dbms_output.put_line('Employee details is :- ' || i.emp_id || ' ' || i.emp_name); 
end loop;

for i in c2 loop
dbms_output.put_line('Employee details is :- ' || i.emp_id || ' ' || i.emp_name); 
end loop;
end;

--+++++++++++++++++++++++++++++++++++++++++++++++++ Parameterized Explicit cursor ++++++++++++++++++++++++++++++++++++++++++++++++++
--Example 04 :- 

declare
cursor c1(dept_no employee.dept_id%TYPE) is
select * from employee
where dept_id = dept_no;

begin
for i in c1(1) loop
dbms_output.put_line('Employee details is :- ' || i.emp_name || ' ' || i.emp_salary);
end loop;

for i in c1(3) loop
dbms_output.put_line('Employee details is :- ' || i.emp_name || ' ' || i.emp_salary);
end loop;
end;



--+++++++++++++++++++++++++++++++++++++++++++++++++Multiple Parameterized Explicit cursor ++++++++++++++++++++++++++++++++++++++++++++++++++
--Example 05 :- 

declare
cursor c1(dept_no employee.dept_id%TYPE,e_exp_year employee.emp_exp_year%type) is
select * from employee
where dept_id = dept_no
and emp_exp_year > e_exp_year;

begin
for i in c1(1,2) loop
dbms_output.put_line('Employee details is :- ' || i.emp_name || ' ' || i.emp_salary);
end loop;

for i in c1(3,3) loop
dbms_output.put_line('Employee details is :- ' || i.emp_name || ' ' || i.emp_salary);
end loop;
end;


-- ++++++++++++++++++++++++++++++++++++++++ if two difference table +++++++++++++++++++++++++++++++++++++++++++++++
-- Example 06 :- 
declare
cursor c1 is
select * from employee;

cursor c2 is
select * from department;

begin
for i in c1 loop
dbms_output.put_line('Employee datails is  : -' || i.emp_name || ' ' || i.emp_salary);
end loop;

for i in c2 loop
dbms_output.put_line('Employee datails is  : -' || i.dept_name);
end loop;
end;

-- ++++++++++++++++++++++++++++++++++++++++ if two difference table +++++++++++++++++++++++++++++++++++++++++++++++

-- Example 07 : - 
declare
emp employee%rowtype;
dept department%rowtype;

cursor c1 is
select * from employee;

cursor c2 is
select * from department;

begin
open c1;
loop
fetch c1 into emp;
exit when c1%notfound;
dbms_output.put_line('Employee details : - '||emp.emp_name || ' ' || emp.emp_salary);
end loop;
close c1;

open c2;
loop
fetch c2 into dept;
exit when c2%notfound;
dbms_output.put_line('Department details is : - ' || dept.dept_name); 
end loop;
close c2;

end;

-- +++++++++++++++++++++++++++++++++++++++ Ref cursor in PL/SQL +++++++++++++++++++++++++++++++++++++++++++++++
-- Example 01 : -
declare
type temp_ref is ref cursor;
tr temp_ref;
emp employee%rowtype;
dept department%rowtype;
begin
open tr for select * from employee;
loop
fetch tr into emp;
exit when tr%notfound;
dbms_output.put_line('Employee details is :- ' || emp.emp_name || emp.emp_salary);
end loop;

close tr;

open tr for select * from department;
loop
fetch tr into dept;
exit when tr%notfound;
dbms_output.put_line('department details is :- ' || dept.dept_name);
end loop;

close tr;
end;


-- +++++++++++++++++++++++++++++++++++++++ Ref cursor in PL/SQL +++++++++++++++++++++++++++++++++++++++++++++++
-- Example 02 : - 

declare
emp employee%rowtype;
type temp_ref_cursor is ref cursor;
trc temp_ref_cursor;
begin
open trc for select * from employee;
loop
fetch trc into emp;
exit when trc%notfound;
DBMS_OUTPUT.PUT_LINE('Employee details is : ' || emp.emp_name || ' ' || emp.emp_salary);
end loop;
close trc;


end;



-- ***************************************** TYPE OF Ref cursor *****************************************************************

--1.****************************************   Weakly type Ref cursor   *********************************************************
--Example 01: - 

declare
dept department%rowtype;
emp employee%rowtype;
type temp_ref_c1 is ref cursor;
trc temp_ref_c1;

begin
open trc for select * from employee;
loop
fetch trc into emp;
exit when trc%notfound;
dbms_output.put_line('employees details is: ' || emp.emp_id || ' ' || emp.emp_name || ' ' ||emp.emp_salary);
end loop;
close trc;

open trc for select * from department;
loop
fetch trc into dept;
exit when trc%notfound;
dbms_output.put_line('Department details is: ' || dept.dept_id || ' ' || dept.dept_name);
end loop;
close trc;

end;


--2. *************************************     Strong type Ref cursor *************************************************************
--Example 02: - 

declare
dept department%rowtype;
emp employee%rowtype;
type temp_ref_c1 is ref cursor RETURN employee%ROWTYPE;
trc temp_ref_c1;

begin
open trc for select * from employee;
loop
fetch trc into emp;
exit when trc%notfound;
dbms_output.put_line('employees details is: ' || emp.emp_id || ' ' || emp.emp_name || ' ' ||emp.emp_salary);
end loop;
close trc;

end;






























