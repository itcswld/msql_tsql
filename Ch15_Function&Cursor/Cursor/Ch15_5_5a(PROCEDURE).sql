USE edusys 
GO
CREATE PROCEDURE return_course_cursor
  @course_cursor cursor VARYING OUTPUT
AS 
SET @course_cursor = CURSOR 
   LOCAL STATIC
   FOR SELECT * FROM course
OPEN  @course_cursor
GO

DECLARE @cur1 cursor
EXEC return_course_cursor @cur1 OUTPUT --取得@course_cursor
FETCH FROM @cur1 --取出第一筆記錄















