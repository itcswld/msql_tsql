USE edusys
GO
CREATE PROCEDURE callProc
   @proc_name varchar(30) AS
--@@NESTLEVEL 取得目前呼叫的層數
PRINT '開始層: ' + CAST(@@NESTLEVEL AS char)
EXEC @proc_name
PRINT '結束層: ' + CAST(@@NESTLEVEL AS char)
GO

CREATE PROCEDURE testProc AS
PRINT '層數: ' + CAST(@@NESTLEVEL AS char)
GO

EXEC callProc 'testProc'
-- 開始層: 1                             
-- 層數: 2                             
-- 結束層: 1         

