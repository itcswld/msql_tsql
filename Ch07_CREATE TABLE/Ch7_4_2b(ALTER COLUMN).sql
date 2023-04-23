USE dbName
GO 
ALTER TABLE tbName
   ALTER COLUMN col1 varchar(20) NOT NULL


--alter type
ALTER TABLE table_name
ALTER COLUMN column_name datatype; 
--mysql  
--MODIFY MODIFY COLUMN column_name datatype;


ALTER TABLE Customers
DROP COLUMN Email

ALTER TABLE table_name
ADD column_name datatype;

--alter column name
EXEC sp_rename 'tb.col_name', 'new_col_name';



