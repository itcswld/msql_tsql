USE 教務系統 
GO
SELECT 身份證字號, 姓名, 薪水
FROM 員工 
ORDER BY 身份證字號
--Offset: 第N筆後的資料; ROWS | ROW
OFFSET 3 ROWS

select tb.*
from tb
order by col1
offset 1 fetch next 1 row only;
























































