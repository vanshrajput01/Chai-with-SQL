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


-- Explicit Cursor 
-- these are two ways to define explicit Cursor
-- 1. OPEN , FETCH and CLOSE 
-- 2.loop



-- if fetch single trecord in table;
declare
e_id employee.emp_id%type;
cursor c1 is
  select emp_id from employee;
begin
  open c1;
    fetch c1 into e_id;
    dbms_output.put_line(c1%rowcount || '-' || e_id);
  close c1;
end;










