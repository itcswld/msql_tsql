USE 教務系統 
GO
SELECT 教授.教授編號, 員工.姓名, 教授.職稱, 員工.薪水
--full join: right and left table the colums value which can not match will be null 
FROM 教授 FULL JOIN 員工 
ON 教授.身份證字號 = 員工.身份證字號

select a.no, b.name, a.job, b.salary
from proffessor a
full join employee b 
on a.emp_id = b.id



























































