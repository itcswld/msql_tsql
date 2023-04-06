USE edusys 
GO
CREATE TABLE course (
   no  char(5)    NOT NULL PRIMARY KEY ,
   title      varchar(30) NOT NULL ,
   credits      int         DEFAULT 3
)
--“ON 檔案群組名稱” 或 “TEXTIMAGE_ON 檔案群組名稱” 沒有ON則是預設檔案群組 //Ch6_3_3(Filegroup)
ON edusys_groups

