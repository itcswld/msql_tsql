--#區域暫存local Temporary tables, 只有使用者工作階段終止（離線）， 自動刪除暫存資料表
CREATE TABLE #tbName (
   col1  char(5) ,
   col2      varchar(30) ,
   col3      int
)


with tmpTB AS
(
   SELECT col1, ROW_NUMBER() OVER (ORDER BY col1 ASC) AS RowNum from tb1
)
SELECT * FROM tmpTB
WHERE RowNum = 1
