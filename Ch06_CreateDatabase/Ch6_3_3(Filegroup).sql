/*
檔案群組
以利管理、資料配置和放置之用。
*/
--example 1
USE master
GO
CREATE DATABASE LC~
--1. Primary Filegroups
ON PRIMARY --檔案群組
  ( NAME='�N�z���~', --//邏輯檔名
    FILENAME= 'D:\Data\�N�z���~.mdf', -- path
    SIZE=8MB,--//init size
    MAXSIZE=10MB,
    FILEGROWTH=1MB ),--//自動成長/大小上限 ： 以1MB為單位， 無限制
--2. User-defined Filegroups
FILEGROUP �N�z���~_�s��--//自定義之檔案群組
  ( NAME = '�N�z���~_�s��_11', --//邏輯檔名
    FILENAME = 'D:\Data\�N�z���~_�s��_11.ndf',--// path
    SIZE = 2MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB ),
  ( NAME = '�N�z���~_�s��_12',
    FILENAME = 'D:\Data\�N�z���~_�s��_12.ndf',
    SIZE = 2MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB )
--交易記錄檔 （不屬於任何filegroup)
LOG ON
  ( NAME='�N�z���~_log',
    FILENAME = 'D:\Data\�N�z���~_log.ldf',
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
