-- Revision in sql
create table employee_Ex
(
emp_id number primary key,
emp_name varchar(20),
emp_salary number
);

insert into employee_Ex(emp_id,emp_name,emp_salary) values (101,'emp1',24000);

insert into employee_Ex (emp_id,emp_name,emp_salary)(select emp_id,emp_name,emp_salary from employee
where emp_id in (102,103,104,105));

select * from employee_Ex;

update employee_Ex
set emp_salary = 25000
where emp_id BETWEEN 102 and 105;

alter table employee_Ex
add dept_id number;

select * from employee_Ex;

update employee_Ex
set dept_id = 2
where emp_id in(103,104,106);

select * from employee_Ex; 

alter table employee_Ex
rename to employee_t2;

select * from employee_Ex; -- table or view does not exist;

select * from employee_t2;

alter table employee_t2
add emp_city varchar(20);


update employee_t2
set emp_city = 'Noida'
where dept_id = 2;


update employee_t2
set emp_city = 'DELHI'
where dept_id = 1;

select * from  employee_t2;

select * from employee_t2
where emp_city like 'D%'; 

select * from employee_t2
where emp_city like '%a';


select * from employee_t2
where emp_city like '%A';


select * from employee_t2
where emp_city like '_o%';


select * from employee_t2
where emp_city like '___hi';



create sequence xx_emp_seq;

select xx_emp_seq.nextval from dual;

select xx_emp_seq.nextval from dual;

select xx_emp_seq.nextval from dual;

select xx_emp_seq.currval from dual; 

--to_date function in sql

alter table employee_t2
add creation_date date;

select * from employee_t2;


update employee_t2
set creation_date = '13-MAR-24'
where dept_id in (1,2);

insert into employee_t2
values (107,'emp7',12600,3,'Gurgaon','MAY-08-24'); --Error---------------------------
--ORA-01858: a non-numeric character was found where a numeric was expected

select * from employee_t2;


insert into employee_t2
values (107,'emp7',12600,3,'Gurgaon','MAY-08-24'); 

insert into employee_t2
values (107,'emp7',12600,3,'Gurgaon',to_date('MAY-08-24','mon-dd-yyyy'));


select *from employee_t2;

declare
v_emp_id employee_t2.emp_id%type;

begin
select emp_id into v_emp_id from employee_t2
where emp_id = 103; 
dbms_output.put_line(v_emp_id);
end;

declare
begin
for i in (select emp_id,emp_name,emp_salary from employee_t2) loop
dbms_output.put_line(i.emp_id || ' ' ||i.emp_name);
end loop;
end;

declare
type emp_rec is record(
v_emp_name employee_t2.emp_name%type,
v_emp_salary employee_t2.emp_salary%type,
v_emp_city employee_t2.emp_city%type
);
er emp_rec;
begin
select emp_name,emp_salary,emp_city into er.v_emp_name,er.v_emp_salary,er.v_emp_city 
from employee_t2
where emp_id = 106;
dbms_output.put_line(er.v_emp_name || ' ' ||er.v_emp_salary || ' ' ||er.v_emp_city);
exception when no_data_found then
dbms_output.put_line('data is not found');
end;





