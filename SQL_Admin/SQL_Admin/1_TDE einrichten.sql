--TDE

--MASTER Datenbank muss master key besitzen
use master
	create master key
		encryption by password ='ppedvag01!'
go


--Server Zertifikat in master DB

use master
go

create certificate ServerCert_01 with subject='TDE ZERTI';
go


--DB die verschlüsselt werden soll benötigt Zertifkat

create database tdeSecret
go

use tdeSecret
go

create database encryption key with algorithm=AES_256
	encryption by server certificate servercert_01
	
--Warnung: Zertifikat muss gesichert werden..

--nun DB verschlüsseln
use master;
go

alter database tdesecret
set encryption on;
go


--guggen
select * from sys.dm_database_encryption_keys
--3 encrypted
--1 nicht verschl..2 in arbeit; 4 key wird geändert, 5 wird entschl

--wie wird man das wieder los
use master ;
go

alter database tdesecret
set encryption off


select * from sys.dm_database_encryption_keys

--Sichern ..und restoren

use master
go

backup certificate servercert_01
	to file ='c:\_backup\servercert_01.cer'
	with private key
		(file='c:\_backup\servercert_01_priv.pvk', 
		encryption by password='ppedvag01!')
	go



--auf  2ten Server
use master
go
create master key encryption by password='ppedvag'
go


create certificate servercert_01
	from file='c:\sqldb\servercert_01.cer'
	with private key 
	(file='c:\sqldb\servercert_01_priv.pvk', 
	decryption by password='ppedvag')