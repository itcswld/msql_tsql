USE 教務系統 
GO
SELECT 姓名, 薪水 FROM 員工 
--ANY / SOME : 滿足任1值
WHERE 薪水 >= ANY
(SELECT 薪水 FROM 員工 WHERE 城市='台北')






















































