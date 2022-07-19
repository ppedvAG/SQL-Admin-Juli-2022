--VOLL
BACKUP DATABASE [Northwind] TO  DISK = N'D:\_BACKUP\Northxxwind.bak' WITH NOFORMAT, NOINIT,  NAME = N'Northwind-Full', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--DIFF
BACKUP DATABASE [Northwind] TO  DISK = N'D:\_BACKUP\Northxxwind.bak' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'Northwind-DIFF ', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--LOG
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northxxwind.bak' WITH NOFORMAT, NOINIT,  NAME = N'Northwind-TP',  SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--V  TTT  D TTT D TTT

--2022-07-19T10:48:54.2792561+02:00


/*
Was kann passieren?

DB Crash--komplett defekt
               --eine Datei kaputt (ldf/mdf)

logische Fehler in der DB, aber DB funktioniert 
--evtl ist nur ein Teil der DAten verloren gegangen
Restore mit geringst m�gichen Datenverlust

Server weg, aber HDDs sind noch da
Restore einer DB auf einen anderen Server

Was w�re, wenn ich w�sset, dass gleich was passieren kann?
--System meldet schon Fehler... schnell ne Sicherung
--bei Softwareupdates




Backupformen

Vollst�ndige Sicherung   V
Differentielle     D
Transaktionsprotokollsicherung    T

Wiederherstellungsmodel:   Einfach  Massenprotokolliert  Vollst�ndige

Einfach
fertige (committted) TX werden automatisch aus dem Log gel�scht
--keine Sicherung des TP
-- es werden INS UP DEL BULK Befehle rudiment�r protokolliert


Massenprotokolliert
..wie einfach
--es wird nichts autom. aus dem TP gel�scht
!! nur die Scherung des LogFiles l�scht Dinge aus dem Logfile, ausser Model einfach
--die TX aus dem Logfile werden in das Backup geschrieben
--auch hier w�re ein Restore auf Sekunde m�glich, wenn kein BULK lief
--muss: TP Backup

Vollst�ndig
--protokolliert sehr ausf�hrlich
--Effekt: Restore auf Sekunde m�glich
muss: TP backup , da sonst viel zu gro�




V    TTTT      D      TTTTT      D    TTTTT  D  TTTTT
V                                                              D  TTTTT

V    TxTT           TTTTT          TTTTT  D  TTTTT


VollSicherung
Checkpoint Daten aus RAM auf HDD wegschreiben
sichert Dateiname/Gr��e und Pfade
es werden nur die Daten gesichert
Es werden zu einem best Zeitpunkt gesichert


DiffSicherung
sichert alle Bl�cke weg, seit dem letzten V

T
man muss alle Ts wieder restoren seit dem letzte D (alternativ (V)


Welcher Restore ist demnach der schnellste?
V
---> so h�ufige wie m�glich

Wie lange dauert der Restore des vorletzten Ts?
solange wie TX selbst dauerten die im T enthalten 
---> bei Full...in k�rzeren Abst�nden sichern 30min

--das D sollte immer wieder eingestreut werden, damit 
der Restore sicherer und auch verk�rzt








--Fall1: DB ist ok, aber es hat sich ein Fehler eingeschlichen.
---zb update ohne where auf Tab Kunden

--Restore einer Tabelle ist er se gar nicht m�glich
--DB restore unter einen DB Name f�r einen Zeitpunkt vor dem Disaster

--DB Namen �ndern  
--Dateinamen oder PFad �ndern
--Fragementsicherung  ausschalten

--Fall 2:
--Backup auf anderen Server restoren

--Backupdatei zum Backup Ordner der Zeilinstanz kopieren


--Fall3: Server tot, aber Dateien leben (teilweise)
--DB anf�gen (Men� Datenbanken).. mdf angeben

--falls das Logfile fehlt..: Logfile beim Anf�gen entfernen.. Dann ok.. ein neues Logfile wird erstellt

--Was wenn mdf weg, aber Logfile noch da..?--> doof


--Fall 4: Fehler in DB (logischer Fehler)
--Restore der DB ist notwendig! Mit geringst m�glichen Datenverlust

V D TT
letzte T Sicherung um 10:30

Error um 10:47 
jetzt: 10:50

n�chste Sicherung : T um 11 Uhr


Idee1:
V D TT (bis 10:30) restore : 17 min

Idee2:
Sicherung von T um 10:50 dauert 3 min
Restore bis 10:46
Backup ist online 


Idee2b
--DB Einzelbenutzermodus---alle User runterkicken und es darf keiner mehr drauf
--Backup des T um 10:50 
--Restore von 10:46

*/
USE [master]
ALTER DATABASE [Northwind] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-07-19_11-55-03.bak' WITH NOFORMAT, NOINIT,  NAME = N'Northwind_LogBackup_2022-07-19_11-55-03', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\Northxxwind.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\Northxxwind.bak' WITH  FILE = 10,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northxxwind.bak' WITH  FILE = 11,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northxxwind.bak' WITH  FILE = 12,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northxxwind.bak' WITH  FILE = 13,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-07-19_11-55-03.bak' WITH  NOUNLOAD,  STATS = 5,  STOPAT = N'2022-07-19T11:29:58'
ALTER DATABASE [Northwind] SET MULTI_USER

GO



V TTT D TTT x D 
V                      D T

V    TTT  D TTT D TTT      D  TT
V                                      D  TT
V            D TT


VVVV DDD TTT D TT

--Fall 5: Wenn ich w��te, dass gleich as passieren kann

--Snapshot...






























-




*/