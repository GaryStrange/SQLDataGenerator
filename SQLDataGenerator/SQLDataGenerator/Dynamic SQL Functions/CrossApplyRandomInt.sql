CREATE FUNCTION [dbo].[CrossApplyRandomInt]
(
	@minInt INT = 1
	,@maxInt INT = 10
	,@alias sysname = 'c1'
)
RETURNS NVARCHAR(4000)
AS
BEGIN
	RETURN CONCAT('cross apply
	dbo.RandomNumberColumn(', @minInt, ',', @maxInt, ', NEWID()) ', @alias)
END
