use master
go
CREATE database IDB on PRIMARY(
    NAME = 'IDB',
    FILENAME =  '/Users/eve/Developer/azure/IDB.mdf',
    SIZE = 8MB,
    MAXSIZE=100MB,
    FILEGROWTH=1MB
),
FILEGROUP IDB_WMS_FG(
    NAME = 'IDB_WMS_FG',
    FILENAME =  '/Users/eve/Developer/azure/IDB_WMS_FG.ndf',
    SIZE = 8MB,
    MAXSIZE=100MB,
    FILEGROWTH=1MB
),
FILEGROUP IDB_OTHER_FG(
    NAME = 'IDB_TRAC_FG',
    FILENAME =  '/Users/eve/Developer/azure/IDB_OTHER_FG.ndf',
    SIZE = 8MB,
    MAXSIZE=100MB,
    FILEGROWTH=1MB
)
LOG ON(
    NAME = 'IDB_log',
    FILENAME =  '/Users/eve/Developer/azure/IDB.ldf',
    SIZE = 1MB,
    MAXSIZE=100MB,
    FILEGROWTH=10%
)
COLLATE Chinese_Taiwan_Stroke_CI_AS

-----WINDOWS
-- CREATE database IDB on PRIMARY(
--     NAME = 'IDB',
--     FILENAME =  '/Users/eve/Developer/azure/IDB.mdf',
--     SIZE = 8MB,
--     MAXSIZE = 100MB,
--     FILEGROWTH=1MB
-- ),
-- FILEGROUP IDB_WMS_FG(
--     NAME = 'IDB_WMS_FG',
--     FILENAME =  '/Users/eve/Developer/azure/IDB_WMS_FG.ndf',
--     SIZE = 8MB,
--     MAXSIZE = 100MB,
--     FILEGROWTH=1MB
-- ),
-- FILEGROUP IDB_TRAC_FG(
--     NAME = 'IDB_TRAC_FG',
--     FILENAME =  '/Users/eve/Developer/azure/IDB_TRAC_FG.ndf',
--     SIZE = 8MB,
--     MAXSIZE = 100MB,
--     FILEGROWTH=1MB
-- )
-- LOG ON(
--     NAME = 'IDB_log',
--     FILENAME =  '/Users/eve/Developer/azure/IDB.ldf',
--     SIZE = 1MB,
--     MAXSIZE = 100MB,
--     FILEGROWTH=10%
-- )
