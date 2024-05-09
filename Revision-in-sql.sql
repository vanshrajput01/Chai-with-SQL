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


=========================================================================  IN and between operator in sql ===========================================================================

select * from employee_Ex;

-- in
update employee_Ex
set emp_city = 'Delhi'
where dept_id in (1,2,3);

update employee_Ex
set emp_city = 'Noida'
where dept_id  in (4,6);

select * from employee_ex;

============================================================================= Not in operator ==================================================================================

  select * from employee_ex;
-- not in operator in SQL

select * from employee_Ex
where emp_city not in ('Delhi','Noida');

update employee_EX
set emp_salary = 10000
where dept_id not in (1,2,3,4);





--Between

select * from employee_Ex
where emp_salary between 1000 and 10000;


==================================================================================== like operator in SQL =========================================================================
-- Like operator in SQL

  
select * from employee_ex;

select * from employee_Ex
where emp_city like 'D%';

select * from employee_ex
where emp_city like '%a';

select * from employee_Ex
where emp_city like 'Noid_';

select * from employee_Ex
where emp_city like '_elhi';


================================================================================= NOt like in SQL ==============================================================================


select * from employee_Ex
where emp_city not like 'Jap%';

select * from employee_Ex
where emp_city not like 'Delhi';


============================================================================== Union in sql ==============================================================================

select emp_id,emp_name,emp_salary from employee
union
select emp_id,emp_name,emp_salary from employee_ex;


========================================================================== Union all in sql =============================================================================

select * from employee_Ex;

-- Union and Union All

select emp_id,emp_name,emp_salary from employee
union 
select emp_id,emp_name,emp_salary from employee_ex;

select emp_id,emp_name ,emp_salary from employee
union All
select emp_id,emp_name,emp_salary from employee_ex;


select count(*) from (select emp_id,emp_name ,emp_salary from employee
union 
select emp_id,emp_name,emp_salary from employee_ex);

select count(*) from (select emp_id,emp_name ,emp_salary from employee
union All
select emp_id,emp_name,emp_salary from employee_ex);


============================================================================== NVL and NVL2 ==========================================================================================

select * from employee_ex;

--NVL AND NVL2

create table employee_Ex(
emp_id number primary key,
emp_name varchar(20),
emp_salary number
);


select * from employee_Ex;

insert into employee_Ex (emp_id,emp_name,emp_Salary) 
(select emp_id,emp_name,emp_salary from employee
where emp_id in (1,2,3,4));

alter table employee_Ex
add emp_bouns number;

select * from employee_Ex;

update employee_Ex
set emp_bouns = 100
where emp_id in (1,3);

select (NVL(emp_bouns,10) + emp_salary)total_salary,emp_name,emp_bouns from employee_ex;


==============================================================================  NVL2   ===========================================================================================


select * from employee_ex;

--NVL AND NVL2

create table employee_Ex(
emp_id number primary key,
emp_name varchar(20),
emp_salary number
);


select * from employee_Ex;

insert into employee_Ex (emp_id,emp_name,emp_Salary) 
(select emp_id,emp_name,emp_salary from employee
where emp_id in (1,2,3,4));

alter table employee_Ex
add emp_bouns number;

select * from employee_Ex;

update employee_Ex
set emp_bouns = 100
where emp_id in (1,3);

-- NVl handling in sql


select (NVL(emp_bouns,10) + emp_salary)total_salary,emp_name,emp_bouns from employee_ex;

select emp_id,emp_name,emp_salary,emp_bouns,(NVL2(emp_bouns,10,0))nal2_column from employee_ex;


================================================================== Extract function in sql   =============================================================================

--how to get day,month,year from particular date

select extract(year from sysdate) from dual;

select extract(month from sysdate) from dual;

select extract(day from sysdate) from dual;


========================================================================== Decode function in sql  ==============================================================================

select emp_name,decode(emp_bouns,'',10,5,100,0,10,100,500,emp_bouns)decode_func,emp_salary,emp_bouns from employee_Ex;


select decode(emp_salary,25,500,24,450,125,2000,emp_salary)decode_func_sal,emp_salary,emp_name from employee_Ex;


==================================================================================  case statement ijn sql =================================================================


select case when emp_salary < 50 
           then 100
            when emp_salary > 50
            then 200
            else
            emp_salary
end case_emp_sal,emp_name,emp_salary from employee_ex;

select case when emp_bouns is null
            then 100
            when emp_bouns = 5
            then 20
            else 1000
            end case_emp_bouns,emp_name,emp_bouns,emp_salary from employee_ex;            

select * from employee_Ex;












































