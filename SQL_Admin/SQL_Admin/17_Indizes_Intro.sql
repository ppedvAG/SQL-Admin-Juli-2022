/*

NON CL IX

Kopie von Daten in sortierter Form
darauf entsteht ein Baum, der mit Sprüngen und Bereichen arbeitet

dann optimal, wenn rel wenig rauskommt
Kandidaten
Primary Key ID Identity 

pro Tabelle ca 1000 mal anlegen

jedes Update , Insert, Delete ist erst dann fertig, wenn alle Indizes aktualilsiert wurden


--> entferne überflüssige  (weil doppelt und dreifach) Indizes  bzw Indizs, die keiner verwendet
Tipp: Brent Ozar FirstResponderKit




CL IX = Tabelle in sortierter Form  Heap gibts nicht mehr

nur 1 mal pro Tabelle
optimal bei Bereichsabfragen

Kandidaten: orderdate, PLZ, 
TIPP:.. pro Tabelle immer zuerst den CL IX anlegen


--Auswirkung von Indizes
--SELECT können immens Ressourcen .. statt 30sec in 0 sec
-- RAM weniger
--weniger IO weil weniger Seiten
--Vermeidung von Sperren

--mit IX gibts auch Sperrniveaus, die wesentlich feiner gesetzt werden können, wenn passende IX vorhanden sind
---Sperren: Zeile , Seite, Block



--Wie finde ich überflüssige Indizes?

*/

--DMV


select * from sys.dm_db_index_usage_stats -- Stat bzgl der Verwendung von IX
--wenn viele Seek, dann ok
--wenn viele Scans, dann neu justieren.. evtl IX auf andere Spalte legen
--wenn kein Seek und kein Scan, aber Updates, dann löschen.. kostet nur und bringt nix

--Brent Ozar
sp_blitzindex

IX A B C
IX A B


--Wartung Indizes  jeden tag !!!!

EXEC dbo.sp_BlitzIndex @DatabaseName='Northwind', @SchemaName='dbo', @TableName='CustomerCustomerDemo';





