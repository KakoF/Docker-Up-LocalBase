GO
IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.SCHEMAS WHERE Name = 'Origins')
BEGIN
	EXEC ('CREATE SCHEMA Origins')
	PRINT 'Schema Origins criado'
END
ELSE
	PRINT 'O schema Origins ja existe'
GO