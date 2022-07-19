

-- Create the database snapshot
CREATE DATABASE DBSnapshotName ON
( NAME = LogNamederDatendateiderOrgDb, 
FILENAME = 'PfadzurSNDatendatei   c:\..\sndb.mdf' )
AS SNAPSHOT OF OrgDB;
GO


create database SN_1200_Nw --SNapshotDB
ON
(name=northwind, ---logischer Name der der DAtendatei aus der Org DB
Filename='D:\_SQLDBDATA\sn_nw_1200.mdf') --neue Datei des Snapshot
as
snapshot of northwind --Org DB

--restore aus Snapshot


--es darf keiner auf dem Snapshot und keiner auf der OrgDB sein

use master;
--nur SPID über 50 sind UserProzesse
sp_who

select * from sysprocesses where dbid=db_id('Northwind')
select db_id('Northwind') --das gleiche für den Snapshot

--sollte sehr schnell klappen
restore database northwind from database_snapshot = 'SN_1200_Nw'

--Fragen
--Kann man mehrere Snapshots machen?
-- Ja

--Kann man Snapshots sichern?
--nein

--Kann man die OrgDB sichern?
-- ja

--Kann man einen Snapshot restoren?
--hä?? kein Backup kein restore

--Kann man die OrgDB restoren aus einer normalen Sicherung heraus?
--Nein.. Error wg Snapshot. Daher zuerst alle Snapshots löschen ,dann restore




