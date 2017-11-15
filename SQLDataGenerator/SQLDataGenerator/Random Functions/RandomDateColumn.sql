CREATE FUNCTION [dbo].[RandomDateColumn]
(
	@startDate DATETIME,
	@endDate DATETIME,
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	SELECT CAST(RandColumn AS datetime) RandColumn FROM dbo.RandomNumberColumn( CAST(@startDate AS INT), CAST(@endDate AS INT), @Guid)
)
