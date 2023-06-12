USE edusys
GO
CREATE FUNCTION fnVolume
  (@length decimal(5,2),
   @width decimal(5,2),
   @height decimal(5,2))
  RETURNS decimal(15, 4)
BEGIN
 RETURN (@height * @length * @width)
END
GO

CREATE TABLE PackContain (
   no char(5) NOT NULL PRIMARY KEY,
   name     varchar(20),
   len     decimal(5,2),
   width     decimal(5,2),
   height     decimal(5,2),
   container AS dbo.fnVolume(len, width, height)
)
