USE edusys 
GO
--temporary procedures
CREATE PROC #tmpProc AS
BEGIN
  SELECT no, name, phone
  FROM student
END
GO
EXEC #tmpProc
