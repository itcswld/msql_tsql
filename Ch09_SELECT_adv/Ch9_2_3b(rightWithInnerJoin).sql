USE 教務系統 
GO
SELECT 學生.學號, 學生.姓名, 課程.*, 班級.教授編號 
FROM 課程 RIGHT JOIN --//若在outer join 使用where, 所有查尋都會變成inner join = left/right join 不會有任何作用
--table of 學生+班級共同的資料
(學生 INNER JOIN 班級 ON 學生.學號 = 班級.學號) 
ON 班級.課程編號 = 課程.課程編號

--最外層outer join, 內層只能用inner join
SELECT * 
FROM course a 
RIGHT JOIN (
    student b INNER JOIN class c ON  c.stud_no = b.[no]
    )
ON c.course_no = a.[no]
























































