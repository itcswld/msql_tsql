/*
DDL 觸發程序（DDL Trigger）是一種特殊類型的觸發程序，它可以回應DDL
指令(主要是指CREATE~ALTER、DROP、GRANT、DENY、REVOKE或UPDATE
STATISTICS 開頭的指令）來執行資料庫的管理工作，例如：稽核與管理資料庫作業。
保護資料庫網要不會改變。
希望在更改資料庫網要時，有一些回應來進行額外處理。
記錄資料庫綱要的改變或相關事件。

CREATE TRIGGER triggerName
ON {ALL SERVER | DATABASE}
{FOR | AFTER} {DROP_TABLE |  ALTER_TABLE | DROP_TABLE, ALTER_TABLE}
AS
//t-sql codes


*/
USE edusys
GO
CREATE TRIGGER readOnlyTable
ON DATABASE 
FOR DROP_TABLE, ALTER_TABLE AS 
BEGIN
  BEGIN TRAN
  PRINT 'This table is read only!' 
  ROLLBACK TRAN
END
GO


DROP TABLE student


DROP TRIGGER readonlyTB
ON DATABASE










