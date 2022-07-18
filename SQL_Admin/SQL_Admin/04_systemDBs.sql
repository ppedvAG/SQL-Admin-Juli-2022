/*
tempdb
Mülleimer, Zeilenversionierung

model
create database (Kopie der Model)

Backup: besser als Skript


msdb
DB für den Agent (Jobs, Zeitpläne, Verlauf, Emailsystem, Wartungspläne)

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
