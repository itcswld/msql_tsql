USE edusys 
GO
DECLARE @table_name char(20)
SET @table_name = 'student'
EXEC ('SELECT * FROM ' + @table_name)




