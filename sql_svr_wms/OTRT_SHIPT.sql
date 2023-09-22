/* Author: Eve | Date: 09/23/2023 */
CREATE TRIGGER OTRT_SHIPT
ON OTR
AFTER INSERT
AS
BEGIN
    DECLARE @NO =  SELECT [ERP_NO] FROM Inserted
    DECLARE @TTL INT
    
  IF 
    (SELECT INVOICELAG FROM OT = 0) AND
    ((SELECT COUNT(*) FROM OTR WHERE [ERP_NO] = @NO) =
        (SELECT COUNT(*) FROM OT WHERE [ERP_NO] = @NO))
  BEGIN
    SET @TTL = SELECT FLOOR(ROUND(SUM([P_PRICE] * [QTY]), 0)) FROM OTR WHERE [ERP_NO] = @NO

    INSERT INTO OTRT
    SELECT
    @TASKID [TASKID]
    ,[OWNDID]
    ,[ERP_NO]
    ,[SEQ]
    ,TO_STORE [PERSON]
    ,NULL [TAXID]
    ,[SKU]
    ,[QTY]
    ,[SALE_PRICE]
    ,NULL [INVOICE]
    ,[UPRICE] --建議售價
    ,[DISCOUNT]
    ,P_PRICE [PRICE] -- 單價
    ,FLOOR(ROUND(P_PRICE * QTY,0)) [TOTAL] --品項總金額
    
    ,0 [TAXHANDLE] --稅類別
    ,NULL [AMOUNT]
    ,FLOOR(ROUND(@TTL * 1.05, 0)) [SUM] --總計（含稅）
    ,@TTL [UNTAXED] -- 銷售額合計
    ,FLOOR(ROUND(@TTL * 0.05, 0)) [TAX]
    ,dbo.[fnTotalChinese] [UPPERPRICE] --中文大寫
    FROM OT WHERE [ERP_NO] = @NO
  END

END
GO