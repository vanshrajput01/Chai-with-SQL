-- initial commit
========================================================   Insert value in table (Another way)  ========================================================================================

insert into employee_ex(emp_id,emp_name,emp_salary)(select emp_id,emp_name,emp_salary from employee);

select * from  employee;
select * from employee_ex;


=======================================================================   Pseudo Column in sql   =======================================================================================
 =========================================================================================  1  . Row id        ========================================================================

  select ROWID,emp_name,emp_salary from employee_Ex;


============================================================================= 2. Row num in sql  ===================================================================================

--Use to fetch only first three rows

select * from employee_ex
where ROWNUM <= 3;


===========================================================================   NEXTVAL ======================================================================================

--  Pseudo Column in sql

select * from employee_ex;

--3. NEXTVAL

create SEQUENCE emp_ex_dept_id;

update employee_Ex
set dept_id = emp_ex_dept_id.Nextval
where emp_id = 102;


============================================================================  CURRVAL  =========================================================================================

--  Pseudo Column in sql

select * from employee_ex;

--4. CURRVAL

create SEQUENCE emp_ex_dept_id;

update employee_Ex
set dept_id = emp_ex_dept_id.currval   --- that store current value of sequence 
where emp_id = 104;


======================================================================== Some problem based on select =====================================================================


select * from employees;

select firstname,lastname 
from employees
where department = 'IT';

select * from employees
order by lastname;

select department,avg(salary) from employees
group by department;

select department, avg(salary) as avg_salary from employees
group by department
having avg(salary) > 50000;

select * from employees;

select * from employees
where hiredate > '01-JAN-19'
order by salary desc;

select * from employees;

select count(*),department 
from employees
group by department; 

select firstname,lastname,salary 
from employees
where department = 'Sales' and salary > 50000;

select firstname,lastname,hiredate 
from employees
where hiredate between '01-JAN-19' AND '31-DEC-20';

select * from employees;

select firstname,lastname 
from employees
where lastname like 'J%';

select firstname,lastname,salary
from employees
where department in ('IT','HR');


select department,max(salary) as max_salary
from employees
group by department
having max(salary) > 60000;

select firstname,lastname,length(firstname)
from employees
where length(firstname) > 3;


--1

select firstname , lastname ,salary
from employees
where salary between 45000 and 60000;

--2.

select count(*) ,department
from employees
group by department;

--3.

select firstname,lastname,hiredate
from employees
where hiredate > '18-JUL-18';

--4.

select firstname,lastname
from employees
where firstname like '%a%';

--5.

select department,avg(salary),count(*)
from employees
group by department
having count(*) > 1;

--6.

select salary,firstname,lastname 
from employees
where ROWNUM < 4
order by salary desc;

--7.

select * from employees;

select firstname,lastname,round(MONTHS_BETWEEN(SYSDATE,hiredate))/12 as number_of_years
from employees;









