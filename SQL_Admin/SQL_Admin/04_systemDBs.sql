/*
tempdb
M�lleimer, Zeilenversionierung

model
create database (Kopie der Model)

Backup: besser als Skript


msdb
DB f�r den Agent (Jobs, Zeitpl�ne, Verlauf, Emailsystem, Wartungspl�ne)

Backup: ja 


master
Logins, Datenbanken, Konfiguration
Herz

Backup: ja


*/
USE [master]
GO
ALTER DATABASE [model] SET RECOVERY SIMPLE WITH NO_WAIT
GO
