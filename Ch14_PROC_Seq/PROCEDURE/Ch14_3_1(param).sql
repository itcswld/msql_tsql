USE edusys 
GO
--Input Parametrs
CREATE PROCEDURE proCourse
   @c_no char(5)
AS
BEGIN
  SELECT no, title, credits
  FROM course
  WHERE no = @c_no
END
GO

EXEC proCourse @c_no = 'CS101'

EXEC proCourse 'CS101'
