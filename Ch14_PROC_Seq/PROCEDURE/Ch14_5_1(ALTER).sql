USE edusys 
GO
ALTER PROCEDURE proCourse_report AS
BEGIN
  SELECT no, title, credits
  FROM course
  WHERE credits > 3
END
GO

EXEC proCourse_report
GO
