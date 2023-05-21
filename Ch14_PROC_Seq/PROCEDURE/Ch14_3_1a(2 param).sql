create proc emp_income @salary money, @tax money
AS
BEGIN
    if @salary <= 0
        set @salary = 30000
    if @tax <= 0
        set @tax = 300
    
    select id, name, (salary - tax) as income
    from employee
    where salary >= @salary and tax >= @tax
END
GO

exec emp_income 50000, 500