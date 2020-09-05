OLD_UMASK=`umask`
umask 0027
mkdir C:\Oracle\11g\R2\database
mkdir C:\Oracle\admin\dbdev01\adump
mkdir C:\Oracle\admin\dbdev01\dpdump
mkdir C:\Oracle\admin\dbdev01\pfile
mkdir C:\Oracle\cfgtoollogs\dbca\dbdev01
mkdir C:\Oracle\oradata\dbdev01
umask ${OLD_UMASK}
set ORACLE_SID=dbdev01
set PATH=%ORACLE_HOME%\bin;%PATH%
C:\Oracle\11g\R2\bin\oradim.exe -new -sid DBDEV01 -startmode manual -spfile 
C:\Oracle\11g\R2\bin\oradim.exe -edit -sid DBDEV01 -startmode auto -srvcstart system 
C:\Oracle\11g\R2\bin\sqlplus /nolog @C:\Users\Administrador\Desktop\DBA-Oracle\ScriptBD\dbdev01.sql
