create table users7
(user_name varchar2(20),
Sec_Lev Int);

Insert Into Users7 Values('SCOTT', 2);


select mod(dbms_crypto.randomnumber, 3) + 1
from DUAL

update SCOTT.emp7
set sec_lev = mod(dbms_crypto.randomnumber, 3) + 1;

CREATE OR REPLACE FUNCTION fun7(
 schema_var IN VARCHAR2, 
 table_var IN VARCHAR2 
) 
 RETURN VARCHAR2 
IS 
val1 varchar2(400);
return_val VARCHAR2 (400);
BEGIN 
select sys.users7.sec_lev into val1 from sys.users7 where 
sys.users7.user_name = upper (user);
return_val := 'scott.emp7.sec_lev<=' || to_char (val1);
RETURN return_val; 
END fun7; 

 

begin
 dbms_rls.add_policy(
 object_schema => 'scott',
 object_name =>'emp7',
 policy_name =>'policy7',
 function_schema =>'sys',
 policy_function =>'fun7',
 statement_types =>'select');
 end;


begin
dbms_rls.drop_policy(‘scott’,’emp7’,'policy7');
end;


select * from SCOTT.emp7
