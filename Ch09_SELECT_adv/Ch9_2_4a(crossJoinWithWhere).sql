USE 教務系統 
GO
SELECT 學生.學號, 學生.姓名, 班級.課程編號, 班級.教授編號
--cross join + where = inner join
FROM 學生 CROSS JOIN 班級 
WHERE 學生.學號 = 班級.學號

use edusys
go


SELECT a.no, a.name, b.course_no, b.prof_no
FROM student a CROSS JOIN class b
WHERE a.no = b.stud_no
print @@rowcount -- 21

SELECT a.no, a.name, b.course_no, b.prof_no
FROM student a inner JOIN class b
on a.no = b.stud_no
print @@rowcount --21

























































