USE master
GO
--調整size
ALTER DATABASE dbName MODIFY FILE
 ( NAME = 'dbName_log', SIZE = 5MB )


