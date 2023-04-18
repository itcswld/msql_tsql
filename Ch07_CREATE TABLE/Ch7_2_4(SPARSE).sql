USE �аȨt�� 
GO
CREATE TABLE tbName (
   col1  int    NOT NULL IDENTITY PRIMARY KEY, 
   col2  varchar(100),
   --SPARSE: NULL不佔儲存空間。 用於大部分欄位是NULL值。 不可用來建立索引
   col3  int    SPARSE
   /*

   */
)


