CREATE FUNCTION [dbo].[CrossApplyRandomElementFromCSVFromJson]
(
	@parameterData NVARCHAR(4000)
	,@columnSetAlias SYSNAME
	,@seedColumnName SYSNAME
)
RETURNS NVARCHAR(4000)
AS BEGIN
	RETURN (
		SELECT [dbo].[CrossApplyRandomElementFromCSV]( CSV, @columnSetAlias, @seedColumnName, default)
		FROM openjson(@parameterData, N'$')
		WITH (  
					  CSV   NVARCHAR(4000) N'$.CSV'
				   )
		   )
END
