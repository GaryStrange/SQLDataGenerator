CREATE FUNCTION [dbo].[CrossApplyRandomElementFromCSV]
(
	@CSV nvarchar(4000)
	,@alias sysname = 'c1'
	,@seedColumnName sysname
	,@delimiter NVARCHAR(7) = 'default'
)
RETURNS NVARCHAR(4000)
AS
BEGIN
	RETURN (
		SELECT CONCAT('cross apply'
		, [\n], [\t], 'dbo.RandomElementFromCSV('
		, CONCAT_WS( [Comma], dbo.QUOTENAME2(@CSV,[Quote]), @delimiter, @seedColumnName )
		, ') ', @alias)
		FROM dbo.Punctuation
	)
END

