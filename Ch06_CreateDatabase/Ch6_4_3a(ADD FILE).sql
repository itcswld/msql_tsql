USE master
GO
ALTER DATABASE dbName ADD LOG FILE
 ( NAME = 'dbName_log2',
   FILENAME = 'D:\Data\dbName_log2.ldf',
   SIZE = 5MB,
   MAXSIZE=10MB,
   FILEGROWTH=1MB )

