--合併3個table
USE 教務系統 
GO
SELECT 學生.學號, 學生.姓名, 課程.*, 班級.教授編號 
FROM 課程  t1 INNER JOIN 
--括號暫存成1 table
(學生 t2 INNER JOIN 班級 t3 ON t2.學號 = t3.學號) 
ON t3.課程編號 = t1.課程編號









































