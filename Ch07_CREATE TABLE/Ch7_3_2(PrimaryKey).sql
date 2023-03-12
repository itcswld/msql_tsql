USE �аȨt�� 
GO
CREATE TABLE tableName (
   col1   int       NOT NULL, 
   col2   smallint  NOT NULL,
   col3       int       DEFAULT 1,
   PRIMARY KEY (col1, col2) --括號內為多欄位的複合鍵
)



