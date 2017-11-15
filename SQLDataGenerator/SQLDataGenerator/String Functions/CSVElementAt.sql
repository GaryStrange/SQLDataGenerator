CREATE FUNCTION [dbo].[CSVElementAt]
(
	@CSV nvarchar(4000),
	@Id int,
	@delimeter CHAR(1) = ','
)
RETURNS TABLE AS RETURN
(
	SELECT *
	FROM dbo.CSVToList( @CSV, @delimeter )
	WHERE ElementId = @Id
)