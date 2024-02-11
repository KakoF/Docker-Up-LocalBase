GO
IF OBJECT_ID('[Origins].[Origins]') IS NULL
BEGIN

CREATE TABLE [Origins].[Origins] (
		[Id] uniqueidentifier PRIMARY KEY,
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

