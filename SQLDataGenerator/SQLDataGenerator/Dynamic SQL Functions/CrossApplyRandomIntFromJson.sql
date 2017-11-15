CREATE FUNCTION [dbo].[CrossApplyRandomIntFromJson]
(
	@parameterData NVARCHAR(4000)
	,@columnSetAlias SYSNAME
)
RETURNS NVARCHAR(4000)
AS BEGIN
	RETURN (
		SELECT [dbo].[CrossApplyRandomInt](minInt, maxInt, @columnSetAlias)
		FROM openjson(@parameterData, N'$')
		WITH (  
					  minInt   INT N'$.minInt',   
					  maxInt   INT N'$.maxInt'
				   )
		   )
END
