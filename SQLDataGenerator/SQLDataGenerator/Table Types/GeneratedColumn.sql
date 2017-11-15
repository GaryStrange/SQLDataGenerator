/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE TYPE [dbo].[GeneratedColumns] AS TABLE
(
	--Used as order column
	Id INT NOT NULL IDENTITY PRIMARY KEY, --NONCLUSTERED HASH WITH (BUCKET_COUNT=131072), 
	ColumnName SYSNAME NOT NULL UNIQUE,
	ColumnSetAlias AS 'c' + CAST(Id AS NVARCHAR(11)), --SYSNAME NOT NULL,
	GenerationMethod SYSNAME NOT NULL,
	ParameterData NVARCHAR(4000) NULL
) --WITH (MEMORY_OPTIMIZED = ON)