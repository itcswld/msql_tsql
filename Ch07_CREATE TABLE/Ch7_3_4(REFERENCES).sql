USE dbName 
GO
CREATE TABLE tbName (
   col1   char(4)  NOT NULL, 
   col2   char(5)  NOT NULL,
   col3       char(4)  NOT NULL
              REFERENCES tb2 (col1),--//參考資料表PK
            --   [ON DELETE { CASCADE | NO ACTION}]  //當刪除參考資料表的關聯值時的處理， CASCADE： 一併刪除；NO ACTION： 拒絕刪除， 並發錯誤訊息
            --   [ON UPDATE { CASCADE | NO ACTION}] //當更新參考資料表的關聯值時的處理。 
   col4   datetime,
   col4       varchar(8), 
   PRIMARY KEY (col3, col1, col2),
   FOREIGN KEY (col1) REFERENCES tb3 (col1),
   FOREIGN KEY (col2) REFERENCES tb4(col1)
)


ALTER TABLE [tb1]
  ADD FOREIGN KEY([col1]) REFERENCES [tb2] ([col2])