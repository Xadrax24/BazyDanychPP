USE AdventureWorksLT2022
GO

WITH
Revenues AS
(SELECT
	c.CompanyName + ' (' + c.FirstName + ' ' + c.LastName + ')' AS CompanyContract,
	SUM(h.TotalDue) AS Revenue
FROM SalesLT.Customer c 
JOIN SalesLT.SalesOrderHeader h ON c.CustomerID = h.CustomerID
GROUP BY 
        c.CompanyName, c.FirstName, c.LastName
)
SELECT *
FROM Revenues
ORDER BY Revenue DESC;