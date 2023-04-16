CREATE FUNCTION fnDueCheck(@expir_due float) RETURNS bit
BEGIN
    DECLARE @isDue bit = 0
    IF @expir_due > 0
    BEGIN
        SET @isDue = 1
    END
    RETURN @isDue
END