==================================================================== Generate json object in PL/SQL ====================================================================


begin
apex_json.initialize_clob_output;
apex_json.open_object;
apex_json.write('emp_name' , 'emp01');
apex_json.write('emp_id' , '1');
apex_json.close_object;
dbms_output.put_line(apex_json.get_clob_output);
end;

====================================================================== Generate object in object ==============================================================

begin
apex_json.initialize_clob_output;
apex_json.open_object('emp_details');
apex_json.open_object;
apex_json.write('emp_name' , 'emp01');
apex_json.write('emp_id' , '1');
apex_json.close_object;
apex_json.close_object;
dbms_output.put_line(apex_json.get_clob_output);
end;


