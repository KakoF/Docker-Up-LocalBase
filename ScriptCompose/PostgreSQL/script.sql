CREATE SCHEMA IF NOT EXISTS Origins;

CREATE TABLE IF NOT EXISTS Origins.Origins
(
	Id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL UNIQUE,
	Name VARCHAR(500) NOT NULL,
	Alias VARCHAR(200) NOT NULL UNIQUE,
	Type SMALLINT NOT NULL,
	SystemCreated BOOLEAN NOT NULL,
	CreationDate TIMESTAMP NOT NULL,
	LastUpdateDate TIMESTAMP NULL,
	LastUpdateUser VARCHAR(255) NULL,
	MajorVersion SMALLINT NOT NULL,
	MinorVersion SMALLINT NOT NULL,
	PathVersion SMALLINT NOT NULL,
	ChangeReason VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS Origins.OriginDimensions
(
	Id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL UNIQUE,
	OriginId uuid NOT NULL,
	Key VARCHAR(100) NOT NULL,
	Dimensions VARCHAR(100) NOT NULL,
	Hierarchy INT NOT NULL,
	CONSTRAINT fk_origin
		FOREIGN KEY(OriginId) 
			REFERENCES Origins.Origins(Id)
);

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

CREATE TABLE IF NOT EXISTS Origins.OriginTimeDimensions
(
	Id uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL UNIQUE,
	OriginId uuid NOT NULL,
	Dimension VARCHAR(100) NOT NULL,
	Granularity VARCHAR(30) NOT NULL,
	RepeatEvery INT NOT NULL,
	Hierarchy INT NOT NULL,
	CONSTRAINT fk_origin
		FOREIGN KEY(OriginId) 
			REFERENCES Origins.Origins(Id)
);

