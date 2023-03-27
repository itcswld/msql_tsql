/*
使用 IDENTITY INSERT 選項允許將明確值插入資料表的識別欄位，其語法如下：

SET IDENTITY_INSERT 資料表名稱 ON | OFF
 ON，就是設定【資料表名稱】的資料表選項，可將明碓值插入资料表的識別欄位 ：
 OFF 是不可。因同一時間 ，SQL Servor 只許1個資料表為 ON，所以在插入記錄後，記得將它切換成 OFF。
*/
USE edusys 
GO
--建立【好客戶】和【好員工】兩個資料表
CREATE TABLE GoodCus (
   no int IDENTITY PRIMARY KEY,
   id varchar(12) NOT NULL,
   name char(12)
)
CREATE TABLE GoodEmp (
   no int IDENTITY PRIMARY KEY,
   name varchar(12) NOT NULL
)
GO
--使用順序物件產生的數值來插入這2個資料表的識別欄位。
SET IDENTITY_INSERT GoodCus ON
GO
INSERT INTO GoodCus(no, id, name)--have to make a column list 
VALUES (NEXT VALUE FOR seqName, 'A333333333' , 'Joe') --在【GoodCus】資料表插入一筆記錄
GO
SET IDENTITY_INSERT GoodCus OFF
GO
SET IDENTITY_INSERT GoodEmp ON
GO
INSERT INTO GoodEmp(no, name) 
VALUES (NEXT VALUE FOR seqName, 'Eve')
GO
INSERT INTO GoodEmp(no, name)
VALUES (NEXT VALUE FOR seqName, 'Chi')--【GoodEmp】資料表插人 2筆記錄。
GO
SET IDENTITY_INSERT GoodEmp OFF
GO
SELECT * FROM GoodCus
GO
SELECT * FROM GoodEmp
