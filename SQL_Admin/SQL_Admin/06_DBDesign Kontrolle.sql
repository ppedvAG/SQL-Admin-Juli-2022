--Sind denn ansatzweise optimale Datentypen im Einsatz
--Datenbankdiagramm

--phsyische Kontrolle des DB Datei Auslastung
dbcc showcontig('t1')

---- Gescannte Seiten.............................: 20000  *8 KB
---- Mittlere Seitendichte (voll).....................: 50.79%

--Seiten sind immer 8192 bytes groß
--8 Seiten am Stück --> Block
--SQL liest Bock bzw Seitenweise  in RAM von HDD
--Limit pro Seite: max 700 DS, fixen Längen eines DS <= 8060
--fixe Längen müssen in eine Seite passen


create table t34 (id int, spx char(4100),spy char(4100))