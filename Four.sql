-- --system defined string function in SQL

--ASCII
--CHAR
--REPLACE
--DUMP
--INSTR
--SUBSTR
--LENGHT
--LOWER
--UPPPER
--INITCAP
--LPAD
--RPAD
--LTRIM
--RTRIM
--TRIM
--TRANSLATE

--1.ASCII

select ASCII('A')ASCII_VALUE_A from DUAL;

select ASCII('a')ASCII_VALUE_a from dual;

select ASCII(' ') from dual; 

--2.char()

select char(45) as t1 from dual;

--3.Dump

select dump('1') from dual;

--INSTR :- that return index of substring

select INSTR('this is a audio playlist','is',1,2) from dual; 
--1 is index , 2 is occurence

select INSTR('Oracle O','O') from dual; -- by default first occurence of O index return kare ga

select INSTR('my name is name','m',1,1) from dual;

select INSTR('name is name','n',1,2) from dual; 

--SUBSTR

select SUBSTR('Orcale SQL',1,6) from dual;
--Oracle

select SUBSTR('Orcale SQL',2,1) from dual;
--r

select SUBSTR('SQL',1,1) from dual;
-- S

select length('this is name') from dual;
--12

select length('harsh') from dual;
--5

select length('34') from dual;
--2

select replace('This',s,i) from dual;
