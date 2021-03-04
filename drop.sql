SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF
SET PAGESIZE 0
SPOOL supprTables.sql
select 'drop table '||table_name||' cascade constraints;' from user_tables;
SPOOL OFF

SPOOL supprProcedure.sql
select 'drop procedure '||USER_PROCEDURES.OBJECT_NAME || ';' from USER_PROCEDURES where OBJECT_TYPE = 'PROCEDURE';
SPOOL OFF

SET ECHO ON
/

@supprTables.sql
@supprProcedure.sql
