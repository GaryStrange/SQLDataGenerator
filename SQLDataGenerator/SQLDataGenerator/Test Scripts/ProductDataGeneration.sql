CREATE OR ALTER VIEW dbo.RMSProductTypes
AS
SELECT ElementId AS ValueId
		,Element AS [Value]
FROM dbo.CSVToList
(
	'T-shirts,Jeans,Shorts,Jackets & Coats'
	,DEFAULT
)
GO

SELECT *  FROM dbo.RMSProductTypes
GO
CREATE OR ALTER VIEW dbo.RMSShopByFitOrRange
AS
SELECT ElementId AS ValueId
		,Element AS [Value]
FROM dbo.CSVToList
(
	'Main Collection,Maternity,Tall,Curve'
	,DEFAULT
)
GO

SELECT *  FROM dbo.RMSShopByFitOrRange

declare @columns dbo.GeneratedColumns
select * from @columns
insert into @columns (columnName, GenerationMethod, ParameterData)
values 
	 ( 'retailGender', 'RandomElementFromCSV', '{"CSV":"Men,Women"}')
	 , ( 'productTypeId', 'RandomInt', '{"minInt":1,"maxInt":4}')
	 , ( 'rangeId', 'RandomInt', '{"minInt":1,"maxInt":5}')

exec dbo.GenerateView 'atttributeValues', 1, @columns, 10

select * from dbo.atttributeValues attv
inner join dbo.RMSProductTypes pt
on attv.productTypeId = pt.ValueId
inner join dbo.RMSShopByFitOrRange attributeValues
on attv.rangeId = attributeValues.ValueId;

with att as
(
	select * from dbo.atttributeValues attv
	inner join dbo.RMSProductTypes pt
	on attv.productTypeId = pt.ValueId
	union all
	 select * from dbo.atttributeValues attv
	inner join dbo.RMSShopByFitOrRange attributeValues2
	on attv.rangeId = attributeValues2.ValueId
)
--select * from dbo.atttributeValues attv
--inner join dbo.RMSProductTypes attributeValues
--on attv.productTypeId = attributeValues.ValueId
--inner join dbo.RMSShopByFitOrRange attributeValues2
--on attv.rangeId = attributeValues2.ValueId
select * from dbo.atttributeValues attv
inner join att on att.N = attv.N
--for json auto