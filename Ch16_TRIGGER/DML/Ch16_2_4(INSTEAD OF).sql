/*
INSTEAD OF 觸發程序可以攔截和取代指定操作
不同於 APTER 觸發程序，INSTEAD OF 觸發程序可以編輯檢視表。
但不支援遞迴呼叫，而同一個資料表或檢視表只能定義每一個 INSERT、UPDATE 或 DELETE 
指令各一個 INSTEAD OF 觸發程序。
可以定義多個檢視表，每個檢視表都有自己的 INSTEAD OF 。
此外，如果資料表有定義外來鍵條件約束，和指定 CASCADE UPDATE或CASCADE DELETE 選項，
就不能在資料表建立 UPDATE 或 DELETE 事件的INSTEAD OF 觸發程序。
*/

USE edusys
GO
CREATE TRIGGER addNewCourse
ON course 
INSTEAD OF INSERT
AS 
BEGIN
IF EXISTS (SELECT * FROM course
           WHERE no = (
           SELECT no FROM Inserted))
  BEGIN 
    UPDATE course
    SET course.title = i.title,
        course.credit = i.credit
    FROM course c JOIN Inserted i
    ON c.no = i.no --where course.no = i.no
    PRINT 'update 1 row !'
  END
ELSE
  BEGIN
    INSERT course
    SELECT * FROM Inserted
    PRINT 'New course is added!'
  END
END
GO

INSERT INTO course
VALUES ('CS213', '物件導向程式設計', 4)
GO

INSERT INTO course
VALUES ('CS333', 'Dart', 3)




