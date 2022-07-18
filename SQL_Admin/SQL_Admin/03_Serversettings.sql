--Serversettings


/*


RAM
MIN: 0  (setzt man einen Wert wird der erst eine Rolle spielen , wenn der auch belegt wurde)
MAX: 2,1 PB  (6000MB -OS 2GB)= 4000
MAX gilt sofort ihne Neustart (nur der Datenpuffer)

der Max Wert regel, dass andere SW auch Speicher bekommen können
der MIN Wert regelt, dass der SQL genug hat


HDD
Trenne Daten von Logfiles physikalisch (neustart fällig)
Backup immer komprimieren
Backup Checksum

CPU
MAXDOP .. die Zahl sollte = Anzahl der Kerne sein, aber nicht mehr als 8
--Anzahl der Kerne ..... --> auch bei tempdb
--Evtl weitere Dateien hinzufügen, durch Virt plötzlich mehr Kerne zur Verfügung stehen



*/