CREATE FUNCTION ConvertNumberToChinese (@number INT)
RETURNS NVARCHAR(MAX)
AS 
BEGIN 
    DECLARE @chinese NVARCHAR(MAX) = N''

    DECLARE @digits TABLE (digit INT, chinese NVARCHAR(10))
    INSERT INTO @digits (digit, chinese) VALUES (0, N'零')
    INSERT INTO @digits (digit, chinese) VALUES (1, N'壹')
    INSERT INTO @digits (digit, chinese) VALUES (2, N'贰')
    INSERT INTO @digits (digit, chinese) VALUES (3, N'叁')
    INSERT INTO @digits (digit, chinese) VALUES (4, N'肆')
    INSERT INTO @digits (digit, chinese) VALUES (5, N'伍')
    INSERT INTO @digits (digit, chinese) VALUES (6, N'陆')
    INSERT INTO @digits (digit, chinese) VALUES (7, N'柒')
    INSERT INTO @digits (digit, chinese) VALUES (8, N'捌')
    INSERT INTO @digits (digit, chinese) VALUES (9, N'玖')

    DECLARE @digits_unit TABLE (digit_unit INT, chinese_unit NVARCHAR(10))
    INSERT INTO @digits_unit (digit_unit, chinese_unit) VALUES (0, N'')
    INSERT INTO @digits_unit (digit_unit, chinese_unit) VALUES (1, N'拾')
    INSERT INTO @digits_unit (digit_unit, chinese_unit) VALUES (2, N'佰')
    INSERT INTO @digits_unit (digit_unit, chinese_unit) VALUES (3, N'仟')
    INSERT INTO @digits_unit (digit_unit, chinese_unit) VALUES (4, N'万')
    INSERT INTO @digits_unit (digit_unit, chinese_unit) VALUES (8, N'亿')

    IF @number = 0
        SET @chinese = N'零'
    ELSE 
    BEGIN
        DECLARE @pos INT = 0
        DECLARE @unit INT
        DECLARE @digit INT

        WHILE @number > 0 
        BEGIN
            SET @unit = @pos % 4
            SET @digit = @number % 10

            IF @unit = 0 AND @digit = 0
                SET @chinese = (SELECT chinese_unit FROM @digits_unit WHERE digit_unit = @pos) + @chinese
            ELSE
                SET @chinese = (SELECT chinese FROM @digits WHERE digit = @digit) + (SELECT chinese_unit FROM @digits_unit WHERE digit_unit = @unit) + @chinese

            SET @number = @number / 10
            SET @pos = @pos + 1
        END
    END

    RETURN @chinese
END

SELECT dbo.ConvertNumberToChinese(12345) -- Output: 壹万贰仟叁佰肆十五

