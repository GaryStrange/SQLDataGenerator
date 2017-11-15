CREATE FUNCTION [dbo].[BaseObject]
(
	@hasSequence bit = 0
)
RETURNS NVARCHAR(4000)
AS
BEGIN
	RETURN CASE @hasSequence
		WHEN 1 THEN 'dbo.VirtualSequence'
		WHEN 0 THEN 'dbo.VirtualNums'
	END
END
