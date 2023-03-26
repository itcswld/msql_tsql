USE edusys 
GO
DECLARE student_keyset CURSOR
--KEYSET：只將唯一鍵值暫存於table， 其他是從來源table取得， upd/delete可動態更新， 但不可insert
KEYSET
FOR SELECT no, name, phone FROM student 
    WHERE sex = '男'
    
OPEN student_keyset
DECLARE @id char(5)
DECLARE @name varchar(10)
DECLARE @tel varchar(15)
FETCH FIRST FROM student_keyset 
INTO @id, @name, @tel
WHILE @@FETCH_STATUS <> -1
BEGIN
    IF @@FETCH_STATUS = -2
         PRINT 'Missing Record.'
    PRINT @id + ' - ' + @name + ' - ' + @tel
    FETCH NEXT FROM student_keyset
    INTO @id, @name, @tel
END
CLOSE student_keyset
DEALLOCATE student_keyset
