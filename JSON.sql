-- APEX_JSON IN PL-SQL

-- Example 01 :-

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
