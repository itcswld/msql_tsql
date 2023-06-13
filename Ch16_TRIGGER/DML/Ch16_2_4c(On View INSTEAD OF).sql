USE edusys 
GO
create VIEW stud_emp_view AS
SELECT s.no, s.name, s.sex, s.phone, s.bd, e.id, e.city , e.str , e.salary, e.ins, e.tax
from student s inner join employee e
on s.name = e.name
GO

select * from stud_emp_view


CREATE TRIGGER addNew_studentEmployee
ON stud_emp_view 
INSTEAD OF INSERT
AS 
DECLARE @rowCount int
SELECt @rowCount = COUNT(*) FROM Inserted
IF @rowCount = 1
  BEGIN
  --同時新增兩筆
    INSERT student
    SELECT no, name, sex, phone, bd
    FROM Inserted

    INSERT employee
    SELECT id, name, city, str, phone, salary, ins, tax
    FROM Inserted
    PRINT 'updated 2 rows'
  END
ELSE
  RAISERROR('Error: you can only insert one data ',1,1)
GO


INSERT INTO stud_emp_view 
VALUES ('S500', 'Eve', '男','05-55522222',
        '1995/12/25','F123450789','台北',
        '仁愛路', 50000, 2000, 900)
      


