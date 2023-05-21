DECLARE @x int = 4, @y int = 20
SET @x *= @y
SELECT @x, @y


declare @x int = 4, @y int=20
set @x *= @y
select @x as '4x20', @y as '20'