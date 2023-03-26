USE edusys 
GO
ALTER FUNCTION fnProfessor
    (@tax money)
    RETURNS TABLE
RETURN (
  SELECT professor.emp_id, employee.name , professor.dept,
        professor.title, employee.salary
  FROM professor INNER JOIN employee 
  ON professor.emp_id = employee.id
  WHERE employee.tax >= @tax )
