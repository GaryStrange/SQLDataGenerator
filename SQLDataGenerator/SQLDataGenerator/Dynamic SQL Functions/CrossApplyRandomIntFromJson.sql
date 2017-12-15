CREATE FUNCTION [dbo].[CrossApplyRandomIntFromJson]
(
	@parameterData NVARCHAR(4000)
	,@columnSetAlias SYSNAME
	,@seedColumnName SYSNAME
)
RETURNS NVARCHAR(4000)
AS BEGIN
	RETURN (
		SELECT [dbo].[CrossApplyRandomInt](minInt, maxInt, @columnSetAlias, @seedColumnName)
		FROM openjson(@parameterData, N'$')
		WITH (  
					  minInt   INT N'$.minInt',   
					  maxInt   INT N'$.maxInt'
				   )
		   )
END
