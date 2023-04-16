/*
檔案群組
以利管理、資料配置和放置之用。

次要 （扩展名.ndf是Secondary data files的缩写）
次要数据文件是可选的，由用户定义并(User-defined)存储用户数据。通过将每个文件放在不同的磁盘驱动器上，
次要文件可用于将数据分散到多个磁盘上。另外，如果数据库超过了单个 Windows 文件的最大大小，
可以使用次要数据文件，这样数据库就能继续增长。
1.可以有很多個
2.在create table時可以assign不同table去我們自訂的不同filegroup，並且去不同的disk
3.可以拿來做Partially backup (只backup我們想要的filegroup，則可以只backup我們想要的tables，不需要一次backup一整個DB)

如果.mdf足够大，那么可以不使用.ndf
建议使用这些扩展名以帮助标识文件的用途。
*/
--example 1
USE master
GO
CREATE DATABASE dbName
--1. Primary Filegroups
ON PRIMARY --檔案群組
  ( NAME='dbName', --//邏輯檔名
    FILENAME= 'D:\Data\dbName.mdf', -- path
    SIZE=8MB,--//init size
    MAXSIZE=10MB,
    FILEGROWTH=1MB ),--//自動成長/大小上限 ： 以1MB為單位， 無限制
--2. User-defined Filegroups
FILEGROUP dbName_groups--//自定義之檔案群組
  ( NAME = 'dbName_groups_11', --//邏輯檔名
    FILENAME = 'D:\Data\dbName_groups_11.ndf',--// path
    SIZE = 2MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB ),
  ( NAME = 'dbName_groups_12',
    FILENAME = 'D:\Data\dbName_groups_12.ndf',
    SIZE = 2MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB )
--交易記錄檔 （不屬於任何filegroup)
LOG ON
  ( NAME='dbName_log',
    FILENAME = 'D:\Data\dbName_log.ldf',
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=10% )

--3. Default Filegroups 可設定 Primary Filegroup 或 User-defined Filegroups


--example 2
USE master;
GO
-- Create the database with the default data
-- filegroup, filestream filegroup and a log file. Specify the
-- growth increment and the max size for the
-- primary data file.
CREATE DATABASE MyDB
ON PRIMARY
  ( NAME='MyDB_Primary',
    FILENAME=
       'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\data\MyDB_Prm.mdf',
    SIZE=4MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
--filegroup
FILEGROUP MyDB_FG1
  ( NAME = 'MyDB_FG1_Dat1',
    FILENAME =
       'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\data\MyDB_FG1_1.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
  ( NAME = 'MyDB_FG1_Dat2',
    FILENAME =
       'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\data\MyDB_FG1_2.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
-- filestream filegroup and a log file. 
FILEGROUP FileStreamGroup1 CONTAINS FILESTREAM
  ( NAME = 'MyDB_FG_FS',
    FILENAME = 'c:\Data\filestream1')
LOG ON
  ( NAME='MyDB_log',
    FILENAME =
       'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\data\MyDB.ldf',
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB);
GO
ALTER DATABASE MyDB 
  MODIFY FILEGROUP MyDB_FG1 DEFAULT;
GO

-- Create a table in the user-defined filegroup.
USE MyDB;
CREATE TABLE MyTable
  ( cola int PRIMARY KEY,
    colb char(8) )
--filegroup 
ON MyDB_FG1;
GO

--Create a table in the filestream filegroup
CREATE TABLE MyFSTable
(
	cola int PRIMARY KEY,
--filestream
  colb VARBINARY(MAX) FILESTREAM NULL
)
GO
