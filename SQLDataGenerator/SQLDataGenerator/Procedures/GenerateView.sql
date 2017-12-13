CREATE PROCEDURE [dbo].[GenerateView]
	@viewName SYSNAME
	,@hasSequence BIT
	,@columns dbo.GeneratedColumns readonly
	,@nRows INT = 100
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql_statement NVARCHAR(4000)

	DECLARE @from_statement NVARCHAR(4000) = CONCAT( dbo.BaseObject(@hasSequence), '(', @nRows, ')')
	DECLARE @cte_statement NVARCHAR(4000) = CONCAT('WITH baseData AS ( SELECT *, NEWID() nGUID FROM ', @from_statement, ')')

	DECLARE @column_statement NVARCHAR(4000) = '';
	SELECT @column_statement += CONCAT([\n],[\t], Comma, ColumnSetAlias, '.RandColumn AS ', ColumnName )
	FROM @columns c
	CROSS JOIN dbo.Punctuation

	

	DECLARE @join_statement NVARCHAR(4000) = '';
	SELECT @join_statement += statement_fragment FROM [dbo].[CrossApplyMapper](@columns)

	SELECT @sql_statement = CONCAT(
		@cte_statement
		,[\n], N'SELECT'
		,[\n], STUFF(@column_statement,1, LEN([\n] + [\t] + Comma), [\t])
		,[\n], N'FROM baseData'
		,[\n], @join_statement
		)
	FROM dbo.Punctuation
	
	--PRINT @sql_statement
	EXEC dbo.CreateView @viewName, @sql_statement
	
END
