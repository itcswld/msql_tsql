CREATE TABLE TRAC (
S_trac_taskid VARCHAR(15) NOT NULL,
S_trac_tablename VARCHAR(20) NOT NULL,
S_trac_type CHAR(1) NOT NULL,
T_trac_date	DATETIME NOT NULL,
I_trac_sendokcount INT NOT NULL,
I_trac_receiverrcount INT NOT NULL,
I_trac_status TINYINT NOT NULL,
N_trac_memo	NVARCHAR(500) NULL,
PRIMARY KEY (S_trac_taskid, S_trac_tablename)
)ON IDB_TRAC_FG


