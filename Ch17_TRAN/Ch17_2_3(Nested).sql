/*
巢狀交易（Nested Transactions )如同 WHILE指令的巢狀迴閣，它是在 BEGIN TRAN建立的交易中，
擁有其他 BEGIN TRAN建立的交易。
主要目的是針對預存和觸發程序，因為有巢狀交易才可以在程序中建立交易，和在上一層交易呼叫預存和觸發程序，此時在預存和觸發程序的交易就成為內層交易。

@@TRANCOUNT目前是位在巢狀交易的哪一層，因為每執行一次 BEGIN TRAN建立一層巢狀交易，就會將@@TRANCOUNT加一。
COMMIT TRAN 和 ROLLBACK TRAN 指令在巢狀交易中的作用，會因
@@TRANCOUNT 系統函數值：
• COMMIT TRAN：只有當@@TRANCOUNT= 1時，執行COMMIT TRAN 才會真的認可交易，將所有巢狀交易的資料變更寫入資料庫。
而當@@TRANCOUNT 系統函數值大於1時，因為屬於內層交易，執行 COMMIT TRAN 只是將@@TRANCOUNT 减一。
。ROLLBACK TRAN：不論在哪一層執行 ROLLBACK TRAN 都是回復整個巢狀交易，@@TRANCOUNT 也會歸 0。
*/

DECLARE @cr int, @sr int
--outer tran
BEGIN TRAN
PRINT 'outer tran: ' + CONVERT(varchar, @@trancount) -- 1
DELETE classDup
select  @cr = COUNT(*) FROM classDup
print 'classDup rows: ' + CONVERT(VARCHAR,@cr) -- 0
--inner tran
    BEGIN TRAN
    PRINT 'innert tran: ' + CONVERT(varchar, @@trancount) --2
    DELETE studDup
    SELECT @sr = COUNT(*) FROM studDup
    print 'studDup rows: ' + CONVERT(VARCHAR, @sr) -- 0

    COMMIT TRAN --只有當@@TRANCOUNT= 1時，執行COMMIT TRAN 才會真的認可交易
    PRINT 'commited tran : ' + CONVERT(varchar, @@trancount) -- 1
    SELECT @cr = COUNT(*) FROM classDup
    SELECT @sr = COUNT(*) FROM studDup
    print 'classDup/studDup rows: ' + CONVERT(VARCHAR, @cr) + '/' + CONVERT(VARCHAR, @sr) -- 0/0

ROLLBACK TRAN--不論在哪一層執行 ROLLBACK TRAN 都是回復整個巢狀交易，@@TRANCOUNT 也會歸 0。
PRINT 'rolloback tran: ' + CONVERT(varchar, @@trancount) -- 0
    SELECT @cr = COUNT(*) FROM classDup
    SELECT @sr = COUNT(*) FROM studDup
    print 'classDup/studDup rows:' + CONVERT(VARCHAR, @cr) + '/' + CONVERT(VARCHAR, @sr) -- 21/9

















