--Sind denn ansatzweise optimale Datentypen im Einsatz
--Datenbankdiagramm

--phsyische Kontrolle des DB Datei Auslastung
dbcc showcontig('t1')

---- Gescannte Seiten.............................: 20000  *8 KB
---- Mittlere Seitendichte (voll).....................: 50.79%

--Seiten sind immer 8192 bytes gro�
--8 Seiten am St�ck --> Block
--SQL liest Bock bzw Seitenweise  in RAM von HDD
--Limit pro Seite: max 700 DS, fixen L�ngen eines DS <= 8060
--fixe L�ngen m�ssen in eine Seite passen


create table t34 (id int, spx char(4100),spy char(4100))