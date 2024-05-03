-- Execute immediate
-- Example 01 :- 
=================================================================================================================================================================================
declare
v_sql varchar(200);
v_count number;
begin
v_sql := 'select count(*) from employee';
execute immediate v_sql into v_count;
dbms_output.put_line(v_count);
end;

--Execute immediate
-- Example 02 :-

=====================================================================================================================================================================================
create or replace procedure exe_immd_first_proce(
v_table_name varchar2,
v_e_id number
)as
v_sql varchar(200);
v_emp_id number;
v_emp_name varchar(20);
v_emp_salary number;

begin
v_sql := 'select emp_id,emp_name,emp_salary from '|| v_table_name ||' where emp_id = :e_no';
execute immediate v_sql into v_emp_id,v_emp_name,v_emp_salary using v_e_id;
dbms_output.put_line('Employee details is :'|| v_emp_id || ' ' || v_emp_name || ' ' ||v_emp_salary);
exception
when others then
dbms_output.put_line('Invalid employee id!!');
end;

begin
EXE_IMMD_FIRST_PROCE('employee',112);
end;

-- Example 03 :---

================================================================================================================================================================================

--Bulk collect

create or replace procedure EXE_IMMD_Sec_PROCE(
v_table_name varchar2,
v_dept_id number
)as
v_sql  varchar(200);
type v_emp_name is table of varchar(20);
v_e_name v_emp_name;

begin
v_sql := 'select emp_name from '||v_table_name|| ' where dept_id = :dept_no';
execute immediate v_Sql bulk collect into v_e_name using v_dept_id;
for i in 1..v_e_name.count loop
dbms_output.put_line('department id '|| v_dept_id || 'details is : - '||v_e_name(i));
end loop;
end;

begin
EXE_IMMD_Sec_PROCE('employee',2);
end;







