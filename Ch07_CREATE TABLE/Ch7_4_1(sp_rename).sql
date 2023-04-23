USE dbName 
GO
--修改物件名稱
EXEC sp_rename 'obj_name', 'new_obj_name' --[,'obj_type'] // (DATABASE/TABLE/COLUMN/INDEX/STORED PROCEURE) default obj_type is TABLE

--The following renames column of the table to new_column_name.

EXEC sp_rename 'tb.col_name', 'new_col_name';