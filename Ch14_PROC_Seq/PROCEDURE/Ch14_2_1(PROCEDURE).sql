/*
預存程序與厦序物件 Chapter 14

在用戶端建立資料服嗎用程式後．使用ADO 或 ADO.NET每元件送出
T-sQL 指令叙述至 SQL Server•就可以在SQL Server 資料庫引擎執行T-SQL 指令叙述。

在sQL server 先將欲執行的 T-sQL指令叙述建立成預存程序•此時用戶端程式可以直接執行位在 SQL Server 的預存程序。

在用戶端執行預存程序而不直接送出;T-SQL指令叙迹的優點，如下所示：

增加執行效率：預存程序可以滅少編譯花費的時間 ，當我們重複執行預存程序時，因為不需要重新編譯，所以能夠增進執行 T-SQL指令叙述的效率。
節省網路頻寬 ：在用戶端只需送出一列指令叙述就可以執行位在 SQLServer 伺服器的預存程序，而不用傅送完整數列、數十至數百列的 T-SQL
指令敘述，可以減少網路傳送的資料量。
模組化程式設計：透過預存程序，T-SQL 語言也可以使用模組化程式設計，將常常執行的T-SQL 指令叙述建立成多個預存程序的模組，讓使用者重複使用這些預存程序建立的函數庫。
提供安全性：預存程序是 SQL Server 資料庫物件，我們可以透過授與預存程序權限來存取使用者沒有擁有權限的物件。而且，擁有參數的預存
程序還可以增加用戶端程式的安全性，降低駭客攻擊 SQL Server 伺服器的機會。
*/
CREATE PROCEDURE student_query AS -- 或 CREATE PROC
--[WITH {RECOMPLIE | ENCRYPTION | RECOMPILE, ENCRYPTION}]
/*
RECOMPLIE: 每次執行都重新編譯
ENCRYPTION： 加密， 使用者就無法使用系統檢視表來查詢預存程序的內容
RECOMPILE ,ENCRYPTION
*/
BEGIN
  SELECT no, name, phone
  FROM student
END
GO -- 必須要有Go做此批的結束

EXEC student_query
