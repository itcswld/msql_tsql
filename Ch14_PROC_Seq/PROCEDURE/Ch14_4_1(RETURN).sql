USE edusys 
GO
CREATE PROCEDURE addCourse
   @c_no char(5),
   @title  varchar(30),
   @credits int
AS
BEGIN
  DECLARE @errorNo int
  INSERT INTO course
  VALUES (@c_no, @title, @credits)
  --@@ERROR 錯誤碼
  SET @errorNo = @@ERROR
  IF @errorNo <> 0
  BEGIN
    IF @errorNo = 2627
       PRINT 'Error! 重複索引鍵'
    ELSE
       PRINT 'Error! unknow error!'
    RETURN @errorNO
  END
END
GO

DECLARE @retVar int
EXEC @retVar = addCourse 'CS222','資料庫程式設計',3
PRINT '回傳代碼:' + CONVERT(varchar, @retVar)
