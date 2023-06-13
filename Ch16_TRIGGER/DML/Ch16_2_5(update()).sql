USE edusys
GO
CREATE TRIGGER updCheck
ON proffessor 
AFTER UPDATE
AS 
DECLARE @count int = 0
SET @count = 0
IF UPDATE(title) --UPDATE(col_name)
BEGIN
   PRINT 'updated title column!'
   SET @count = @count + 1
END 
IF UPDATE(dept)
BEGIN
   PRINT 'updated dept column!'
   SET @count = @count + 1
END
IF @count > 0
BEGIN
  PRINT 'updated [' + CONVERT(varchar, @count) +
        '] columns!'
  ROLLBACK TRAN
END 
GO

UPDATE proffessor 
SET title = 'proffessor'
WHERE no = 'I003'




