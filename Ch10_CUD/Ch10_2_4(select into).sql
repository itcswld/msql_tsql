USE 教務系統 
GO
SELECT * INTO 課程備份 
FROM 課程

SELECT * INTO 課程備份2 
FROM 課程
WHERE 學分 = 3

--copy whole table
select * into course_copy from course


DELETE course_copy
insert into  course_copy select * from course

