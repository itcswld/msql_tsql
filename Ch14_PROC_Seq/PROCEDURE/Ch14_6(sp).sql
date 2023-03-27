USE �аȨt�� 
GO
--System stored Procedures

-- sp_helptext: stored Procedures code
EXEC sp_helptext proCourse
GO
--sp_columns 資料表名稱： 傳回指定資料表或檢視表的欄位資訊
EXEC sp_columns student
GO

/*
sp_help [名稱] : 傳回參數指定的資料庫物件、使用者自訂資料類型或 SQL Server
sp_helptext 名稱： 內建資料類型的資訊，如果没有參數，就是傅回所有物件的資訊傳回參數預存程序、自訂函數、觸發程序或檢視表的內容
sp_helpdb [資料庫名稱] ： 傳回參數資料庫的資訊，如果沒有參數，就是傳回所有資料庫的摘要資訊
sp_columns 資料表名稱： 傳回指定資料表或檢視表的欄位資訊
sp_who[登入帳戶]：提供 SQL Server 執行個體中關於目前使用者、工作階段和處理序的資訊
sp_droplogin 登入帳戶：刪除指定的登入帳戶

xp_cmdshell ： 執行 Windows 作業系統的命令
xp_ msver： 傳回 SOL Server 版本資訊
xp_logininfo: 傳回 Windows 使用者和群組的資訊
*/

