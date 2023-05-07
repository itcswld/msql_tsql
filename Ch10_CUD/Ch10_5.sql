USE 教務系統 
GO
CREATE TABLE [客戶] (
   [客戶編號]   char(4)   NOT NULL PRIMARY KEY, 
   [姓名] varchar(12) NOT NULL,
   [電話] varchar(15) NULL
)
GO
CREATE TABLE [新客戶] (
   [客戶編號]   char(4)   NOT NULL PRIMARY KEY, 
   [姓名] varchar(12) NOT NULL,
   [電話] varchar(15) NULL
)
GO
INSERT INTO [客戶] 
VALUES
('C001','陳會安','02-22222222'),
('C002','陳允傑','03-33333333')
GO
INSERT INTO [新客戶] 
VALUES
('C003','陳小傑','05-22222222'),
('C002','陳允傑','04-44444444')
GO
SELECT * FROM [客戶]
GO
SELECT * FROM [新客戶]

----eng
CREATE TABLE [cus] (
   [no]   char(4)   NOT NULL PRIMARY KEY, 
   [name] varchar(12) NOT NULL,
   [tel] varchar(15) NULL
)
GO
CREATE TABLE [new_cus] (
   [no]   char(4)   NOT NULL PRIMARY KEY, 
   [name] varchar(12) NOT NULL,
   [tel] varchar(15) NULL
)
GO
INSERT INTO [cus] 
VALUES
('C001','陳會安','02-22222222'),
('C002','陳允傑','03-33333333')
GO
INSERT INTO [new_cus] 
VALUES
('C003','陳小傑','05-22222222'),
('C002','陳允傑','04-44444444')
GO
SELECT * FROM [cus]
GO
SELECT * FROM [new_cus]




























































