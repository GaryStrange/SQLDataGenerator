CREATE PROCEDURE [dbo].[GenerateView]
	@viewName SYSNAME
	,@hasSequence BIT
	,@columns dbo.GeneratedColumns readonly
	,@nRows INT = 100
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql_statement NVARCHAR(4000)

	DECLARE @seed_statement NVARCHAR(4000) = 'N'
	SELECT @seed_statement += CONCAT( [\n], [Comma], c.SeedColumnName, ' = NEWID()' )
	FROM @columns c
	CROSS JOIN dbo.Punctuation

	PRINT @seed_statement

	DECLARE @from_statement NVARCHAR(4000) = CONCAT( dbo.BaseObject(@hasSequence), '(', @nRows, ')')
	DECLARE @cte_statement NVARCHAR(4000) = CONCAT('WITH baseData AS ( SELECT ', @seed_statement, ' FROM ', @from_statement, ')')

	DECLARE @column_statement NVARCHAR(4000) = '';
	SELECT @column_statement += CONCAT([\n],[\t], Comma, c.ColumnSetAlias, '.RandColumn AS ', c.ColumnName )
	FROM @columns c
	CROSS JOIN dbo.Punctuation

	

	DECLARE @join_statement NVARCHAR(4000) = '';
	SELECT @join_statement += [\n] + statement_fragment FROM [dbo].[CrossApplyMapper](@columns)
	CROSS JOIN dbo.Punctuation

	SELECT @sql_statement = CONCAT(
		@cte_statement
		,[\n], N'SELECT N,'
		,[\n], STUFF(@column_statement,1, LEN([\n] + [\t] + Comma), [\t])
		,[\n], N'FROM baseData'
		,[\n], @join_statement
		)
	FROM dbo.Punctuation
	
	--PRINT @sql_statement
	EXEC dbo.CreateView @viewName, @sql_statement
	
END
