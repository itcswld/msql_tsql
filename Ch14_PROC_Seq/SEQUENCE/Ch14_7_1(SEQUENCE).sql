USE edusys 
GO
/*
SEQUENCE 流水號產生器
可根據建立順序時指定的開始值、增量和結束值產生流水號
定義的間隔， 依照遞增或遞減的順序產生流水號。
*/
CREATE SEQUENCE seqName AS INT --[AS Type]
   START WITH 1
   INCREMENT BY 1
   MINVALUE 1
   NO MAXVALUE
GO
/*
START WITH 常數值 ： 順序物件傅回的第 1個值，它就是遞增順序物件的最小值；遞減順序物件的最大值
INCREMENT BY 常數值 ： 每次呼叫 NEXT VALUE FOR 時遞增的增量值，負數是遞減，增量不能為 0，預設值是 1
MINVALUE [常數值] | NO MINVALUE： 指定順序物件的最小值，沒有指定就是資料類型的最小值
MAXVALUE  [常數值]| NO MAXVALUE： 指定順序物件的最大值，沒有指定就是資料類型的最大值
CYCLE | NO CYCLE ： 指定當超出範圍是否重新啟動，再循環產生下一個值。
CACHE | NO CACHE ： 指定快取尺寸來提升效能
*/

SELECT NEXT VALUE FOR seqName AS 整數順序
