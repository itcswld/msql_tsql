select  is_broker_enabled
from sys.database where name = 'MSDB'

alter database MSDB SET enable_broker