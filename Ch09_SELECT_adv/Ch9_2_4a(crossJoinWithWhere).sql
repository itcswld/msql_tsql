USE 教務系統 
GO
SELECT 學生.學號, 學生.姓名, 班級.課程編號, 班級.教授編號
--cross join + where = inner join
FROM 學生 CROSS JOIN 班級 
WHERE 學生.學號 = 班級.學號
























































