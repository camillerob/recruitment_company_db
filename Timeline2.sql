SET GLOBAL local_infile=1;

DROP DATABASE IF EXISTS wall_street_db;
CREATE DATABASE wall_street_db;
USE wall_street_db;

CREATE TABLE CompanyIndustry (
	Company varchar(100) PRIMARY KEY,
	Industry varchar(50) NOT NULL
) DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;

CREATE TABLE Employee (
	LinkedIn varchar(255) PRIMARY KEY,
	Company varchar(100) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Position varchar(50) NOT NULL,
	Specialities varchar(50),
	City varchar(50) NOT NULL,
	State char(2) NOT NULL,
	FOREIGN KEY (Company) REFERENCES CompanyIndustry(Company)
) DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;

SET SQL_SAFE_UPDATES = 0;
SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA LOCAL INFILE "/Users/camille/Desktop/ITCS 3160/Team_10.txt"
IGNORE
INTO TABLE `CompanyIndustry`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@a, @b, @c, `Company`, @d, `Industry`, @e, @f, @g);

LOAD DATA LOCAL INFILE "/Users/camille/Desktop/ITCS 3160/Team_10.txt"
IGNORE
INTO TABLE `Employee`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(`FirstName`, `LastName`, `Position`, `Company`, `Specialities`, @a, `City`, `State`, `LinkedIn`);
