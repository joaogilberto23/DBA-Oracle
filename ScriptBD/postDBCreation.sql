SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\postDBCreation.log append
execute DBMS_AUTO_TASK_ADMIN.disable();
select 'utl_recomp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute utl_recomp.recomp_serial();
select 'utl_recomp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute dbms_swrf_internal.cleanup_database(cleanup_local => FALSE);
commit;
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='C:\Oracle\11g\R2\database\spfiledbdev01.ora' FROM pfile='C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\init.ora';
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
host C:\Oracle\11g\R2\bin\emca.bat -config dbcontrol db -silent -DB_UNIQUE_NAME dbdev01 -PORT 1521 -EM_HOME C:\Oracle\11g\R2 -LISTENER LISTENER -SERVICE_NAME dbdev01.tera.com -SID dbdev01 -ORACLE_HOME C:\Oracle\11g\R2 -HOST dbserver01 -LISTENER_OH C:\Oracle\11g\R2 -LOG_FILE C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\emConfig.log;
spool off
