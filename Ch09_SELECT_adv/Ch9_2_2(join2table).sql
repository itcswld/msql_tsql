--inner join 合併2個table 都存在的資料
USE 教務系統 
GO
SELECT 學生.學號, 學生.姓名, 班級.課程編號, 班級.教授編號
--//"INNER " 可略
FROM 學生 INNER JOIN 班級 
ON 學生.學號 = 班級.學號









































