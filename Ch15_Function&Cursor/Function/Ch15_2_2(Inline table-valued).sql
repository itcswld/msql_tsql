USE �аȨt�� 
GO
CREATE FUNCTION fnProfessor
    (@salary money)
    RETURNS TABLE
RETURN (
  --inline table-valued function 回傳table
  SELECT Professor.no, employ.name, Professor.dept,
         Professor.title, employ.salary
  FROM Professor INNER JOIN employ 
  ON Professor.no = employ.no
  WHERE employ.salary >= @salary )

  SELECT * FROM dbo.fnProfessor(5000)

