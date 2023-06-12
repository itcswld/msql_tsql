USE edusys 
GO
DECLARE @result int
SET @result = dbo.fnFactorial(6)
PRINT '6!''s value = ' + CONVERT(varchar, @result)
IF dbo.fnValidCode('D2222') = 1
  PRINT 'YES'
ELSE
  PRINT 'NO'

