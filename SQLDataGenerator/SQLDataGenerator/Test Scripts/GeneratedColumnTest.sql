declare @columns dbo.GeneratedColumns
select * from @columns
insert into @columns (columnName, GenerationMethod, ParameterData)
values ( 'valueID', 'RandomInt', '{"minInt":1,"maxInt":2}')
	 , ( 'value', 'RandomElementFromCSV', '{"CSV":"T-shirts,Main Collection,"}')

exec dbo.GenerateView 'atttributeValues', 1, @columns, 2