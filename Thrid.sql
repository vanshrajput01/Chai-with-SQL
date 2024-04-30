-- initial commit
========================================================   Insert value in table (Another way)  ========================================================================================

insert into employee_ex(emp_id,emp_name,emp_salary)(select emp_id,emp_name,emp_salary from employee);

select * from  employee;
select * from employee_ex;


=======================================================================   Pseudo Column in sql   =======================================================================================
 =========================================================================================  1  . Row id        ===========================================================================

  select ROWID,emp_name,emp_salary from employee_Ex;


============================================================================= 2. Row num in sql  ===================================================================================

--Use to fetch only first three rows

select * from employee_ex
where ROWNUM <= 3;


===========================================================================  3. NEXTVAL ======================================================================================

--  Pseudo Column in sql

select * from employee_ex;

--3. NEXTVAL

create SEQUENCE emp_ex_dept_id;

update employee_Ex
set dept_id = emp_ex_dept_id.Nextval
where emp_id = 102;


============================================================================  4. CURRVAL  =========================================================================================

--  Pseudo Column in sql

select * from employee_ex;

--3. CURRVAL

create SEQUENCE emp_ex_dept_id;

update employee_Ex
set dept_id = emp_ex_dept_id.currval   --- that store current value of sequence 
where emp_id = 104;





