/*
SQL Agent

Jobs per Zeitplän
Jobs enthalten Schritte
Warnungen
Proxy Konten

*/


--Warnungen
--Error 208 Ebene 15

select *  from t3

--Ebene 1  - 10.. reine Info
--Ebene 11 bis 16
--Ebene 14
--Eben 17 und höher

--Ebene 15: DAU
--Ebene 16 : DAU
--Ebene 14: Berechtigung

--Ebene 17:

USE [msdb]
GO
EXEC msdb.dbo.sp_add_alert @name=N'Ebene 17', 
		@message_id=0, 
		@severity=17, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=0, 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Ebene 17', @operator_name=N'SQL_Admin', @notification_method = 1


--Error
select * from sys.messages where language_id=1031


GO
