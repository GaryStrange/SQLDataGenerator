CREATE FUNCTION [dbo].[CountDelimetersInCSV]
(
	@CSV nvarchar(4000),
	@delimeter CHAR(1) = ','
)
RETURNS TABLE AS RETURN
(
	SELECT LEN(@CSV) - LEN(REPLACE(@CSV, @delimeter, '')) + 1 DelimeterCount
)