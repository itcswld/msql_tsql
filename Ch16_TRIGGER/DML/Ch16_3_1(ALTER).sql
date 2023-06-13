USE edusys
GO
ALTER TRIGGER updCheck
ON proffessor 
AFTER UPDATE
AS 
DECLARE @count int,
        @rank varchar(10),
        @dep varchar(5)
SET @count = 0
IF UPDATE(title)
BEGIN
   SELECT @rank = title FROM Inserted 
   PRINT 'updated title: ' + @rank
   SET @count = @count + 1
END 
IF UPDATE(dept)
BEGIN
   SELECT @dep = dept FROM Inserted
   PRINT 'updated dept: ' + @dep
   SET @count = @count + 1
END
IF @count > 0
BEGIN
  PRINT 'updated [' + CONVERT(varchar, @count) +
        '] columns!'
  ROLLBACK TRAN -- 如果由更新就回復資料
END
GO

UPDATE proffessor 
SET title = 'lecturer'
WHERE no = 'I003'







