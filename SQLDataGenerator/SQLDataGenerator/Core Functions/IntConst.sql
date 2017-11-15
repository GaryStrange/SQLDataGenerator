CREATE FUNCTION [dbo].[IntConst]
()
RETURNS TABLE AS RETURN
(
	select 
		 POWER(2,30)+ (POWER(2,30) -1) MaxInt
		,POWER(2,30) * -2 MinInt
)