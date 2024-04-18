-- Triggers in PL/SQL

-- Trigger systax in PL/SQL

-- CREATE OR REPLACE TRIGGER TRIGGER_NAME
-- [BEFORE/AFTER/INSTEAD OF]
-- [INSERT/UPDATE/DELETE]
-- [OF COLUMN_NAME] Optional Part
-- ON TABLE_NAME
-- [REFERENCE OLD ASO NEW AS N] Optional Part
-- FOR EACH ROW -- IF THIS IS ROW LEVEL TRIGGER
-- BEGIN
-- END;


-- Example of ************************   BEFORE UPDATE ROW LEVEL TRIGGER  **************************************************************
create or replace trigger befer_update_row
before
update
on employee
for each row
begin
dbms_output.put_line('************Row Level - Before update Row level trigger *****************');
end;



