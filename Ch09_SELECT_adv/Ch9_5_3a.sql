USE edusys 
GO
CREATE TABLE supervisor (
  emp_id char(10) NOT NULL,
  name varchar(12) NULL,
  sup_id char(10) NULL,
  PRIMARY KEY (emp_id)
) 
GO
INSERT INTO supervisor 
VALUES ('A123456789','陳慶新',NULL)
GO
INSERT INTO supervisor 
VALUES ('A222222222','楊金欉','A123456789')
GO
INSERT INTO supervisor 
VALUES ('H098765432','李鴻章','A222222222')
GO
INSERT INTO supervisor 
VALUES ('F213456780','陳小安','E444006666')
GO
INSERT INTO supervisor 
VALUES ('A221304680','郭富城','F213456780')
GO
INSERT INTO supervisor 
VALUES ('F332213046','張無忌','D444403333')
GO
INSERT INTO supervisor 
VALUES ('D333300333','王心零','A222222222')
GO
INSERT INTO supervisor 
VALUES ('D444403333','劉得華','E444006666')
GO
INSERT INTO supervisor 
VALUES ('E444006666','小龍女','A123456789')
GO

















 































































