--multi-column group by 1 column
select * from 
(select  row_number() over(partition by pro_no order by LOC_NO) as rn , pro_no, loc_No from stk ) x 
where rn = 1