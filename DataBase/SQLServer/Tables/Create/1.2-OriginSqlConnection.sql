GO

IF OBJECT_ID ( '[Origins].[OriginSqlConnection]' ) IS NULL BEGIN

CREATE TABLE [Origins].[OriginSqlConnection] (
		[Id] uniqueidentifier PRIMARY KEY default newid() NOT NULL,
		[OriginId] uniqueidentifier NOT NULL,
		[ServerName] nvarchar(500) NOT NULL,
	    [DatabaseName] nvarchar(500) NOT NULL,
	    [SchemaName] nvarchar(500) NOT NULL,
		[TableName] nvarchar(500) NOT NULL,
		CONSTRAINT FK_OriginSqlConnection_Origins FOREIGN KEY (OriginId)
        	REFERENCES Origins.Origins(Id)
	)
	PRINT 'Tabela [Origins].[OriginSqlConnection] criada'
END
ELSE
	PRINT 'A Tabela [Origins].[OriginSqlConnection] já existe'
