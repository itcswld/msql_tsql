USE 教務系統 
GO
SELECT COUNT(*) AS 選課數 FROM 班級 
WHERE 學號 = 
(SELECT 學號 FROM 學生 WHERE 姓名='陳會安') --//subquery 不可ORDER  BY , 應使用GROUP BY

--how many course he choosed?
SELECT COUNT(*) as choosedCourses FROM class
WHERE stud_no =
(SELECT no FROM student WHERE name='陳會安')
--what course he choosed?
SELECT b.title as choosedCourses FROM class a
LEFT JOIN course b ON a.course_no = b.[no]
WHERE stud_no =
(SELECT no FROM student WHERE name='陳會安')












































