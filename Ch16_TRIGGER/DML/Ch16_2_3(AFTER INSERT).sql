USE edusys
GO
CREATE TRIGGER addCourse
ON class 
AFTER INSERT -- insert後， 依序檢查條件約束建立Deleted 、inserted資料表
AS 
BEGIN
   --條件檢查
  IF ( SELECT COUNT(stud_no) FROM class
      WHERE stud_no = (
        SELECT stud_no FROM Inserted)--建立inserted資料表
     ) > 3
  BEGIN
     RAISERROR('too much course already!',1,1)
     ROLLBACK -- 或 ROLLBACK TRAN 取消交易
  END 
END
GO

INSERT INTO class 
VALUES ('I004', 'S001', 'CS111','03:00:00', '321-M')


