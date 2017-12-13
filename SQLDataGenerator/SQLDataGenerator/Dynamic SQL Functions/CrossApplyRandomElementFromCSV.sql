CREATE FUNCTION [dbo].[CrossApplyRandomElementFromCSV]
(
	@CSV nvarchar(4000)
	,@alias sysname = 'c1'
	,@delimiter NVARCHAR(7) = 'default'
)
RETURNS NVARCHAR(4000)
AS
BEGIN
	RETURN CONCAT(
	'cross apply
	dbo.RandomElementFromCSV(''', @CSV,''',', @delimiter, ', nGUID) ', @alias)
END
