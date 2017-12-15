CREATE FUNCTION [dbo].[CrossApplyMapper]
(
	@columns dbo.GeneratedColumns READONLY
)
RETURNS TABLE
AS
RETURN
	SELECT
		[statement_fragment] =			
			CASE c.GenerationMethod
				WHEN 'RandomInt' 
				THEN [dbo].[CrossApplyRandomIntFromJson](c.ParameterData, c.ColumnSetAlias, c.SeedColumnName)
				WHEN 'RandomElementFromCSV' 
				THEN [dbo].[CrossApplyRandomElementFromCSVFromJson](ParameterData, c.ColumnSetAlias, c.SeedColumnName)
				WHEN 0 THEN ''
			END
	FROM @columns c
