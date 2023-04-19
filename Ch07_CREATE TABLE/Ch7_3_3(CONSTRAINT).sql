USE dbName 
GO
CREATE TABLE tbName (
   col1   int   NOT NULL IDENTITY PRIMARY KEY, 
   col2  money NOT NULL 
       CONSTRAINT ck_col2
       CHECK (col2 > 0),
   col3   money DEFAULT 0
       CHECK (col3 > 0)
)

--drop constraint
alter table <tbName> drop CONSTRAINT <constraint_name>

--add contrant
alter table dbName 
add constraint 
df_col1 
default([dbo].[fnCol1]())
for col1




