USE master
GO
DROP DATABASE dbName1, dbName2

--Cannot drop database "edusys" because it is currently in use.
use master go
 alter database [MyDatbase] set single_user with rollback immediate

 drop database [MyDatabase]
