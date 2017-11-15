CREATE VIEW [dbo].[Punctuation]
	AS 
	
	SELECT
		',' Comma
		,CHAR(10) + CHAR(13) [\n]
