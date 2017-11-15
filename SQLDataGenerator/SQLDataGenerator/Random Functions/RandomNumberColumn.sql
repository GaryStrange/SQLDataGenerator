CREATE FUNCTION [dbo].[RandomNumberColumn]
(
	@MinNumber INT = 1,
	@MaxNumber INT = 10,
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	SELECT ABS(CHECKSUM(@Guid)) % (@MaxNumber - @MinNumber + 1) + @MinNumber RandColumn
)
