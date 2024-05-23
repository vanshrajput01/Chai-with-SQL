declare
three_char varchar(10);
cursor c1 is 
select * from employees;
begin
for i in c1 loop
select substr(i.firstname,-3,length(i.firstname)) into three_char from dual;
if(three_char like '%a%' or three_char like '%e%' or three_char like '%i%' or three_char like '%o%' or three_char like '%u%') then
dbms_output.put_line(i.firstname);
end if;
end loop;
end;
