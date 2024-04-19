--  For Update clause in PL/SQL

-- Without For update Clause.
declare
cursor c1 is
select * from employee
where dept_id = 2;

begin
for i in c1 loop
dbms_lock.sleep(10);  --Program wait 10 sec and then perform these below tasks.
dbms_output.put_line('employee details is : - '|| i.emp_name || ' ' || i.emp_salary);
update employee
set emp_salary = 1700
where dept_id = 2;
dbms_output.put_line('Update employee details is '||i.emp_name || ' ' || i.emp_salary);
end loop;

end;

-- ye task be parallel run hoga. or yaha salary update he ne hoge.
delete from employee
where dept_id = 2;

