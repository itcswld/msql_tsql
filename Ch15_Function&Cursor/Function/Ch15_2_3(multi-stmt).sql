USE �аȨt�� 
GO
CREATE FUNCTION fnEmployee
    (@m int, @n int)
    --Multi Statement Table-valued Function 回傳新建立的資料表
  RETURNS @outTable TABLE
   ( no int IDENTITY(1,1),
     id char(10), name varchar(12),
     addr varchar(30), phone char(12),
     salary money )
BEGIN
  INSERT @outTable
     SELECT id, name, city+str,
            phone, salary-insurence-tax
     FROM employ
  DELETE @outTable
  --取出第m筆至第n筆之間
  WHERE no < @m OR no > @n
  RETURN
END
GO

SELECT * FROM dbo.fnEmployee(2, 5)
