CREATE FUNCTION [dbo].[RandomCharFromChars]
(
	@Chars nvarchar(4000),
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	SELECT SUBSTRING(@Chars, RandColumn , 1) aChar
	FROM [RandomNumberColumn](1, ISNULL(LEN(@Chars),1), @Guid )
)
