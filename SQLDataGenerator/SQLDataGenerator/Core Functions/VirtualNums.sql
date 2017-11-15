CREATE FUNCTION [dbo].[VirtualNums]
(
	@nRows INT = 1000000
)
RETURNS TABLE AS RETURN
(
	WITH E1(N) AS (
                 SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL
                 SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL
                 SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
                ),                          --10E+1 or 10 rows
       E2(N) AS (SELECT 1 FROM E1 a, E1 b), --10E+2 or 100 rows
       E3(N) AS (SELECT 1 FROM E1 a, E2 b), --10E+3 or 1,000 rows max
	   E6(N) AS (SELECT 1 FROM E3 a, E3 b)  --10E+6 or 1,000,000 rows max
	
	SELECT TOP(@nRows) N
	FROM E6
)
