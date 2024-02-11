GO

IF NOT EXISTS (
    SELECT TOP 1 1
    FROM SYS.SCHEMAS
    WHERE
        Name = 'Origins'
) BEGIN EXEC ('CREATE SCHEMA Origins') PRINT 'Schema Origins criado' END ELSE PRINT 'O schema Origins ja existe' GO

GO

IF OBJECT_ID ('[Origins].[Origins]') IS NULL BEGIN

CREATE TABLE [Origins].[Origins] (
		[Id] uniqueidentifier PRIMARY KEY default newid() NOT NULL,
		[Name] nvarchar(500) NOT NULL,
		[Alias] nvarchar(200) NULL,
	    [Type] SMALLINT NOT NULL,
	    [SystemCreated] BIT NOT NULL,
		[CreationDate] datetime NOT NULL,
		[LastUpdateDate] datetime NULL,
		[LastUpdateUser] nvarchar(255) NULL,
		[MajorVersion] SMALLINT NOT NULL,
		[MinorVersion] SMALLINT NOT NULL,
		[PathVersion] SMALLINT NOT NULL,
		[ChangeReason] nvarchar(MAX) NOT NULL
	)
	PRINT 'Tabela [Origins].[Origins] criada'
END
ELSE
	PRINT 'A Tabela [Origins].[Origins] já existe'


GO

IF OBJECT_ID ( '[Origins].[OriginDimensions]' ) IS NULL BEGIN

CREATE TABLE [Origins].[OriginDimensions] (
		[Id] uniqueidentifier PRIMARY KEY default newid() NOT NULL,
		[OriginId] uniqueidentifier NOT NULL,
		[Key] nvarchar(100) NOT NULL,
	    [Dimensions] nvarchar(100) NOT NULL,
	    [Hierarchy] INT NOT NULL,
		CONSTRAINT FK_OriginDimensions_Origins FOREIGN KEY (OriginId)
        	REFERENCES Origins.Origins(Id)
	)
	PRINT 'Tabela [Origins].[OriginDimensions] criada'
END
ELSE
	PRINT 'A Tabela [Origins].[OriginDimensions] já existe'


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


GO

IF OBJECT_ID ( '[Origins].[OriginTimeDimensions]' ) IS NULL BEGIN

CREATE TABLE [Origins].[OriginTimeDimensions] (
		[Id] uniqueidentifier PRIMARY KEY default newid() NOT NULL,
		[OriginId] uniqueidentifier NOT NULL,
		[Dimension] nvarchar(100) NOT NULL,
	    [Granularity] nvarchar(30) NOT NULL,
	    [RepeatEvery] INT NOT NULL,
	    [Hierarchy] INT NOT NULL,
		CONSTRAINT FK_OriginTimeDimensions_Origins FOREIGN KEY (OriginId)
        	REFERENCES Origins.Origins(Id)
	)
	PRINT 'Tabela [Origins].[OriginTimeDimensions] criada'
END
ELSE
	PRINT 'A Tabela [Origins].[OriginTimeDimensions] já existe'
