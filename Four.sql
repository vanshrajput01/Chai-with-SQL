


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


--string function in sql

--ASCII
--CHAR
--Replace
--Dump
--Instr
--Substr
--Upper
--Lower
--Initcap
--Lpad
--Rpad
--Rtrim
--Ltrim
--trim
--translate
--Length


--ASCII

select ascii('-') from dual;
--45

--Char
select char(45) from dual;

--  Replace

select replace('This is my Tree','T','t') from dual;

--this is my tree

--Instr
select instr('Orcale software','r',1,2) from dual;

--14

--Substr

select substr('this is good boy.',1,4) from dual;

--this

--Dump
select dump('1012') from dual;

--Typ=96 Len=4: 49,48,49,50

--Upper , lower , initcap

select upper('name') from dual;
--NAME
select lower('ORACLE') from dual;
--oracle

select initcap('my name is this') from dual;

--My Name Is This

--RPAD & Lpad
select rpad('2456',5,'0') from dual;
--24560

select lpad('3456',6,'12') from dual;
--123456

--trim

select '   Oracle  ' from dual;
--   Oracle 


select trim('   Oracle  ') from dual;
--Oracle

--Translate

select TRANSLATE('This is good boy g','good','mans') from dual;

select TRANSLATE('This is good boy g','good','1234') from dual;
--This is 1234 b2y 1

select replace('This is good boy g','good','1234') from dual;
--This is 1234 boy g






