CREATE FUNCTION [dbo].[RandomNormalDistFloatColumn]
(
	@Mean FLOAT,
	@StandardDeviation FLOAT,
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	WITH RandValue AS
	(
			SELECT CAST(ABS(CHECKSUM(@Guid)) AS FLOAT) / (SELECT CAST(MaxInt AS FLOAT)) Rnd
			FROM IntConst()
	)
	SELECT RandomColumn = @Mean + @StandardDeviation * SQRT(-2.0 * LOG(Rnd))
      * SIN(2.0 * (22 / 7) * Rnd)
	FROM RandValue
	--SELECT RandomColumn = (Rnd * 2 -1) * 3 * @StandardDeviation + @Mean
	--FROM RandValue

)
--RETURNS TABLE AS RETURN
--(
--((RAND() * 2 - 1) + (RAND() * 2 - 1) + (RAND() * 2 - 1))
--           * @StandardDeviation + @Mean,
--)


--CREATE FUNCTION [dbo].[RandomFloatColumn]
--(
--	@MinNumber INT = 1,
--	@MaxNumber INT = 10,
--	@Guid uniqueidentifier
--)

