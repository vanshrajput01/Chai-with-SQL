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


-- Example 02 :- 
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
DYNAMIC_EMP_PROCE4(1,'department');
end;

-- Using Execute immediate to perform the DDL copmmand in Anonyoums block;

begin
execute IMMEDIATE 'truncate TABLE employee_ex';
end;


--***************************************************************     NO return NO Bind Variable and NO Error   ********************************************************

--Execute Immediate Example01 :- 

declare
v_sql varchar(400); 
begin
v_sql := 'update employee
set emp_salary = 2000
where emp_id = 103';
exec_output.put_line('Data Update success fully!!!');
end;

select * from employee;


--***************************************************************     NO return NO Bind Variable and NO Error   ********************************************************

--Execute Immediate Example01 :- 


declare
v_sql varchar(400); 
begin
v_sql := 'delete from employee
where emp_id = 103';
exec_output.put_line('data Delete success fully!!!');
end;

-- NO return NO Bind Variable and NO Error

--Execute Immediate Example01 :- 

--**********************************************************************       DDL commands       **********************************************************************


-- That give me an Error;
begin
create table employee_ex as select * from employee;
end;

drop table employee_ex;

begin
EXECUTE IMMEDIATE 'create table employee_ex as select * from employee';
dbms_output.put_line('Table created successfully!!');
end;



begin
EXECUTE IMMEDIATE 'drop table employee_ex';
dbms_output.put_line('Table deleted successfully!!');
end;


-- Single value return without bind variable

declare
v_count number;
v_sql varchar(500);

begin
v_sql := 'select count(*) from employee';
EXECUTE IMMEDIATE v_sql into v_count;
dbms_output.put_line('employee table number of record is : - ' || v_count);
end;


-- ******************************************************************         INTO statement with Multiple value Return          **************************************************

declare
v_sql varchar(300);
e_id number;
e_name varchar(10);
e_salary number;
begin
v_sql := 'select emp_id,emp_name,emp_salary from employee where emp_id = 102';
EXECUTE IMMEDIATE v_sql into e_id,e_name,e_salary;
dbms_output.put_line('employee details is :- '|| e_id || ' '|| e_name || ' ' || e_salary);
end;



-- ****************************************************************     into statement return single value using bind variable    *****************************************************

declare
v_sql varchar(300);
v_count number;
v_dept_id number := 1;
begin
v_sql := 'select count(*) from employee where dept_id = :deptno';
EXECUTE IMMEDIATE v_sql into v_count using v_dept_id;
dbms_output.put_line(v_count);
end;


-- ************************************************     into statement return single row (multiple values )using bind variable   ******************************************************

declare
v_dept_id number := 4;
v_sql varchar(300);
e_id number;
e_name varchar(10);
e_salary number;
begin
v_sql := 'select emp_id,emp_name,emp_salary from employee where dept_id = :deptno';
EXECUTE IMMEDIATE v_sql into e_id,e_name,e_salary using v_dept_id;
dbms_output.put_line('employee details is :- '||e_id || ' ' ||e_name || ' ' ||e_salary);
end;

-- **********************************************************   that give me Error *************************************************************************************************

create or replace procedure emp_exe_Immediate as
e_name varchar(20);
e_salary number;
v_sql varchar(300);
begin
v_sql := 'select emp_name,emp_salary from employee where dept_id = 2';
execute IMMEDIATE v_sql into e_name,e_salary;
dbms_output.put_line('Employee details is :- '||e_name|| ' ' || e_salary);

end;

begin
EMP_EXE_IMMEDIATE;
end;


-- *****************************************************************************  bulk collect into ****************************************************************************

-- Example 01 : - 
declare
v_sql varchar(300);
type v_emp_name is table of varchar(20);   -- type
v_e_name v_emp_name;
begin
v_sql := 'select emp_name from employee';
EXECUTE IMMEDIATE v_sql bulk COLLECT into v_e_name;

for i in 1..v_e_name.count loop
dbms_output.put_line('in Employee table all employee name is :-'||v_e_name(i));
end loop;

