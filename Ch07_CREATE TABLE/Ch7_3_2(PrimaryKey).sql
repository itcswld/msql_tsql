USE dbName 
GO
CREATE TABLE tableName (
   col1   int       NOT NULL, 
   col2   smallint  NOT NULL,
   col3       int       DEFAULT 1,
   PRIMARY KEY (col1, col2) --括號內為多欄位的複合鍵
)

--add primary key
alter table <tbName> drop CONSTRAINT <constraint_name>
alter table <tbName> add primary key (col1,col2,col3)

--edit:you can find the constraint name by using the query below:
select OBJECT_NAME(OBJECT_ID) AS NameofConstraint
FROM sys.objects
where OBJECT_NAME(parent_object_id)='tbName'
and type_desc LIKE '%CONSTRAINT'


