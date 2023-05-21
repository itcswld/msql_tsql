create proc add_course 
    @no char(5),
    @title varchar(30),
    @credits int
as 
BEGIN
    DECLARE @err_no int

    insert into course values(@no, @title, @credits)

    set @err_no = @@ERROR
    if @err_no != 0
    BEGIN
        if @err_no = 2627
            print 'Cannot insert duplicate key!'
        else 
             print error_message()
    END

    RETURN @err_no
END
GO

DECLARE @result int
EXEC @result = add_course 'CS222','資料庫程式設計',3
print 'return code: ' + CONVERT(varchar, @result)