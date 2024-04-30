-- initial commit
========================================================   Insert value in table (Another way)  ========================================================================================

insert into employee_ex(emp_id,emp_name,emp_salary)(select emp_id,emp_name,emp_salary from employee);

select * from  employee;
select * from employee_ex;
