MERGE INTO dbo.GenerationMethods target
USING (
	VALUES ( 'Sequence', 'Sequence' )
			,('RandomInt', 'RandomInt' )
) source( MethodId, MethodName )
ON target.MethodId = source.MethodId
WHEN MATCHED THEN
	UPDATE SET MethodName = source.MethodName
WHEN NOT MATCHED THEN
	INSERT VALUES ( source.MethodId, source.MethodName )
	;