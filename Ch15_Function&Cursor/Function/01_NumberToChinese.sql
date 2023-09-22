ALTER  Function [dbo].[fnTotalChinese](@money int)
returns nvarchar(40)

BEGIN
   declare @num nvarchar(20)    --存儲金額的字符形式
         , @cn nvarchar(32)    --存儲金額的中文大寫
         , @n_chn nvarchar(1), @i int    --臨時變量
 
     select @cn=case when @money>=0 then '' else null end
         , @money=abs(@money)
         , @num=stuff(str(@money, 15, 2), 13, 1, '')    --加前置空格補齊到位（去小數點）
         , @i=patindex('%[1-9]%', @num)    --找到金額最高位
 
     while @i>=1 and @i<=14
     begin
         set @n_chn=substring(@num, @i, 1)  
         if @n_chn != '0' or (substring(@num,@i+1,1) != '0' and @i not in(4, 8, 12, 14))    --數字轉中文大寫 
             set @cn=@cn+substring(N'零壹貳參肆伍陸柒捌玖', @n_chn+1, 1)
         if @n_chn != '0' or @i in(4, 8, 12)    --加單位
             set @cn=@cn+substring(N'仟佰拾億仟佰拾萬仟佰拾 角分',@i,1)    
   
         set @i=@i+1
     end
 
     set @cn=replace(@cn, N'億萬', N'億')    --金額為x億零萬時去‘萬’
     if @money=0 set @cn='零元整'    --金額為零時
     if @n_chn='0' set @cn=@cn+N'元整'    --金額末尾為零分時
 
  
     RETURN rtrim(@cn)
END

