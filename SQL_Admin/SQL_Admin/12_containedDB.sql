EXEC sys.sp_configure N'contained database authentication', N'1'
GO
RECONFIGURE WITH OVERRIDE
GO

--Restore klappt erst, wenn das Feature aktiv ist

Contained DB k�nnen User mit Kennwort haben

Anmeldung an DB 
--> "Login" wird in der DB selbst gehostet  (Backup-->Restore kein Problem mehr

--DB m�ssen Funktione ativ haben
USE [master]
GO
ALTER DATABASE [NorthwindALT] SET CONTAINMENT = PARTIAL WITH NO_WAIT
GO

--teilweise?? es fehlen Auftr�ge

USE [ContDB]
GO
CREATE USER [Max] WITH PASSWORD=N'ppedv2019!'
GO



--Die Verbindug muss mit Server und der DB !! gemacht werden 