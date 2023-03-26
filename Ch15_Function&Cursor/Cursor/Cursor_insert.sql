/*
现有的数据都是按ID依次递增，并且这些ID是根据班级来划分的，比如ID 1-50为1班，51-100为2班。
但是某天1班来了个插班生，需要将其ID设为51，2班的所有ID依次加1。当然这里ID不是自增主键也不為其他table的REFERENCE key ，否则就不能更改了 
*/

CREATE TABLE Students (
    name varchar(12),
    no varchar(4)
)
insert into  [students]  VALUES('陳會安' , 'S001')
insert into  [students]  VALUES('江小魚'  ,'S002')
insert into  [students]  VALUES('張無忌' , 'S003')
insert into  [students]  VALUES('陳小安' ,'S004')
insert into  [students]  VALUES('孫燕之' , 'S005')
insert into  [students]  VALUES( '周杰輪','S006')
insert into  [students]  VALUES('蔡一零' , 'S007')
insert into  [students]  VALUES('劉得華' , 'S008')

DECLARE @newName VARCHAR(12) = '插班生'
DECLARE @no char(4)

DECLARE cursor1 CURSOR FOR SELECT no FROM Students WHERE convert(int,SUBSTRING(no,4,1)) > 2 ORDER BY no DESC --需要从大到小排序，防止更改no时有重复
OPEN cursor1
FETCH NEXT FROM cursor1 INTO @no --初始化游标
WHILE @@FETCH_STATUS=0 --成功取到数据，即游标还没到头
        BEGIN
                  UPDATE Students SET no = 'S00' + CONVERT(varchar, (convert(int,SUBSTRING(no,4,1)) + 1)) WHERE no = @no
                  FETCH NEXT FROM cursor1 INTO @no --游标下移一条数据，再次将ID赋值到@id
        END
CLOSE cursor1
DEALLOCATE cursor1
INSERT Students(no, Name) VALUES('S003', @newName) --插入插班生记录
SELECT * from students
