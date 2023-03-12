USE dbName 
GO
CREATE TABLE tbName (
   col1   int   NOT NULL IDENTITY PRIMARY KEY, 
   col2   money NOT NULL,
   col3  money DEFAULT 0,
   CHECK ( (col2 > 0) AND (col3 > 0) 
            AND (col2 > col3))
)





