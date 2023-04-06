USE dbName 
GO
CREATE TABLE tbName (
   order_id  int    NOT NULL IDENTITY PRIMARY KEY, 
   pro_no    char(4)  NOT NULL,
   ttl_price        decimal(5, 1) NOT NULL,
   qty        int       NOT NULL DEFAULT 1,
   --Computed Columns
   avg_price    AS   ttl_price/ qty
)


