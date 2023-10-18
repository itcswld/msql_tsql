SELECT *
FROM SYS.EXTENDED_PROPERTIES
WHERE[name] = N'MS_DESCRIPTION'

SELECT *
FROM SYS.COLUMNS

SELECT * FROM  INFORMATION_SCHEMA.COLUMNS

SELECT * FROM SYS.tables

exec sp_describe_first_result_set N'SELECT * FROM ADJIN_HEAD'

--table_columnInfo
SELECT
t.name TableName
,s.ORDINAL_POSITION SEQ
,c.name ColName
,p.[value] C_NAME
,s.DATA_TYPE + IIF(s.CHARACTER_MAXIMUM_LENGTH IS NULL,'' ,CONCAT('(', s.CHARACTER_MAXIMUM_LENGTH,')')) DATA_TYPE
,IIF(s.IS_NULLABLE = 'NO', 'N','Y') IS_NULLABLE
FROM SYS.tables t
INNER JOIN SYS.all_columns c ON c.object_id = t.object_id
INNER JOIN SYS.extended_properties p ON p.major_id = t.object_id AND p.minor_id = c.column_id AND p.CLASS = 1
INNER JOIN INFORMATION_SCHEMA.COLUMNS s ON s.COLUMN_NAME = c.name