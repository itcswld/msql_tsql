--Update from One Table to Another Based on a ID Match
UPDATE a
SET 
a.col1=b.co1
a.col2=b.col2
FROM tb1 a
INNER JOIN
tb2 b
ON a.pk = b.pk