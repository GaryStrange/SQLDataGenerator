CREATE FUNCTION [dbo].[QUOTENAME2]
(
	@character_name NVARCHAR(3998)
	,@quote_character NCHAR(1)
)
RETURNS NVARCHAR(4000)
AS
BEGIN
	--The system QUOTENAME function is limited to just 128 chars.
	RETURN CONCAT( @quote_character , @character_name , @quote_character )
END
