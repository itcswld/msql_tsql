USE 教務系統 
GO
CREATE TABLE 記錄業績目標 (
    客戶編號 char(4) NOT NULL PRIMARY KEY, 
    原始目標 money NOT NULL, 
    最新目標 money NOT NULL
)
GO

CREATE TABLE sales_record (
    cus_no char(4) NOT NULL PRIMARY KEY, 
    org_tgt money NOT NULL, 
    new_tgt money NOT NULL
)


























































