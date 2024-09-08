USE wall_street_db;

-- Create Stored Procedure
DROP PROCEDURE IF EXISTS `get_company_by_employees`;
DELIMITER //
CREATE PROCEDURE `get_company_by_employees`(IN countofEmployees TINYINT)
BEGIN
	SELECT Company, Count(FirstName) AS NumofEmployees
	FROM Employee
	GROUP BY Company
	HAVING NumofEmployees > countofEmployees;
END//
DELIMITER ;

-- Call Stored Procedure
CALL get_company_by_employees(10);

-- Test Queries
SELECT FirstName, LastName, Industry 
FROM Employee
INNER JOIN CompanyIndustry ON Employee.Company = CompanyIndustry.Company;

SELECT FirstName, LastName, Position
FROM Employee
WHERE Company = 'DC Advisory'
ORDER BY FirstName, LastName;

SELECT City, Company, Count(FirstName)
FROM Employee
GROUP BY  City, Company
HAVING COUNT(FirstName) > 2;

-- Create View
CREATE VIEW has_specialty AS
	SELECT *
	FROM Employee
	WHERE Specialities != '';
    
-- Create Indexes
CREATE INDEX NameIndex ON Employee (FirstName, LastName);
CREATE INDEX SpecialtyIndex ON Employee (Specialities);
CREATE INDEX CityIndex ON Employee (City);

