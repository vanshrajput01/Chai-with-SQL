-- Function in PL/SQL

-- Simple Example 01 :- Add Two numbers 

-- Declare function

create or replace function add_values(value01 number,value02 number) return number
is total_of_values number;
begin
total_of_values := value01 + value02;
return total_of_values;
end;


-- Call Function

declare
total number;
begin
total := add_values(20,30);
dbms_output.put_line('Sum is : - ' || total);
end;


