USE 教務系統 
GO
SELECT 學生.學號, 學生.姓名, 上課.課程編號, 上課.教授編號
--table Alias
FROM 學生 INNER JOIN 班級 AS 上課
ON 學生.學號 = 上課.學號





















































