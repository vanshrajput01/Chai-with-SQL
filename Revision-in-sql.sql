--constraint in sql
--default constraint in sql

create table employee_Ex(
emp_id number primary key,
emp_name varchar(20),
emp_Salary number DEFAULT 20000
);

insert into employee_Ex values(101,'emp1',23000);

insert into employee_Ex (emp_id,emp_name) values (102,'emp2');

select * from employee_Ex;

--if insert column with default constraint in sql

alter table employee_Ex
add emp_salary number default 25000;

insert into employee_Ex (emp_id,emp_name) values (103,'emp3');

create table employee_Ex(
emp_id number primary key,
emp_name varchar(20),
emp_Salary number 
);

-- if add constraint to emp_salary

alter table employee_Ex
modify emp_salary number default 23000;

insert into employee_Ex (emp_id,emp_name) values (104,'emp4');

select * from employee_ex;
