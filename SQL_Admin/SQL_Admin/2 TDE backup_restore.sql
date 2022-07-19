use master
go

backup certificate tdecerti
	to file ='c:\tdecerti.cer'
	with private key
		(file='c:\tdecertipriv.pvk', 
		encryption by password='ppedvag')
	go

use master
go
create master key encryption by password='ppedvag'
go

create certificate tdecerti 
	from file='c:\tdecerti.cer'
	with private key 
	(file='c:\tdecertipriv.pvk', 
	decryption by password='ppedvag')