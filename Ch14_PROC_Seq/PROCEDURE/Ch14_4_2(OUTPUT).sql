create PROC search_salary
    @n varchar(12),
    @s money OUTPUT
AS
BEGIN
    select @s = salary
    from employee
    where name = @n
END
go

DECLARE @salary money
-- exec search_salary '張無忌', @s = @salary output
exec search_salary '張無忌', @salary output
print 'Joe ''s salary: ' + CAST(@s as char)