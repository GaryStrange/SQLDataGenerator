CREATE FUNCTION [dbo].[CrossApplyMapper]
(
	@columns dbo.GeneratedColumns READONLY
)
RETURNS NVARCHAR(4000)
BEGIN
	RETURN (
		SELECT
			CONCAT(
				[\n], CASE c.GenerationMethod
							WHEN 'RandomInt' THEN [dbo].[CrossApplyRandomIntFromJson](ParameterData, ColumnSetAlias)
							WHEN 0 THEN ''
						END
			)
	FROM @columns c
	CROSS JOIN dbo.Punctuation
	)
END
