CREATE FUNCTION [dbo].[RandomIntColumn]
(
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	SELECT rnc.*
	FROM dbo.IntConst() Int32
	CROSS APPLY  [dbo].[RandomNumberColumn](1, Int32.MaxInt, @Guid) rnc
)
