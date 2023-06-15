USE dbName 
--GO: 批次的結束
GO
CREATE TABLE tbName (
   -- "PRIMARY KEY" or "UNIQUE"
   id char(10)   NOT NULL PRIMARY KEY,
   name       varchar(12) NOT NULL,
   --DEFAULT
   city       varchar(5)  DEFAULT '台北',
   str       varchar(30),
   phone       char(12),
   salary       money,
   salary       money,
   tax      money
)


/*
varchar vs nvarchar
nvarchar(n) = varchar(n*2)
*/


--Duplicate a table
select * into tb_copy from tbName

