USE edusys 
GO
DECLARE @course_cursor cursor
SET @course_cursor = CURSOR 
   LOCAL STATIC
   FOR SELECT * FROM course

OPEN @course_cursor
FETCH FROM @course_cursor














