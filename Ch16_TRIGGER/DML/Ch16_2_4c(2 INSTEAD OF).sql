USE edusys 
GO
CREATE VIEW studentEmployee_view AS
SELECT student.no, student.name,student.sex, 
       student.phone, student.bday, 
       employee.id, employee.city, employee.str, employee.salary, employee.insurance, employee.tax
FROM student INNER JOIN employee
ON student.name = employee.name
GO

SELECT * FROM studentEmployee_view


CREATE TRIGGER addNew_studentEmployee
ON studentEmployee_view 
INSTEAD OF INSERT
AS 
DECLARE @rowCount int
SELECt @rowCount = COUNT(*) FROM Inserted
IF @rowCount = 1
  BEGIN
  --同時新增兩筆
    INSERT student
    SELECT no, name, sex, phone, bday
    FROM Inserted

    INSERT employee
    SELECT id, name, city, str, phone, salary, insurance, tax
    FROM Inserted
    PRINT 'updated 2 rows'
  END
ELSE
  RAISERROR('Error: you can only insert one data ',1,1)
GO


INSERT INTO studentEmployee_view 
VALUES ('S500', 'Eve', '男','05-55522222',
        '1995/12/25','F123450789','台北',
        '仁愛路', 50000, 2000, 900)
      


