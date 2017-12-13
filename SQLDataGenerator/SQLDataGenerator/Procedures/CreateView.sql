CREATE PROCEDURE [dbo].[CreateView]
	@view_name SYSNAME,
	@body NVARCHAR(MAX),
	@schema_name SYSNAME = 'dbo'
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql_statement NVARCHAR(4000) = N'CREATE {2}VIEW {0}.{1}';

	SET @sql_statement = REPLACE(@sql_statement, '{0}', @schema_name)
	SET @sql_statement = REPLACE(@sql_statement, '{1}', @view_name)

	--TODO: Check server edition
	SET @sql_statement = REPLACE(@sql_statement, '{2}', 'OR ALTER ')

	SELECT @sql_statement += [\n] + 'AS' + [\n] + @body
	FROM dbo.Punctuation

	PRINT @sql_statement
	EXEC( @sql_statement )
END
