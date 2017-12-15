CREATE VIEW [dbo].[Punctuation]
	AS 
	
	SELECT
		',' Comma
		,'''' Quote
		
		,CHAR(13) [\n]
		,CHAR(9) [\t]
