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
c:backup..model..model_2022_07_18_1430236523.bak


--Tipp: Wartungsplan.. Sicherung SystemDBs