end;

-- *************************************************************************  Bulk collect into *****************************************************************************
-- Example 02 : - 
declare
v_sql varchar(300);
type v_emp_name is table of varchar(20);
v_e_name v_emp_name;
type v_emp_salary is table of number;
v_e_salary v_emp_salary;
begin
v_sql := 'select emp_name,emp_salary from employee';
execute IMMEDIATE v_sql bulk collect into v_e_name,v_e_salary;
for i in 1..v_e_name.count loop
dbms_output.put_line(v_e_name(i) || ' ' ||v_e_salary(i));
end loop;

end;


-- Example 03 : -
declare
v_sql varchar(300);
type v_emp_name is table of varchar(20);
v_e_name v_emp_name;
type v_emp_salary is table of number;
v_e_salary v_emp_salary;
begin
v_sql := 'select emp_name,emp_salary from employee where dept_id = :dept_no';
execute IMMEDIATE v_sql bulk collect into v_e_name,v_e_salary using 1;
for i in 1..v_e_name.count loop
dbms_output.put_line(v_e_name(i) || ' ' ||v_e_salary(i));
end loop;

end;

-- Example 04 :- 

declare
type emp_cur is ref cursor;
c1 emp_cur;
v_sql varchar(300);
emp employee%rowtype;

begin
v_sql := 'select * from employee where dept_id = :dept_no';
open c1 for v_sql using 1;
loop
fetch c1 into emp;
exit when c1%notfound;
dbms_output.put_line('Employee deatils is  : - '||emp.emp_name || ' ' ||emp.emp_salary);
end loop;

end;


-- Example 05 :-

declare
d_id number := 1;
d_name varchar(20) := 'HR';
v_sql varchar(200);
begin
v_sql := 'insert into employee_ex values(:id , :name )';
EXECUTE IMMEDIATE v_sql using d_id,d_name;
dbms_output.put_line('number of rows insert into employee : '|| sql%rowcount);
end;


======================================================================================================================================================================

create or replace procedure get_date_emp_tbl_proce(
v_dept_id number
)as
v_sql varchar(300);
type v_tbl_vari is table OF varchar(20);
t_v  v_tbl_vari;
begin
v_sql := 'select emp_name from employee where dept_id = :dept_no';
EXECUTE IMMEDIATE v_sql BULK collect into t_v using v_dept_id;

for i in 1..t_v.count loop
dbms_output.put_line('Employee name details is : '|| t_v(i));
end loop;


exception 
when others then
dbms_output.put_line('Error : '||SQLERRM);
end;


begin
GET_DATE_EMP_TBL_PROCE(1);
end;


============================================================================  Call Procedure using EXEcute immediate ============================================

CREATE OR REPLACE PROCEDURE XXCUST_FIRST_PROCE(
A NUMBER,
B NUMBER,
C NUMBER,
D NUMBER
)as
BEGIN
DBMS_OUTPUT.PUT_LINE(A +B +C +D);
END;

DECLARE
V_sQL VARCHAR(200);
A NUMBER := 1;
B NUMBER := 2;
BEGIN
V_SQL := '
BEGIN
XXCUST_FIRST_PROCE(:X,:X,:Y,:X);
END;';
EXECUTE IMMEDIATE V_SQL USING A,B;
END;


==============================================================  Another Example of Call procedure using execute immediate ========================================


CREATE OR REPLACE PROCEDURE XXCUST_FIRST_PROCE(
A NUMBER,
B NUMBER,
C NUMBER,
D NUMBER
)as
BEGIN
DBMS_OUTPUT.PUT_LINE(A +B +C +D);
END;

DECLARE
V_sQL VARCHAR(200);
A NUMBER := 1;
B NUMBER := 2;
BEGIN
V_SQL := '
BEGIN
XXCUST_FIRST_PROCE(:W,:X,:Y,:Z);
END;';
EXECUTE IMMEDIATE V_SQL USING A,B,A,B;
END;



























