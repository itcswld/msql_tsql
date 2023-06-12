USE edusys 
GO
/*1.宣告指標
“操作想要操作的每条数据”。
使用游标实质是就是对每条数据都执行一个操作，而游标记录了当前要操作的数据所在位置，
每次游标下移，即记录位置下移，以实现操作下一条数据，直到满足条件的数据都被操作了一遍。
游标的效率比较低，数据量比较大时尽量不去使用它。

CURSOR: 可在Procedure or Tigger 來處理select的結果（Result set)。 
每次處理結果集（Result set)的一筆記錄。
資料列標籤（Row Marker）記錄在Result set中存取的是哪筆。 可往前/往後移動讀取記錄
實作方式有兩種
Client Cursors: 使用資料庫函數(DB API)。ex, ADO/ADO.NET/ODBC
T-SQL Cursors: T-SQL , 源於ANSI-SQL 92 T-SQL擴充語法
*/
DECLARE student_cursor CURSOR
--指定範圍（Scope）
-- [LOCAL | GLOBAL]
/*設定是否捲動 
FORWARD_ONLY ：預設，由前往後逐筆循序讀取，不能回頭捲動； 
SCROLL：【STATIC | KEYSET | DYNAMIC】的預設
*/
--[FORWARD_ONLY | SCROLL]
/*【種類】
FAST_FORWARD： 單向唯讀， 不可捲動， 最快的指標
STATIC：使用暫存table記錄， 沒動態來源資料， 內容不會更新
KEYSET：只將唯一鍵值暫存於table， 其他是從來源table取得， upd/delete可動態更新， 但不可insert
DYNAMIC ： 直接從來源table取資料， 所以可動態更新
*/
STATIC --[FAST_FORWARD | STATIC | KEYSET | DYNAMIC ]
--FOR取得
FOR SELECT no, name, phone FROM student 
    WHERE sex = '男'
DECLARE @id char(5)
DECLARE @name varchar(10)
DECLARE @tel varchar(15)
--2.開啟Cursor
OPEN student_cursor
/*3.讀取Cursor
移動方式：
[NEXT | PRIOR | FIRST | LAST | ABSOLUTE n | RELATIVE n]
NEXT：取第一筆記錄， FORWARD_ONLY Cursor只能用NEXT
PRIOR：取上一筆
FIRST：將指標移到第一筆
LAST：將指標移到第一筆
ABSOLUTE n：第n筆記錄
RELATIVE n：從目前指標算起第n筆， 若<0是前幾筆， 0是再讀取目前這筆
*/
FETCH NEXT FROM student_cursor INTO @id, @name, @tel
 /*@@FETCH_STATUS系統函數傳回
 0， 表成功， 即游标还没到头
 -1， 失敗， 因已到達結果集的最後一筆記錄。即游标到头了
 -2， 失敗， 因讀取的記錄已刪
 */
WHILE @@FETCH_STATUS = 0 
BEGIN
    PRINT @id + ' - ' + @name + ' - ' + @tel
    FETCH NEXT FROM student_cursor INTO @id, @name, @tel
END
--4.Close Cursor
CLOSE student_cursor
--5.移除Cursor(釋放Cursor佔用的系統資源)
DEALLOCATE student_cursor











