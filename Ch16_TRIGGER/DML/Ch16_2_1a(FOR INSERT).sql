USE edusys
GO
CREATE TRIGGER addNewCourse
ON course
FOR INSERT ---當insert的時候執行以下code
AS 
BEGIN
  DECLARE @name varchar(30)
  SELECT @name = title FROM Inserted
  PRINT 'add New Course: ' + @name
END
GO

INSERT INTO course 
VALUES ('CS301','Warehouse Management System',4)

