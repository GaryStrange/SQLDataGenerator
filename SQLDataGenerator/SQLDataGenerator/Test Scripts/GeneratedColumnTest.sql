declare @columns dbo.GeneratedColumns
select * from @columns
insert into @columns (columnName, GenerationMethod, ParameterData)
values ( 'valueID', 'RandomInt', '{"minInt":1,"maxInt":5000}')
	 , ( 'value', 'RandomInt', '{"minInt":1,"maxInt":5}')

exec dbo.GenerateView 'atttributeValues', 1, @columns, 50