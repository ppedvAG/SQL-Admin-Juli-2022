/*

Instanzen

kein Zugriff auf Instanz HR

Berechtigung kan man ausschliessen, weil Error: keine Verbindung
Browserdienst läuft nicht (per default deaktiviert)
Firewall: 
Port: 1434 UDP  des Browserdienstes
Port der Instanz random oder auf irgn einen anderen Port fixiert

falscher Port falscher Server


SQLExpress kommt i mer als Instanz


Pfade
Binärkram: egal
DB:  Trenne Log von Daten physikalisch


Authentifizierung
NT oder gemischte Auth (SA deakiveren )
lok Admins sind nicht per default SQL Admins


MAXDOP: Abfragen werden entweder mit 1 CPU oder mit allen ausgeführt
				  Regel: max 8 oder Anzahl der Kerne

RAM 
MAX:  Gesamt -OS  ist sofrt umgesetzt
MIN 0  nichts vorreserviert macht Sinn bei Konkurrenz . Muss erst mit Daten belegt werden


1. 8560   --> 3456
2. 7654  ---> 7345



*/
create database testdb
--Error: evtl komplett andere HDDs
--          begint mit 8 MB pro Log und Datendatei
--          Wachstum:  +64MB  (1000MB)
--          Anfangsgröße groß genug wählen 
--Wo kann man das kontrollieren?
--auf der DB --> Berichte --> DAtenträgerverwendjung


--DB Design: 

--Datentyp:  best möglichen Datentyp. Nicht übertreiben datetime / date
--Normalisierung PK --FK Beziehungen ...> Datenbankdiagramm
-- PK sollten immer Beziehungen zu FK haben

--physikalische Design
----Seiten  (8192bytes)  8 Seiten am Stück = Block
