/*

Instanzen

kein Zugriff auf Instanz HR

Berechtigung kan man ausschliessen, weil Error: keine Verbindung
Browserdienst l�uft nicht (per default deaktiviert)
Firewall: 
Port: 1434 UDP  des Browserdienstes
Port der Instanz random oder auf irgn einen anderen Port fixiert

falscher Port falscher Server


SQLExpress kommt i mer als Instanz


Pfade
Bin�rkram: egal
DB:  Trenne Log von Daten physikalisch


Authentifizierung
NT oder gemischte Auth (SA deakiveren )
lok Admins sind nicht per default SQL Admins


MAXDOP: Abfragen werden entweder mit 1 CPU oder mit allen ausgef�hrt
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
--          Anfangsgr��e gro� genug w�hlen 
--Wo kann man das kontrollieren?
--auf der DB --> Berichte --> DAtentr�gerverwendjung


--DB Design: 

--Datentyp:  best m�glichen Datentyp. Nicht �bertreiben datetime / date
--Normalisierung PK --FK Beziehungen ...> Datenbankdiagramm
-- PK sollten immer Beziehungen zu FK haben

--physikalische Design
----Seiten  (8192bytes)  8 Seiten am St�ck = Block



/*

Restore einer DB

--Verz DEMO ... nichts drin

--Security
--Zugriff braucht der benutzer der das ausf�hrt
-- Zugriff auf ext Ressourcen, wird immer mit dem Dienstkonto erledigt
---- bei Zeitplan = Agent
----ohne =SQL Dienst

auf lokale Ressourcen wird immer das NT Service KOnto verwendet
auf remote Ressourcen wird das DOMKonto

schulung\svcSQL

--Dateiendung  evtl fehlt diese-- alle anzeigen lassen
--beim Anzeigen von Laufwerken in SSMS sind immer die lok LW des SQL Servers gemeint

--kein Restore auf �lteren SQL Serverf Versionen von neueren DBs

select @@microsoftversion

*/
use master
--eine DB mit Restoring Zustand lauff�hig machen
restore database restoremedb


--25 sec
select 1600/25  ---64MB/sec
--2 sec
select 1100/2 ---550 MB/sec

--JamesBond hat keinen Zugriff mehr auf whoamiDB?
--> kein Login 

--wenn mann DB von einem anderen Server restored, dann fehlen neben Logins
--auch Auftr�ge 


--Login reparieren

--neuesLogin
--JamesBond SID 15    User: SID 26

--Workaround
--ideale Rechtevergabe
--L�sche JamesBond aus DB
--Login anlegebn--> Usermapping-- Rollenmitgliedschaft wieder pflegen


--verwaiste User einer DB
sp_change_users_login 'Report'

--Login wird apssend zum User angelegt
sp_change_users_login 'Auto_fix' 'JamesBond', ,NULL, 'ppedvag01!'

--Usermapping
-sp_change_users_login 'Update_one', 'JamesBond', 'JamesBond' 

--



