USE edusys
GO
CREATE TRIGGER employee_management
ON employee 
AFTER DELETE, UPDATE
AS 
IF EXISTS (SELECT * FROM student
           WHERE name = (
          SELECT name FROM Deleted))
BEGIN
  RAISERROR('name is not exist!',1,1)
  ROLLBACK TRAN
END
GO

DELETE employee WHERE id = 'F332213046'
GO
UPDATE employee SET salary = 55000
WHERE id = 'F332213046'