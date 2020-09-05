set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
ACCEPT sysmanPassword CHAR PROMPT 'Enter new password for SYSMAN: ' HIDE
ACCEPT dbsnmpPassword CHAR PROMPT 'Enter new password for DBSNMP: ' HIDE
host C:\Oracle\11g\R2\bin\orapwd.exe file=C:\Oracle\11g\R2\database\PWDdbdev01.ora force=y
@C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\CloneRmanRestore.sql
@C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\cloneDBCreation.sql
@C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\postScripts.sql
@C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\lockAccount.sql
@C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\postDBCreation.sql
