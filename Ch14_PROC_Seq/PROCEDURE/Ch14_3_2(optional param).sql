USE �аȨt�� 
GO
--Optional Parameters
create PROC search_addr @city CHAR(5) = '台北', @str varchar(30) = '中正路'
AS
BEGIN
    SELECT id,name, (salary - tax) as income, (city + str) as addr
    from employee
    WHERE city like @city and str like @str
end
go

EXEC search_addr @city = '桃園'
go
EXEC search_addr '桃園', default
go
EXEC search_addr '桃園'



