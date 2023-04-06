USE master
GO
CREATE DATABASE dbName
ON PRIMARY
( FILENAME = 'D:\Data\dbName.mdf' ) --來源資料庫（複製好的資料庫檔案）
FOR ATTACH--回存資料庫
