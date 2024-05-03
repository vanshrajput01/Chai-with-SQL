-- Execute immediate
-- Example 01 :- 

declare
v_sql varchar(200);
v_count number;
begin
v_sql := 'select count(*) from employee';
execute immediate v_sql into v_count;
dbms_output.put_line(v_count);
end;
