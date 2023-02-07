-- Creating tables for Emissions
CREATE TABLE emissions (
     country VARCHAR(40) NOT NULL,
     alpha3 VARCHAR(3) NULL,
	 year_ INTEGER NULL,
	 total DECIMAL  NULL,
	 coal DECIMAL NULL,
	 oil DECIMAL NULL,
	 gas DECIMAL NULL,
	 cement DECIMAL NULL,
	 flaring DECIMAL NULL,
	 other DECIMAL NULL,
	 per_capita DECIMAL NULL,
     PRIMARY KEY (country, year_),
	 UNIQUE (country, year_)
);

CREATE TABLE percentages (
	country VARCHAR(40) NOT NULL,
	year_ INTEGER NULL,
	percentage_coal DECIMAL NULL,
	percentage_oil DECIMAL NULL,
	percentage_gas DECIMAL NULL,
	percentage_cement DECIMAL NULL,
	percentage_flaring DECIMAL NULL,
	percentage_other DECIMAL NULL,
FOREIGN KEY (country, year_) REFERENCES emissions (country, year_),
	PRIMARY KEY (country, year_),
	UNIQUE (country, year_)
);

CREATE TABLE joined (
	country VARCHAR(40) NOT NULL,
	alpha3 VARCHAR(3) NULL,
	year_ INTEGER NULL,
	total DECIMAL  NULL,
	coal DECIMAL NULL,
	oil DECIMAL NULL,
	gas DECIMAL NULL,
	cement DECIMAL NULL,
	flaring DECIMAL NULL,
	other DECIMAL NULL,
	per_capita DECIMAL NULL,
	percentage_coal DECIMAL NULL,
	percentage_oil DECIMAL NULL,
	percentage_gas DECIMAL NULL,
	percentage_cement DECIMAL NULL,
	percentage_flaring DECIMAL NULL,
	percentage_other DECIMAL NULL,
FOREIGN KEY (country, year_) REFERENCES emissions (country, year_),
	PRIMARY KEY (country, year_),
	UNIQUE (country, year_)
);
