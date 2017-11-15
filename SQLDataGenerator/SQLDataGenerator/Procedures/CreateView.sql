CREATE PROCEDURE [dbo].[CreateView]
	@hasSequence BIT
	,@columns dbo.GeneratedColumns readonly
	,@nRows INT = 100
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql_statement NVARCHAR(4000)

	DECLARE @column_statement NVARCHAR(4000) = '';
	SELECT @column_statement += CONCAT([\n], Comma, ColumnSetAlias, '.RandColumn AS ', ColumnName )
	FROM @columns c
	CROSS JOIN dbo.Punctuation

	DECLARE @from_statement NVARCHAR(4000) = CONCAT( dbo.BaseObject(@hasSequence), '(', @nRows, ')')

	DECLARE @join_statement NVARCHAR(4000) = '';
	SELECT @join_statement += CONCAT([\n], CASE c.GenerationMethod
							WHEN 'RandomInt' THEN [dbo].[CrossApplyRandomIntFromJson](ParameterData, ColumnSetAlias)
							WHEN 0 THEN ''
						END )
	FROM @columns c
	CROSS JOIN dbo.Punctuation

	SELECT @sql_statement = CONCAT(
		N'SELECT'
		,[\n], STUFF(@column_statement,1, LEN([\n] + Comma),'')
		,[\n], N'FROM'
		,[\n], @from_statement
		,[\n], @join_statement
		)
	FROM dbo.Punctuation
	PRINT @sql_statement
	
	EXEC(@sql_statement);
END
