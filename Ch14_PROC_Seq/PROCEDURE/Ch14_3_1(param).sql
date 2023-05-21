USE edusys 
GO
--Input Parametrs
CREATE PROCEDURE course_of_no
   @no char(5)
AS
BEGIN
  SELECT no, title, credits
  FROM course
  WHERE no = @no
END
GO

EXEC course_of_no @no = 'CS101'

EXEC course_of_no 'CS101'
