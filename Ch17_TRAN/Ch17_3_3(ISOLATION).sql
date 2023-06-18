/*
READ UNCOMMITTED
隔離最低的等級，交易就算尚未執行認可交易，也允許其他交易讀取，換句話說，讀取的資料並不一定正確，而且有可能讀取
到尚未認可交易的中閒結果資料

SNAPSHOT
就算尚末執行認可交易，也允許其他交易讀取，不過讀取的是交易前的舊資料，雖然不是最新的資料，但不會造成資料庫資料的不一致

READ COMMITTED
認可交易後，才允許其他交易讀取，可以避免讀取到尚未認可交易的中間結果資料

REPEATABLE READ
交易中讀取的資料，不許其他交易來更改
未認可交易前，不論讀取幾次的結果都相同。例如：交易A讀取資料x=100後，交易 B讀取變更相同資料x=200 後認可交易，
此時如果交易 A 再次讀取x，x 的值仍然是 100，而不是交易B 更改後的 200

SERIALIZABLE
隔離最高的等級，將交易使用的所有資料都進行鎖定，交易執行順序需要等到前一個交易認可交易後，才能執行下一個交易
*/
USE edusys 
GO
--隔離等級REPEATABLE READ：交易中讀取的資料，不許其他交易來更改，建立交易來更新員工和教授資料，
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
UPDATE employee 
SET salary = 65000,
    insurance = 3000
WHERE id = 'Y123456789'
IF @@ERROR = 0
  BEGIN
    UPDATE proffessor 
      SET job = 'AccocProf'
      WHERE emp_id = 'Y123456789'
    IF @@ERROR = 0
       COMMIT TRAN
    ELSE
       ROLLBACK TRAN
  END
ELSE
  ROLLBACK TRAN

GO

SELECT salary, ins from employee WHERE id = 'Y123456789'
SELECT job from proffessor  WHERE id = 'Y123456789'














