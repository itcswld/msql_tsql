USE 教務系統 
-- Go表示執行階段結束
GO
SELECT 學號, 姓名, 生日 FROM 學生

-- 運算子
USE 教務系統 
GO
SELECT 身份證字號, 姓名, 
       薪水-扣稅 AS 薪水淨額
FROM 員工

--加入字串
USE 教務系統 
GO
SELECT 身份證字號, 姓名, 
       城市+'巿'+街道 AS 地址
FROM 員工

--函數計算年齡
USE 教務系統 
GO
SELECT 學號, 姓名, 
       GETDATE() AS 今天,
       DATEDIFF(year, 生日, GETDATE()) AS 年齡 --  DATEDIFF(year, pastDate, Today)
FROM 學生

--列出有幾種不同
USE 教務系統 
GO
SELECT DISTINCT 學分 FROM 課程

-- 前幾筆
USE 教務系統 
GO
SELECT TOP 3 * FROM 學生

--前25%的記錄
USE 教務系統 
GO
SELECT TOP 25 PERCENT * FROM 學生

--取前3筆， 若有同值的也一併顯示
USE 教務系統 
GO
--//WITH TIES平手， ORDER BY [指定那個欄位平手] 
SELECT TOP 3 WITH TIES * FROM 課程
ORDER BY 學分

--Comparison Operators //= , <> 或 ！=, > , < , >= , !<, !>

--Logical Operators 
-- // "%" 任何字串； “—” 任何字元；"[]"括號內任1字元； "[-]" 範圍；"[^]" 不包括（字元或範圍）
--2樓課程
USE 教務系統 
GO
SELECT DISTINCT 課程編號, 上課時間, 教室
FROM 班級 
WHERE 教室 LIKE '%2_-%' 
-- A~D開頭的資料
USE 教務系統 
GO
SELECT * FROM 員工 
WHERE 身份證字號 LIKE '[A-D]%'
--NOT; AND ;OR ;LIKE ;BETWEEN AND;IN
--連續範圍
USE 教務系統 
GO
SELECT * FROM 學生
WHERE 生日 BETWEEN '1999-1-1' AND '1999-12-31'
--不連續範圍
USE 教務系統 
GO
SELECT * FROM 課程
WHERE 課程編號 IN ('CS101', 'CS222', 'CS100', 'CS213')

--Aggregate Functions 聚合函數
USE 教務系統 
GO
SELECT COUNT(*) AS 學生數 FROM 學生

USE 教務系統 
GO
SELECT AVG(薪水) AS 平均薪水 FROM 員工

USE 教務系統 
GO
SELECT MAX(保險) AS 保險金額 FROM 員工

USE 教務系統 
GO
SELECT MIN(保險) AS 保險金額 FROM 員工

USE 教務系統 
GO
SELECT SUM(薪水) AS 薪水總額, 
       SUM(薪水)/COUNT(*) AS 薪水平均 
FROM 員工

---Group By
USE 教務系統 
GO
SELECT 課程編號, COUNT(*) AS 學生數
FROM 班級 GROUP BY 課程編號

USE 教務系統 
GO
SELECT 課程編號, COUNT(*) AS 學生數
FROM 班級 
WHERE 教授編號 = 'I003'
GROUP BY 課程編號
--"HAVING" 指定收尋可使用聚合函數； WHERE不可
HAVING COUNT(*) >= 2


USE 教務系統 
GO
SELECT 教授編號, 課程編號, COUNT(學號) AS 總數
FROM 班級 
WHERE 教授編號 IN ('I001', 'I003')
--“WITH CUBE” 針對GROUP BY 指定的各欄位執行小計和加總
GROUP BY 教授編號, 課程編號 WITH CUBE

USE 教務系統 
GO
SELECT 教授編號, 課程編號, COUNT(學號) AS 總數
FROM 班級 
WHERE 教授編號 IN ('I001', 'I003')
--”WITH ROLLUP“ 針對GROUP BY 指定的第一個欄位執行小計
GROUP BY 教授編號, 課程編號 WITH ROLLUP


USE 教務系統 
GO
SELECT 教授編號, 課程編號, COUNT(學號) AS 總數
FROM 班級 
WHERE 教授編號 IN ('I001', 'I003')
--“ GROUPING SETS” 自行定義回傳哪些欄位的聚合統計資料
GROUP BY GROUPING SETS
(
  (教授編號, 課程編號), 
  --//回傳該欄位
  (教授編號),
  --//sum
  ()
)

--排序ORDER BY
USE 教務系統 
GO
SELECT 姓名, 薪水, 電話 FROM 員工 
WHERE 薪水 > 35000
--//default ASC小至大 ；反之DESC
ORDER BY 薪水 DESC





