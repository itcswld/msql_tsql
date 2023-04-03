/*
ALTER INDEX 索引名稱
[ALL] ON 資料表名稱
[REBUILD [WITH （索引選項清單）] -- WITH更改索引選項
    | REORGANIZE  --壓縮包含大型物件資料 LOB 的分頁
    | DISABLE 
    | SET（索引選項清單) --更改索引選項
]

*/


USE 教務系統 
GO
ALTER INDEX ALL ON 員工 --所有此資料表的INDEX
REBUILD WITH (FILLFACTOR = 80) --WITH 修改索引選項
















 































































