

-- Package in PL-SQL



--Package Spec
create or replace package emp_pkg as
procedure emp_proce01;
procedure emp_proce2(
v_dept_id in number,
v_count out number
);

end emp_pkg;

--Package Body

create or replace package BODY emp_pkg as

procedure emp_proce01 as
begin
dbms_output.put_line('I am Procedure 1');
end;

procedure emp_proce2(
v_dept_id in number,
v_count out number
)as
begin
select count(*) into v_count from employee
where dept_id = v_dept_id;
end;

end emp_pkg;


-- Call Package

declare
v_count number;
begin
emp_pkg.emp_proce2(1,v_count);
dbms_output.put_line(v_count);
end;


begin
emp_pkg.emp_proce01();
end;



