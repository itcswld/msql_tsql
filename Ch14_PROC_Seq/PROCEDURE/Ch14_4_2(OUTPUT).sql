USE edusys 
GO
CREATE PROCEDURE searchSalary
   @name  varchar(12),
   @salary  money  OUTPUT
AS
BEGIN
  SELECT @salary = salary
  FROM employee
  WHERE name = @name
END
GO

DECLARE @mySalary money
-- EXEC searchSalary '張無忌', @salary = @mySalary OUTPUT
EXEC searchSalary '張無忌', @mySalary OUTPUT
PRINT ' Joe''s salary:' + CONVERT(varchar, @mySalary)
--// Joe's salary:50000.00