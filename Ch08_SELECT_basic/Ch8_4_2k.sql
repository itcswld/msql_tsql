USE 教務系統 
GO
SELECT * FROM 課程
WHERE 課程編號 LIKE '%2%'
  AND (名稱 LIKE '%程式%'
  OR  學分>=4)




















