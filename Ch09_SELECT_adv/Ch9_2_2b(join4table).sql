USE 教務系統 
GO
SELECT 學生.學號, 學生.姓名, 課程.*, 教授.*
FROM 教授 t1 INNER JOIN
(課程 t2 INNER JOIN 
(學生  t3 INNER JOIN 班級  t4 ON 學生.學號 = 班級.學號) 
ON 班級.課程編號 = 課程.課程編號) 
ON 班級.教授編號 = 教授.教授編號


SELECT * 
FROM proffessor a 
INNER JOIN (course b 
INNER JOIN ( student c 
INNER JOIN class d on d.stud_no = c.[no]) -- 以最後table為基準， combine 到第1個table
on  d.course_no = b.[no])
on  d.prof_no = a.[no]









































