CREATE FUNCTION [dbo].[RandomDateTimeColumn]
(
	@startDate DATETIME,
	@endDate DATETIME,
	@Guid uniqueidentifier
)
RETURNS TABLE AS RETURN
(
	SELECT CAST(RandColumn AS datetime) RandColumn FROM dbo.RandomFloatColumn( CAST(@startDate AS INT), CAST(@endDate AS INT), @Guid)
)
