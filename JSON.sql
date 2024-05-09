-- APEX_JSON IN PL-SQL

============================================================================= Example 01 =========================================================================================

declare
json_string clob := '{"name" : "Jack" , "age" : 30 , "city" : "New York"}'; 
json_obj apex_json.t_values;
v_name VARCHAR(10);
v_age number;
v_city varchar(20);
begin

apex_json.parse(json_obj,json_string);
dbms_output.put_line(json_string);
dbms_output.put_line(json_obj);
v_name := apex_json.get_varchar2(p_path => 'name',p_values => json_obj);
v_age := apex_json.get_number(p_path => 'age' , p_values => json_obj); 
dbms_output.put_line('name is : -' || v_name);
dbms_output.put_line('age is : -' || v_age);
end;


=====================================================================================  Example 02 ==============================================================================

--Apex_Json

declare
json_string clob := '{"fname" : "mark","lname" : "hook","salary" : 10000,"id" : 1}';
json_obj apex_json.t_values;
emp_first_name varchar(50);
emp_last_name varchar(50);
emp_id number;
begin
apex_json.parse(json_obj,json_string);
emp_first_name := apex_json.get_varchar2(p_path => 'fname' , p_values => json_obj);
emp_last_name := apex_json.get_varchar2(p_path => 'lname' , p_values => json_obj);
dbms_output.put_line('Employee full name is  : '|| emp_first_name || ' ' || emp_last_name);


end;


=================================================================================  Example 03 ====================================================================================



--APEX_JSON
DECLARE
json_string clob := '{"emp_id": 101 , "emp_name" : "Nil","emp_salary" : 10000}';
v_emp_name varchar(20);
v_emp_id number;
begin
apex_json.parse(json_string);
v_emp_name := apex_json.get_varchar2(p_path => 'emp_name');
dbms_output.put_line(v_emp_name);

end;


=============================================================================  Get_count ============================================================================================

--Apex_Json

declare
json_string clob := '{"fname" : "mark","lname" : "hook","salary" : 10000,"id" : 1}';
json_obj apex_json.t_values;
emp_first_name varchar(50);
emp_last_name varchar(50);
emp_id number;
begin
apex_json.parse(json_obj,json_string);
emp_first_name := apex_json.get_varchar2(p_path => 'fname' , p_values => json_obj);
emp_last_name := apex_json.get_varchar2(p_path => 'lname' , p_values => json_obj);
dbms_output.put_line('Employee full name is  : '|| emp_first_name || ' ' || emp_last_name);
dbms_output.put_line(apex_json.get_count(p_path => '.' , p_values => json_obj));


end;

=======================================================================  get value from array  ===============================================================================================

-- get_count Methrod

declare
json_string clob := '{"num_items" : [1,2,3] , "value_items" : "value1"}'; 

begin
apex_json.parse(json_string);
dbms_output.put_line(apex_json.get_count(p_path => 'num_items'));
dbms_output.put_line(apex_json.get_number(p_path => 'num_items[%d]' , p0 => 1));
dbms_output.put_line(apex_json.get_number(p_path => 'num_items[%d]' , p0 => 2));
dbms_output.put_line(apex_json.get_number(p_path => 'num_items[%d]' , p0 => 3));
end;


============================================================================  Example 05 =====================================================================================


--Apex_json

declare
json_string clob:= '{"items" : [1,2,3,{"foo": 24}]}';

begin
apex_json.parse(json_string);
dbms_output.put_line(apex_json.get_number(p_path => 'items[%d]' , p0 => 2));
end;

--Apex_json
============================================================== important example ============================================================================================
declare
json_string clob :=  '{"employee_details" : [{"emp_id" : 101},{"emp_name" : "jaison"},{"emp_salary" : 10000}]}';
v_count number;
begin
apex_json.parse(json_string);
v_count := apex_json.get_count(p_path => 'employee_details');

dbms_output.put_line(v_count);

for i in 1..v_count loop
dbms_output.put_line(apex_json.get_varchar2(p_path => 'employee_details[%d].emp_id' , p0 => i));
dbms_output.put_line(apex_json.get_varchar2(p_path => 'employee_details[%d].emp_name' , p0 => i));
dbms_output.put_line(apex_json.get_varchar2(p_path => 'employee_details[%d].emp_salary' , p0 => i));
end loop;
end;

================================================================== another important example  =====================================================================================

declare
json_string_emp clob := '{"employee_details" : [{"emp_id":101},{"emp_name":"jaison"},{"emp_salary":10000},{"dept_id" : 1}]}';

