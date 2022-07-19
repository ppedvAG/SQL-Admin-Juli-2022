

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