CREATE FUNCTION [dbo].[RandomMoneyColumn]
(
	@MinNumber INT = 1,
	@MaxNumber INT = 10,
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	SELECT CAST(RandColumn AS MONEY) RandColumn
	FROM dbo.RandomFloatColumn(@MinNumber, @MaxNumber, @Guid )
)
