USE edusys
GO
CREATE FUNCTION fnFactorial
    (@number int)
    RETURNS int
AS
BEGIN
--遞回
  DECLARE @level int
  IF @number <= 1
    SET @level = 1
  ELSE
    SET @level = @number * dbo.fnFactorial( @number-1) 
  RETURN @level
END
GO
PRINT '5!'''s value'= ' + CONVERT(varchar, dbo.fnFactorial(5))

/*
fnFactorial(2) = 2
fnFactorial(3) = 3 *fnFactorial(2) = 3 * 2 = 6
fnFactorial(4) = 4 * fnFactorial(3) = 4 * 6 = 24
fnFactorial(5) = 4 * fnFactorial(4) = 5 * 24 = 120
*/