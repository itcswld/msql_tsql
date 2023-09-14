USE edusys 
GO
-- rollback 指定交易點

BEGIN TRAN
DECLARE @ct INT
SELECT @ct = COUNT(*) FROM studDup 
PRINT 'rows: ' + CONVERT(VARCHAR, @ct) --9
SAVE TRAN sp1 --儲存交易點/交易儲存點 (save points)
    DELETE studDup WHERE no = 'S001'
    SELECT @ct = COUNT(*) FROM studDup 
    PRINT 'rows: ' + CONVERT(VARCHAR, @ct) --8
    PRINT 'tran: ' + CONVERT(VARCHAR, @@trancount) --1

SAVE TRAN sp2
    DELETE studDup WHERE [no] = 'S002'
    SELECT @ct = COUNT(*) FROM studDup
    PRINT 'rows: ' + CONVERT(VARCHAR, @ct) -- 7
    PRINT 'tran: ' + CONVERT(VARCHAR, @@trancount) --1

ROLLBACK TRAN sp2 -- 指定回復到sp2交易點
SELECT @ct = COUNT(*) FROM studDup
PRINT 'rows: ' + CONVERT(VARCHAR, @ct) -- 8
PRINT 'tran: ' + CONVERT(VARCHAR, @@trancount)

ROLLBACK TRAN sp1 -- 再回復到sp2交易點
SELECT @ct = COUNT(*) FROM studDup
PRINT 'rows: ' + CONVERT(VARCHAR, @ct) -- 9
PRINT 'tran: ' + CONVERT(VARCHAR, @@trancount)

COMMIT TRAN




















