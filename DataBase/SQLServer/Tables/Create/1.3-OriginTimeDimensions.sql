GO
IF OBJECT_ID('[Origins].[OriginTimeDimensions]') IS NULL
BEGIN

CREATE TABLE [Origins].[OriginTimeDimensions] (
		[Id] uniqueidentifier PRIMARY KEY,
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

