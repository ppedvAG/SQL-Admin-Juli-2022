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






















-




*/