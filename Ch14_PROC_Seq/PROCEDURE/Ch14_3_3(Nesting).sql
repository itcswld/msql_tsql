USE edusys
GO       
--@@NESTLEVEL 取得目前呼叫的層數
create proc proc_level @proc_name varchar(30)
as
print 'start level: ' + CAST(@@nestlevel as char)
EXEC @proc_name --level: 2
print 'end level:' + CAST(@@nestlevel as char)
GO

CREATE proc nest_level AS
PRINT 'level: ' + CAST(@@nestlevel as char)
GO
--start level: 1                             
--level: 2                             
--end level:1  
