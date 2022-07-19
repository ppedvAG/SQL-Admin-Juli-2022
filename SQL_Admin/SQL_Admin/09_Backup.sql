/*
Was kann passieren?

DB Crash--komplett defekt
               --eine Datei kaputt (ldf/mdf)

logische Fehler in der DB, aber DB funktioniert 
--evtl ist nur ein Teil der DAten verloren gegangen
Restore mit geringst mögichen Datenverlust

Server weg, aber HDDs sind noch da
Restore einer DB auf einen anderen Server

Was wäre, wenn ich wüsset, dass gleich was passieren kann?
--System meldet schon Fehler... schnell ne Sicherung
--bei Softwareupdates




Backupformen

Vollständige Sicherung   V
Differentielle     D
Transaktionsprotokollsicherung    T

Wiederherstellungsmodel:   Einfach  Massenprotokolliert  Vollständige

Einfach
fertige (committted) TX werden automatisch aus dem Log gelöscht
--keine Sicherung des TP
-- es werden INS UP DEL BULK Befehle rudimentär protokolliert


Massenprotokolliert
..wie einfach
--es wird nichts autom. aus dem TP gelöscht
!! nur die Scherung des LogFiles löscht Dinge aus dem Logfile, ausser Model einfach
--die TX aus dem Logfile werden in das Backup geschrieben
--auch hier wäre ein Restore auf Sekunde möglich, wenn kein BULK lief
--muss: TP Backup

Vollständig
--protokolliert sehr ausführlich
--Effekt: Restore auf Sekunde möglich
muss: TP backup , da sonst viel zu groß




V    TTTT      D      TTTTT      D    TTTTT  D  TTTTT
V                                                              D  TTTTT

V    TxTT           TTTTT          TTTTT  D  TTTTT


VollSicherung
Checkpoint Daten aus RAM auf HDD wegschreiben
sichert Dateiname/Größe und Pfade
es werden nur die Daten gesichert
Es werden zu einem best Zeitpunkt gesichert


DiffSicherung
sichert alle Blöcke weg, seit dem letzten V

T
man muss alle Ts wieder restoren seit dem letzte D (alternativ (V)


Welcher Restore ist demnach der schnellste?
V
---> so häufige wie möglich

Wie lange dauert der Restore des vorletzten Ts?
solange wie TX selbst dauerten die im T enthalten 
---> bei Full...in kürzeren Abständen sichern 30min

--das D sollte immer wieder eingestreut werden, damit 
der Restore sicherer und auch verkürzt






















-




*/