v_emp_id number;
v_emp_name varchar(20);
v_emp_salary number;
v_dept_id number;
emp_count number;
begin
apex_json.parse(json_string_emp);
emp_count := apex_json.get_count(p_path => 'employee_details');

v_emp_id := apex_json.get_number(p_path => 'employee_details[%d].emp_id' , p0 => 1);
v_emp_name := apex_json.get_varchar2(p_path => 'employee_details[%d].emp_name' , p0 => 2);
v_emp_salary := apex_json.get_number(p_path => 'employee_details[%d].emp_salary' , p0 => 3);
dbms_output.put_line(v_emp_id);
dbms_output.put_line(v_emp_name);
dbms_output.put_line(v_emp_salary);

insert into employee_ex (emp_id,emp_name,emp_salary) values (v_emp_id,v_emp_name,v_emp_salary);
end;
select * from employee_ex;


=========================================================================== Example 06 ===============================================================================

declare
json_string clob := '{"employee_details" : [{"emp_name" : "joshest mark"},{"emp_city":"new York"},{"emp_id" : 101},{"emp_salary" : 10000},5,6]}';
begin
apex_json.parse(json_string);
dbms_output.put_line(apex_json.get_count(p_path => '.')); -- 1
dbms_output.put_line(apex_json.get_count(p_path => 'employee_details')); -- 6
dbms_output.put_line(apex_json.get_varchar2(p_path => 'employee_details[%d].emp_name' , p0 => 1));
dbms_output.put_line(apex_json.get_varchar2(p_path => 'employee_details[%d].emp_city' , p0 => 2));
dbms_output.put_line(apex_json.get_varchar2(p_path => 'employee_details[%d].emp_id' , p0 => 3));
end;

======================================================================  Example 07 ==================================================================================

declare
json_data_string clob:= '{"nums" : [1,2,3,4,5,6,7]}';  
begin
apex_json.parse(json_data_string);
dbms_output.put_line(apex_json.get_count(p_path => 'nums'));
dbms_output.put_line(apex_json.get_number(p_path => 'nums[%d]',p0 => 1));
end;

declare
json_data_string clob := '{"nums" : [1,2,3,4,5,6,7,8]}';
json_parse_obj apex_json.t_values;
begin
apex_json.parse(json_parse_obj , json_data_string);
dbms_output.put_line(apex_json.get_count(p_path => 'nums',p_values => json_parse_obj));
dbms_output.put_line(apex_json.get_number(p_path => 'nums[%d]',p0 => 2,p_values => json_parse_obj));
dbms_output.put_line(apex_json.get_number(p_path => 'nums[%d]',p0 => 7,p_values => json_parse_obj));
end;


declare
json_data_string clob := '{"employee_tbl" : [{"emp_id" : 101},{"emp_name":"emp1"},{"emp_salary":2000},{"emp_city":"Delhi"},{"emp_exp":5}]}';
json_parse_data apex_json.t_values;
begin
apex_json.parse(json_parse_data , json_data_string);
dbms_output.put_line(apex_json.get_count(p_path => 'employee_tbl',p_values => json_parse_data));
dbms_output.put_line(apex_json.get_number(p_path => 'employee_tbl[%d].emp_salary',p0 => 3 , p_values => json_parse_data));
end;


declare
json_data_string clob := '{"employee_tbl" : [{"emp_id" : 101},{"emp_name":"emp1"},{"emp_salary":2000},{"emp_city":"Delhi"},{"emp_exp":5}]}';
json_parse_data apex_json.t_values;
l_count number;
begin
apex_json.parse(json_parse_data , json_data_string);
l_count := apex_json.get_count(p_path => 'employee_tbl',p_values => json_parse_data);
--dbms_output.put_line(apex_json.get_count(p_path => 'employee_tbl',p_values => json_parse_data));
for i in 1..l_count loop
dbms_output.put_line(apex_json.get_number(p_path => 'employee_tbl[%d].emp_id',p0 => i , p_values => json_parse_data));
dbms_output.put_line(apex_json.get_varchar2(p_path => 'employee_tbl[%d].emp_name',p0 => i , p_values => json_parse_data));
dbms_output.put_line(apex_json.get_number(p_path => 'employee_tbl[%d].emp_salary',p0 => i , p_values => json_parse_data));
dbms_output.put_line(apex_json.get_varchar2(p_path => 'employee_tbl[%d].emp_city',p0 => i , p_values => json_parse_data));
end loop;
end;




