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
