CREATE FUNCTION [dbo].[CrossApplyMapper]
(
	@columns dbo.GeneratedColumns READONLY
)
RETURNS TABLE
AS
RETURN
	SELECT
			CONCAT(
				[\n], CASE c.GenerationMethod
							WHEN 'RandomInt' THEN [dbo].[CrossApplyRandomIntFromJson](ParameterData, ColumnSetAlias)
							WHEN 'RandomElementFromCSV' THEN [dbo].[CrossApplyRandomElementFromCSVFromJson](ParameterData, ColumnSetAlias)
							WHEN 0 THEN ''
						END
			) AS [statement_fragment]
	FROM @columns c
	CROSS JOIN dbo.Punctuation
