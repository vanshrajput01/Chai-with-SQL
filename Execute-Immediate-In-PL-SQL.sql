--Execute Immediate in PL/SQL
-- Static SQL 

-- Example 01 :- 

declare
v_count number;
begin
select count(*) into v_count from employee 
where dept_id = 3;
dbms_output.put_line('Department 2 entry is : - '||v_count);
end;

--Update 

declare
e_salary number := 10000;
e_id number := 107;

begin
update employee 
set emp_salary = e_salary
where emp_id = e_id;
dbms_output.put_line('data updated successfully!!');
end;

-- That code give Error.
begin
alter table employee_ex
add dept_name varchar(20);
end;

-- Execute Immediate in PL/SQL
--Dynamic SQL

create or replace procedure dynamic_emp_proce(v_dept_id number)as
v_count number;
begin
select count(*) into v_count from employee
where dept_id = v_dept_id;
dbms_output.put_line(v_count);
end;

begin
DYNAMIC_EMP_PROCE(2);
end;

begin
DYNAMIC_EMP_PROCE(1);
end;

--***************************************************************          Dynamic SQL --- Here i am pass table as Parameter   ************************************************

-- This code give an Error 
create or replace procedure dynamic_emp_proce_2 as
v_count number;
begin
select count(*) into v_count from employee
where dept_id = :v_dept_id;  -- This line give me Error
dbms_output.put_line(v_count);
end;

LINE/COL  ERROR
--------- -------------------------------------------------------------
5/17      PLS-00049: bad bind variable 'V_DEPT_ID'
Errors: check compiler log

  

-- *******************************************************                 Dynamic SQL --- Here i am pass table as Parameter   *****************************************************

-- This code give an Error 


create or replace procedure dynamic_emp_proce_2(v_dept_id number,v_table_name varchar2) as
v_count number;
begin
select count(*) into v_count from v_table_name
where dept_id = v_dept_id;
dbms_output.put_line(v_count);
end;

LINE/COL  ERROR
--------- -------------------------------------------------------------
4/1       PL/SQL: SQL Statement ignored
4/35      PL/SQL: ORA-00942: table or view does not exist
Errors: check compiler log

-- *****************************************************************          To solved that problem using Execute Immediate Concept        *********************************************

----Execute Immediate in PL/SQL

CREATE OR REPLACE PROCEDURE dynamic_emp_proce4 (
    v_dept_id NUMBER,
    v_table_name VARCHAR2
) AS
    v_count NUMBER;
    v_sql VARCHAR2(300); -- Corrected variable type declaration
BEGIN
    v_sql := 'SELECT COUNT(*) FROM ' || v_table_name || ' WHERE dept_id = :deptno'; -- Added spaces
    EXECUTE IMMEDIATE v_sql INTO v_count USING v_dept_id;
    
    dbms_output.put_line(v_count);
END;



begin
DYNAMIC_EMP_PROCE4(1,'employee');
end;






