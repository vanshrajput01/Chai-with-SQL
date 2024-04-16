-- Anonymous code block in PL/SQL
-- Example 01 :- 
declare
num1 int := :num1;
num2 int := :num2;
total int;

begin
total := num1 + num2;
dbms_output.put_line('total num' || '-' || total);

end;

-- Example 02 :-

num1 int := 10;
num2 int := 20;
total int;

begin
total := num1 + num2;
dbms_output.put_line('total num' || '-' || total);

end;





