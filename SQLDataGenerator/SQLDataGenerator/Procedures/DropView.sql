CREATE PROCEDURE [dbo].[DropView]
	@view_name SYSNAME,
	@schema_name SYSNAME = 'dbo'
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql_statement NVARCHAR(4000) = N'DROP VIEW {2}{0}.{1}';

	SET @sql_statement = REPLACE(@sql_statement, '{0}', @schema_name)
	SET @sql_statement = REPLACE(@sql_statement, '{1}', @view_name)

	--TODO: Check server edition
	SET @sql_statement = REPLACE(@sql_statement, '{2}', 'IF EXISTS ')

	PRINT @sql_statement
	EXEC( @sql_statement )
END
