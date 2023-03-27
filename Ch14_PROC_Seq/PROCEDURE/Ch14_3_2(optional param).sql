USE �аȨt�� 
GO
--Optional Parameters
CREATE PROCEDURE searchAddr
   @city char(5) = '台北', -- Default
   @street varchar(30) = '中正路'
AS
BEGIN
  SELECT id, name, 
      (salary - tax) AS 所得, 
      (city+str) AS 地址
  FROM employee
  WHERE city LIKE @city
    AND str LIKE @street
END
GO

EXEC searchAddr @city = '桃園'
GO

EXEC searchAddr '桃園' ,DEFAULT

