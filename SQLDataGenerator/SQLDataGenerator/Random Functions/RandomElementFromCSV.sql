CREATE FUNCTION [dbo].[RandomElementFromCSV]
(
	@CSV nvarchar(4000),
	@delimeter CHAR(1) = ',',
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	SELECT i.RandColumn, e.ElementId, e.Element
	FROM dbo.RandomIndexFromCSV( @CSV, @delimeter, @Guid ) i
	cross apply
	dbo.CSVElementAt( @CSV, i.RandColumn, @delimeter ) e
)
