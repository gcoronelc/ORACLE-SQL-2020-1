--ROLES DE UN USUARIO

select * from dba_role_privs
where grantee ='VENTAS';

--ROLES DE USUARIO CONECTADO (ACTUAL)
select username, granted_role
from user_role_privs;

--PRIVILEGIOS DE UN USUARIO  
select * from USER_sys_privs;

--TABLESPACE DE UN USUARIO
select default_tablespace
from DBA_USERS
where username='SCOTT';

