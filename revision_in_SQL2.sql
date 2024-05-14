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




