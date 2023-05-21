use edusys
go
CREATE PROCEDURE course_report AS
BEGIN
    SELECT c.no, c.name, b.* ,a.*
    from proffessor a inner JOIN(
        course b inner join(
               student c inner join class d on c.no = d.stud_no
        )on b.[no] = d.course_no
    )on a.[no] = d.prof_no
END
GO
EXEC course_report