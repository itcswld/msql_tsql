--不與學生同名同姓的員工
USE 教務系統 
GO
SELECT 姓名 FROM 學生 
--except: 排除與t2有的match到的資料
EXCEPT
SELECT 姓名 FROM 員工











































