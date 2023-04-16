USE master
GO
CREATE DATABASE dbName
ON PRIMARY
--//（主）資料檔規格清單
  ( NAME='dbName',
    FILENAME= 'D:\Data\dbName.mdf', -- //mdf : master data file
    SIZE=8MB,
    MAXSIZE=10MB,
    FILEGROWTH=10% 
    ) 

LOG ON
--//交易記錄檔規格清單
  ( NAME='dbName_log',
    FILENAME = 'D:\Data\dbName_log.ldf', --ldf: log data file
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=10% )
-- [COLLATE 定序名稱] //中文，Chinese_Taiwan_Stroke_CI_AS以筆畫順序來排序； Chinese_Taiwan_Bopomofo_CI_AI以注音符號排序
-- [FOR ATTATCH] //它方sql svr 的db, exec sp_detach_db卸離後 , 將db“定義資料.mdf和.ldf檔” 移至此sql svr

/*
復原模式
1.FULL: 記錄每筆交易， 直到使用者備份交易記錄檔， 才會刪除已完成的交易記錄。 支援完整/差異/交易記錄備份
2.Bluk-logged: 只會記錄相關操作， 不會完整記錄詳細的。 記錄操作指令方式分：BCP/BLUK INSERT/WRITETEXT
3.Simple: 完成交易後自動清除
*/


DROP DATABASE dbName;
GO
CREATE DATABASE dbName
ON PRIMARY
(
    NAME = 'dbName',
    FILENAME='/Users/eve/Developer/azure/dbName.mdf',
    SIZE = 8MB,
    MAXSIZE=10MB,
    FILEGROWTH=10%
)
LOG ON (
    NAME = 'dbName_log',
    FILENAME = '/Users/eve/Developer/azure/dbName_log.ldf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH = 10%
)


