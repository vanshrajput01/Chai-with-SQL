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

