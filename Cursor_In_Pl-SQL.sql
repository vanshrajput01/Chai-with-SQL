-- Cursor in PL/SQL
-- Two type of curosr in PL/SQL
-- 1.Implicit cursor
-- 2.explicit curosr

-- 1. Implicit cursor
declare
e_name employee.emp_name%type;
begin
  select emp_name into e_name 
  from employee
  where emp_id = :emp_id_no;
  dbms_output.put_line('Employee details is : -' || e_name);
end;
