/*
1-1-4 交易的四大特性
資料庫系統的交易需要滿足四項基本特性，以英文字頭的縮寫稱為 ACID 交易，如下所示：
單元性 ( Atomicity)：將交易過程的所有資料庫單元操作視為同一項工作，不是全部執行完，就是通通不執行，將它視為一個不能分割的邏輯單位。
一致性 (Consistency）：當交易更改或更新資料庫的資料後，在交易之前和之後，資料庫的資料仍然需要滿足完整性限制條件，維持資料的一致性。
隔離性(Isolation）：當執行多個交易時，雖然交易是並行執行，不過，各交易之間應該滿足獨立性。也就是說，一個交易不會影響到其他交易的執行結果，或被其他交易所干擾。
永久性（Durability）：當交易完成執行認可交易（Commit）後，其執行
操作所更動的資料已經永久改變，資料庫管理系統不只需要將資料從資料庫緩衝區實際寫入儲存裝置，而且不會因任何錯誤，而導致資料的流失。

Autocommit Transactions Mode
系統默認， 自動視為一個交易， 有錯誤就回復交易， 反之認可交易
*/

USE edusys 
GO
BEGIN TRAN
INSERT INTO employee 
VALUES ('Y123456789','Eve','台北','長春路',
        '02-11122111', 60000, 4000, 1000)
IF @@ERROR = 0
  BEGIN
    INSERT INTO proffessor 
    VALUES ('I014','lecturer','EE', 'Y123456789')
    IF @@ERROR = 0
       COMMIT TRAN
    ELSE
       ROLLBACK TRAN
  END
ELSE
  ROLLBACK TRAN
















