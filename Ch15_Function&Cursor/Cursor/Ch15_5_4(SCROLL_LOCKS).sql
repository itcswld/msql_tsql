USE edusys
GO 
DECLARE employee_cursor CURSOR
/*--並行控制
[READ_ONLY | SCROLL_LOCKS | OPTIMISTIC]
READ_ONLY: 不可修改
SCROLL_LOCKS: 鎖定該筆記錄， 其他使用者不可修改直到離開讀取此筆
OPTIMISTIC：修改該筆記錄同時有人也在修改， 系統就會產生16934的錯誤
*/
LOCAL SCROLL_LOCKS
FOR SELECT salary FROM employee
    WHERE employee.name 
    NOT IN (SELECT name FROM student)
--OF keyword後是允許更新的欄位
FOR UPDATE OF salary
OPEN employee_cursor
DECLARE @salary money
FETCH NEXT FROM employee_cursor INTO @salary
WHILE @@FETCH_STATUS = 0
BEGIN
   IF @salary <= 50000 --小於等於5萬
   BEGIN
      UPDATE employee
      SET  salary = @salary * 1.05 --調薪5%
      --WHERE CURRENT OF：取代WHERE
      WHERE CURRENT OF employee_cursor
   END 
   FETCH NEXT FROM employee_cursor INTO @salary
END
CLOSE employee_cursor
DEALLOCATE employee_cursor













