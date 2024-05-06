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


========================================================================= Join in SQL ============================================================================================


--joins in SQL

create table employee_Ex(
emp_id number primary key,
emp_name varchar(20),
emp_salary number,
dept_id number
);


create table department_Ex(
dept_id number primary key,
dept_name varchar(10),
dept_location varchar(10)
);

insert into employee_ex values (106,'emp6',12300,6);

insert into department_ex values (6,'Non-IT','Meerut');

select * from department_Ex;

select e.emp_name,e.emp_salary,d.dept_name,d.dept_location 
FROM employee_ex e inner join department_ex d
on e.dept_id = d.dept_id;


select e.emp_name,e.emp_salary,d.dept_name,d.dept_location 
FROM employee_ex e left join department_ex d
on e.dept_id = d.dept_id;



select e.emp_name,e.emp_salary,d.dept_name,d.dept_location 
FROM employee_ex e right join department_ex d
on e.dept_id = d.dept_id;

select e.emp_name,e.emp_salary,d.dept_name,d.dept_location 
FROM employee_ex e full join department_ex d
on e.dept_id = d.dept_id;





