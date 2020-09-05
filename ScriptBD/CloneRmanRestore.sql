SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\CloneRmanRestore.log append
startup nomount pfile="C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\init.ora";
@C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\rmanRestoreDatafiles.sql;
spool off
