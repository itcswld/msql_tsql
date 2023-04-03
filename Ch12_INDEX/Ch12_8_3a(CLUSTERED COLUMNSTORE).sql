/*
叢集資料行存放區索引是一種可以執行 DML 指令的資料行存放區索引，
在没有叢集索引、唯一、主鍵和外來鍵條件約束的資料表建立叢集資料行存放區索引
*/

USE 教務系統 
GO
SELECT * INTO 學生備份2
FROM 學生

USE 教務系統 
GO
CREATE CLUSTERED COLUMNSTORE INDEX 學生資料行_叢集索引
ON 學生備份2 --不需要欄位清單


