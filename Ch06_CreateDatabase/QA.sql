--When meet up with "Cannot drop database because it is currently in use" error
--option1: set single_user with rollback immediate
use master 
go
alter database [dbName] set single_user with rollback immediate
drop database [dbName]

--option2: SP_WHO to see who connected and KILL if needed
--1.First check the connected databases
SP_WHO
--2.Second Disconnect your database

DECLARE @DatabaseName nvarchar(50)
SET @DatabaseName = N'your_database_name'

DECLARE @SQL varchar(max)

SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
FROM MASTER..SysProcesses
WHERE DBId = DB_ID(@DatabaseName) AND SPId <> @@SPId

--3. SELECT @SQL 
EXEC(@SQL)

--F4.INALLY DROP IT

drop database your_database
