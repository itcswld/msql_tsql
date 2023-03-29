USE �аȨt��
GO
CREATE TRIGGER checkCredits
ON course
AFTER UPDATE
AS 
BEGIN
  DECLARE @new int, @old int
  SELECT @new = credits FROM Inserted --after
  SELECT @old = credits FROM Deleted --before
  IF @old > @new
  BEGIN
     PRINT '不許更新'
     ROLLBACK TRAN
  END 
END

UPDATE course
SET credits = 3
WHERE no = 'CS301'