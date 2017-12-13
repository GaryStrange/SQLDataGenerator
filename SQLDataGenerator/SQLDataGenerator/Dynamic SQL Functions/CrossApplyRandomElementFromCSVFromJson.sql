CREATE FUNCTION [dbo].[CrossApplyRandomElementFromCSVFromJson]
(
	@parameterData NVARCHAR(4000)
	,@columnSetAlias SYSNAME
)
RETURNS NVARCHAR(4000)
AS BEGIN
	RETURN (
		SELECT [dbo].[CrossApplyRandomElementFromCSV]( CSV, @columnSetAlias, default)
		FROM openjson(@parameterData, N'$')
		WITH (  
					  CSV   NVARCHAR(4000) N'$.CSV'
				   )
		   )
END
