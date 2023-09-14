EXEC sp_helptext credits_view
go

select s.text FROM sys.syscomments as s
JOIN sys.views as v
ON s.id = v.object_id
WHERE v.name = 'credits_view'
go

select s.definition FROM sys.sql_modules as s
JOIN sys.views as v
ON s.object_id = v.object_id
WHERE v.name = 'credits_view'
go


select OBJECT_DEFINITION(OBJECT_ID('dbo.credits_view'))
go
 




