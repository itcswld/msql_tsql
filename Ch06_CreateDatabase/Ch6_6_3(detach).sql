USE master
GO
/*
sp_detach_db： 卸離 , 非drop 刪除db, 而是將db“定義資料”從master database 刪除，資料庫就會看不到該db。  
目的:避免沒有在使用的db佔用資源
或 將db移至其他sql svr （使用者就可複製.mdf和.ldf檔到其他sql svr）
*/
EXEC sp_detach_db 'databaseName' 