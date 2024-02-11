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
