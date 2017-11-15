CREATE FUNCTION [dbo].[RandomFloatColumn]
(
	@MinNumber INT = 1,
	@MaxNumber INT = 10,
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	SELECT CAST(ABS(CHECKSUM(@Guid)) AS FLOAT) / (SELECT CAST(MaxInt AS FLOAT) / (@MaxNumber - @MinNumber) FROM IntConst()) + @MinNumber RandColumn
)
