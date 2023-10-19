create LOGIN itadmin
with PASSWORD ='admin@2220'
GO
create USER itadmin for login itadmin
GO

DENY UPDATE on [edusys].[dbo].[book](id)  to itadmin
GO
GRANT insert on [edusys].[dbo].[book] to itadmin
GRANT UPDATE on [edusys].[dbo].[book](cat_id) to itadmin
GO
