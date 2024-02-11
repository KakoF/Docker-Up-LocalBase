CREATE TABLE IF NOT EXISTS Origins.OriginSqlConnection
(
	Id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL UNIQUE,
	OriginId uuid NOT NULL,
	ServerName VARCHAR(500) NOT NULL,
	DatabaseName VARCHAR(500) NOT NULL,
	SchemaName VARCHAR(500) NOT NULL,
	TableName VARCHAR(500) NOT NULL,
	CONSTRAINT fk_origin
		FOREIGN KEY(OriginId) 
			REFERENCES Origins.Origins(Id)
);
