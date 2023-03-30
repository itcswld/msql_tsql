USE edusys 
GO
BEGIN TRAN
  DECLARE @count int
  DELETE classDup WHERE stud_no = 'S001'
  SAVE TRAN savePoint1
    DELETE studDup WHERE stud_no = 'S002'
    SAVE TRAN savePoint2
      DELETE studDup WHERE stud_no = 'S003'
      SELECT @count = COUNT(*) FROM studDup
      PRINT 'Records: ' + CONVERT(varchar, @count)
    ROLLBACK TRAN savePoint2
    SELECT @count = COUNT(*) FROM studDup
    PRINT 'Records: ' + CONVERT(varchar, @count)
  ROLLBACK TRAN savePoint1
  SELECT @count = COUNT(*) FROM studDup
  PRINT 'Records: ' + CONVERT(varchar, @count)
COMMIT TRAN

















