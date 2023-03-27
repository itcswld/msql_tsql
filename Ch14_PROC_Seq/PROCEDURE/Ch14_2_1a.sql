USE edusys 
GO
CREATE PROCEDURE proCourse_report AS 
BEGIN
--inner join 4 tables
  SELECT student.no, student.name, course.*, proffessor.*
  FROM proffessor INNER JOIN
  (course INNER JOIN 
  (student INNER JOIN class ON student.no = class.stud_no) 
  ON class.course_no = course.no )
  ON class.prof_no = proffessor.no
END
GO

EXEC proCourse_report


