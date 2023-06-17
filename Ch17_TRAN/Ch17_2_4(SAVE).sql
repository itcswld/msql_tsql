USE edusys 
GO
-- rollback 指定交易點

BEGIN TRAN

DECLARE @ct INT

SELECT @ct = COUNT(*) FROM classDup 
PRINT 'classDup rows: ' + CONVERT(VARCHAR, @ct) --12
DELETE classDup WHERE stud_no = 'S002'
SELECT @ct = COUNT(*) FROM classDup 
PRINT 'classDup rows: ' + CONVERT(VARCHAR, @ct) --9

SELECT @ct = COUNT(*) FROM studDup
PRINT 'studDup rows: ' + CONVERT(VARCHAR, @ct) --8

SAVE TRAN sp1 --儲存交易點
DELETE studDup WHERE [no] = 'S002'
SELECT @ct = COUNT(*) FROM studDup 
PRINT 'studDup rows: ' + CONVERT(VARCHAR, @ct)  --7

SAVE TRAN sp2
DELETE studDup WHERE [no] = 'S003'
SELECT @ct = COUNT(*) FROM studDup
PRINT 'studDup rows: ' + CONVERT(VARCHAR, @ct) -- 6

ROLLBACK TRAN sp1
SELECT @ct = COUNT(*) FROM studDup
PRINT 'studDup rows: ' + CONVERT(VARCHAR, @ct) -- 7

ROLLBACK TRAN sp2 -- rollback 指定儲存交易點
SELECT @ct = COUNT(*) FROM studDup
PRINT 'studDup rows: ' + CONVERT(VARCHAR, @ct) -- 8


COMMIT TRAN




















