USE IDB 
GO
CREATE TRIGGER tgUpdIsdue
ON PRODUCT 
AFTER INSERT
AS 
BEGIN
 UPDATE PRODUCT SET p_isdue = dbo.fnDueCheck(expir_due)
END
GO


