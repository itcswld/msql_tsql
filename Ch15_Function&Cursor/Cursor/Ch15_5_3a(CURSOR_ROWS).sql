USE edusys 
GO
DECLARE employee_cursor CURSOR
STATIC
FOR SELECT name FROM employee

OPEN employee_cursor
DECLARE @name varchar(10), @rows int
/*@@CURSOR_ROWS =
n, 資料筆數
0, 沒資料
-1, 若為DYNAMIC cursor， 資料數也會跟著變
*/
IF @@CURSOR_ROWS > 0
BEGIN
   SET @rows = @@CURSOR_ROWS / 3 --顯示1/3的員工姓名
   FETCH NEXT FROM employee_cursor INTO @name
   WHILE @@FETCH_STATUS = 0
   BEGIN
     PRINT @name
     FETCH RELATIVE @rows FROM employee_cursor
     INTO @name
   END
END 
CLOSE employee_cursor
DEALLOCATE employee_cursor













