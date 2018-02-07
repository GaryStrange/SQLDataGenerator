CREATE FUNCTION [dbo].[CSVToList]
(
	@CSV nvarchar(4000),
	@delimeter CHAR(1) = ','
)
RETURNS TABLE AS RETURN
(
	WITH SequenceForCSV(N) AS (
		SELECT N FROM dbo.VirtualSequence( ISNULL(LEN(@CSV),0) )
	),
	IndexOfElementStart(I) AS (
		SELECT 1 
		UNION ALL
		SELECT N + 1 FROM SequenceForCSV
		WHERE SUBSTRING(@CSV, N ,1) = @delimeter
	),
	IndexAndLength(Idx, elementLength) AS (
		SELECT
			I,
			ISNULL(NULLIF(CHARINDEX(@delimeter,@CSV,I),0)- I,8000)
			--MAX(I) OVER (ORDER BY I ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING)
		FROM IndexOfElementStart
	)
	SELECT 
		ROW_NUMBER() OVER (ORDER BY Idx) ElementId,
		SUBSTRING(@CSV, idx, elementLength) Element,
		idx--, elementLength
	FROM IndexAndLength
)
