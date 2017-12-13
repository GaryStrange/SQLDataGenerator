declare @test dbo.GeneratedColumns
select * from @test
insert into @test (columnName, GenerationMethod, ParameterData)
values ( 'RandomNumber', 'RandomInt', '{"minInt":1,"maxInt":5}')
	 , ( 'RandomNumber', 'RandomInt', '{"minInt":1,"maxInt":5}')
exec dbo.[GenerateView] 1, @test, 50
