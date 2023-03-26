-- 把姓與名字中间加上两个空格，以显示更美观
DECLARE @no char(4)
DECLARE @name VARCHAR(12)

DECLARE cursor1 CURSOR FOR SELECT name, no FROM student WHERE LEN(name) = 3 --找出名字长度为2的数据
OPEN cursor1 
FETCH NEXT FROM cursor1 INTO @name,@no --将游标所在位置的name和no赋值到@name和no以便操作
WHILE @@FETCH_STATUS = 0 --成功取到数据，即游标还没到头
        BEGIN
                  UPDATE Student SET name = SUBSTRING(@name, 1, 1) + '  ' + SUBSTRING(@name, 1, 2) WHERE no = @no --名字中间加空格
                  FETCH NEXT FROM cursor1 INTO @name,@no --游标下移一条数据，再次将name和id赋值到@name和no
        END
CLOSE cursor1
DEALLOCATE cursor1


update  [student]  set name='陳會安' where no='S001'
update  [student]  set name='江小魚' where no='S002'
update  [student]  set name='張無忌' where no='S003'
update  [student]  set name='陳小安' where no='S004'
update  [student]  set name='孫燕之' where no='S005'
update  [student]  set name='周杰輪' where no='S006'
update  [student]  set name='蔡一零' where no='S007'
update  [student]  set name='劉得華' where no='S008'