SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\cloneDBCreation.log append
Create controlfile reuse set database "dbdev01"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'C:\Oracle\oradata\dbdev01\SYSTEM01.DBF',
'C:\Oracle\oradata\dbdev01\SYSAUX01.DBF',
'C:\Oracle\oradata\dbdev01\UNDOTBS01.DBF',
'C:\Oracle\oradata\dbdev01\USERS01.DBF'
LOGFILE GROUP 1 ('C:\Oracle\oradata\dbdev01\redo01.log') SIZE 51200K,
GROUP 2 ('C:\Oracle\oradata\dbdev01\redo02.log') SIZE 51200K,
GROUP 3 ('C:\Oracle\oradata\dbdev01\redo03.log') SIZE 51200K RESETLOGS;
exec dbms_backup_restore.zerodbid(0);
shutdown immediate;
startup nomount pfile="C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\initdbdev01Temp.ora";
Create controlfile reuse set database "dbdev01"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'C:\Oracle\oradata\dbdev01\SYSTEM01.DBF',
'C:\Oracle\oradata\dbdev01\SYSAUX01.DBF',
'C:\Oracle\oradata\dbdev01\UNDOTBS01.DBF',
'C:\Oracle\oradata\dbdev01\USERS01.DBF'
LOGFILE GROUP 1 ('C:\Oracle\oradata\dbdev01\redo01.log') SIZE 51200K,
GROUP 2 ('C:\Oracle\oradata\dbdev01\redo02.log') SIZE 51200K,
GROUP 3 ('C:\Oracle\oradata\dbdev01\redo03.log') SIZE 51200K RESETLOGS;
alter system enable restricted session;
alter database "dbdev01" open resetlogs;
exec dbms_service.delete_service('seeddata');
exec dbms_service.delete_service('seeddataXDB');
alter database rename global_name to "dbdev01.tera.com";
ALTER TABLESPACE TEMP ADD TEMPFILE 'C:\Oracle\oradata\dbdev01\TEMP01.DBF' SIZE 20480K REUSE AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED;
select tablespace_name from dba_tablespaces where tablespace_name='USERS';
alter system disable restricted session;
connect "SYS"/"&&sysPassword" as SYSDBA
@C:\Oracle\11g\R2\demo\schema\mkplug.sql &&sysPassword change_on_install change_on_install change_on_install change_on_install change_on_install change_on_install C:\Oracle\11g\R2\assistants\dbca\templates\example.dmp C:\Oracle\11g\R2\assistants\dbca\templates\example01.dfb C:\Oracle\oradata\dbdev01\example01.dbf C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\ "'SYS/&&sysPassword as SYSDBA'";
connect "SYS"/"&&sysPassword" as SYSDBA
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup restrict pfile="C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\initdbdev01Temp.ora";
select sid, program, serial#, username from v$session;
alter database character set INTERNAL_CONVERT WE8MSWIN1252;
alter database national character set INTERNAL_CONVERT AL16UTF16;
alter user sys account unlock identified by "&&sysPassword";
alter user system account unlock identified by "&&systemPassword";
alter system disable restricted session;
