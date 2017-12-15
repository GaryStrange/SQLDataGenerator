CREATE FUNCTION [dbo].[CrossApplyRandomInt]
(
	@minInt INT = 1
	,@maxInt INT = 10
	,@alias sysname
	,@seedColumnName sysname
)
RETURNS NVARCHAR(4000)
AS
BEGIN
	RETURN (
		SELECT CONCAT('cross apply'
		, [\n], [\t], 'dbo.RandomNumberColumn('
		, CONCAT_WS( [comma], @minInt, @maxInt, @seedColumnName )
		, ') ', @alias)
		FROM dbo.Punctuation
	)
END
