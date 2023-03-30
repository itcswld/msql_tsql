/*
Explicit Transactions Mode
多個T-sQL指令敘述來建立交易，集合成為一個交易，可控制交易的執行結果是認可交易•還是回復交易。

需要使用明顯交易模式的情況，如下所示：

如果T-SQL 指令叙述集合中有任一個T-SQL 指令叙述執行失敗，將會影響資料完整性的情況。

如果執行多個T-SQL操作指令INSERT、UPDATE 和 DELETE 時•這些指令更新的資料是有關聯的，
例如：新增訂單資料和訂單明細的項目。

如果執行T-SQL 操作指令 INSERT、UPDATE 和 DELETE 後，馬上執行 SELECT 查詢指令，而且查詢結果的欄位資料，就是操作指令更新的資料時。

當我們將記錄從一個資料表搬移至另一個資料庫時，或當更新外來鍵參考時。

SET IMPLICIT_TRANSACTIONS ON 進人隱含交易模式，表示交易開始執行，直到執行COMMIT TRAN 或 ROLLBACK TRAN 為止，
就會自動進入下一個交易。結束隱含交易模式就是SET IMPLICIT_TRANSACTIONS OFF
*/

USE edusys 
GO
SELECT * INTO classDup
FROM class_no

GO
SELECT * INTO studDup
FROM stud_no
GO
BEGIN TRAN
DELETE classDup 
WHERE class_no = 'S001'
IF @@ROWCOUNT > 5
  BEGIN
    ROLLBACK TRAN
    PRINT '回復刪除!'
  END
ELSE
  BEGIN
    DELETE studDup
    WHERE stud_no = 'S001'
    COMMIT TRAN
    PRINT '認可刪除!'
  END

















