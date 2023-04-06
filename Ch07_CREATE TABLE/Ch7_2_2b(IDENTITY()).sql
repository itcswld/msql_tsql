USE dbName 
GO
CREATE TABLE tbName (
   -- IDENTITY(1000, 1) : IDENTITY(初始, 遞增), 
   autoIncreaseID   int         IDENTITY(1000, 1), 
   col1   char(4)     NOT NULL PRIMARY KEY,
   col2       varchar(10),
   col3       varchar(5),
   col4 char(10)   NOT NULL
)


