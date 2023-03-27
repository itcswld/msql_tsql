USE edusys 
GO
CREATE PROCEDURE procEmployee
   @salary money,
   @tax    money
AS
BEGIN
  IF @salary <= 0
     SET @salary = 30000
  IF @tax <= 0
     SET @tax = 300
  SELECT id, name, 
      (salary - tax) AS 所得
  FROM employee
  WHERE salary >= @salary
    AND tax >= @tax
END
GO

EXEC procEmployee 50000, 500


