USE AdventureWorks2022
GO

WITH 
TempEmployeeInfo AS
(SELECT 
	pp.FirstName,
	pp.MiddleName,
	pp.LastName,
	hre.BirthDate,
	hre.JobTitle,
	hre.Gender,
	eph.BusinessEntityID AS ID,
	eph.Rate,
	eph.PayFrequency
	
FROM HumanResources.EmployeePayHistory eph
JOIN Person.Person pp ON eph.BusinessEntityID = pp.BusinessEntityID
JOIN HumanResources.Employee hre ON eph.BusinessEntityID = hre.BusinessEntityID
)
SELECT *
FROM TempEmployeeInfo
ORDER BY 
	LastName;