USE �аȨt�� 
GO
CREATE FUNCTION fnPrice
  (@today datetime)
  RETURNS money
BEGIN
  DECLARE @price money, 
            @month int
  SET @month = MONTH(@today)
  IF @month > 6
    SET @price = 500
  ELSE
    SET @price = 200
  RETURN @price
END
GO



CREATE TABLE product (
   bar_no char(5) NOT NULL PRIMARY KEY,
   name   varchar(20),
   price  money DEFAULT (dbo.fnPrice(GETDATE()))
)

