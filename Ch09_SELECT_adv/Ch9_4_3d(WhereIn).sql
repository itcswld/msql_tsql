USE 教務系統 
GO
SELECT * FROM 教授 
WHERE 教授編號 IN
(SELECT 教授編號 FROM 班級 
 WHERE 學號=(SELECT 學號 FROM 學生
             WHERE 姓名='江小魚'))



















































