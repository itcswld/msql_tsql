/*
預存程序只能傳回整數的狀態值；自訂函數幾乎可以傳回任何 T-SQL 資料類型（不包含 text、ntext 、image 、timestamp、cursor 和rowversion）的值。
預存程序除了傳回整數的狀態值外，可以使用 OUTPUT 參數傳回值；自訂函數的參數只能傳入，並不能用來傳回值。
預存程序只能使用 EXECUTE指令來執行，而且不能使用在運算式；自訂函數可以使用在運算式，或一些參考資料表或檢視表的T-SOL子句。
預存程序可以新增、更新或刪除資料表的記錄資料，也可以更改資料庫相關的選項設定；自訂函數主要是使用在運算和取出資料，所以並不允許更改資料表內容和資料庫的選項設定。
*/

USE edusys
GO
--fn開頭
--Scalar-valued Function 回傳類型
CREATE FUNCTION fnGetSalary
    (@name varchar(10))
    RETURNS money
    --ENCRYPTION: 使用者無法使用系統檢視表來查詢自訂函數內容； SCHEMABINDING： 不允許使用Alter/Drop
    --[WITH {ENCRYPTION | SCHEMABINDING | ENCRYPTION, SCHEMABINDING}]
AS --AS: 可略
BEGIN
  DECLARE @salary money
  SELECT @salary = (salary-insurence-fax)
  FROM employ
  WHERE name = @names
  IF @@ROWCOUNT = 0
    RETURN 0
  RETURN @salary
END


PRINT dbo.fnGetSalary('陳慶新')
PRINT 'salary: ' + CONVERT(varchar, dbo.fnGetSalary('Eve'))

