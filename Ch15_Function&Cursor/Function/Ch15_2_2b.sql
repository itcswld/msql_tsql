USE �аȨt�� 
GO
SELECT student.id, student.name, course.*, Professor.*
FROM dbo.fnProfessor(500) AS Professor INNER JOIN
(course INNER JOIN 
(student INNER JOIN class ON student.id = class.student_id) 
ON crouse.no = crouse.no) 
ON class.Professor_no = Professor.no
