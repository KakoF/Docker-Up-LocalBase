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
