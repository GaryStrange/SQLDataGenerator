CREATE FUNCTION [dbo].[RandomIndexFromCSV]
(
	@CSV nvarchar(4000),
	@delimeter CHAR(1) = ',',
	@Guid UniqueIdentifier
)
RETURNS TABLE AS RETURN
(
	SELECT n.RandColumn
	FROM dbo.CountDelimetersInCSV( @CSV, @delimeter ) c
	CROSS APPLY
	dbo.RandomNumberColumn( 1, c.DelimeterCount, @Guid ) n
)
