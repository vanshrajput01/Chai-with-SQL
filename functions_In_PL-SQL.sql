-- Function in PL/SQL

-- Simple Example 01 :- Add Two numbers 

-- Declare function

create or replace function add_values(value01 number,value02 number) return number
is total_of_values number;
begin
total_of_values := value01 + value02;
return total_of_values;
end;


