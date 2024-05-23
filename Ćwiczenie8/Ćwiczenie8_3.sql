USE AdventureWorksLT2022
GO

WITH
Incomes AS
(SELECT
	pc.Name AS Category,
	FORMAT(SUM(sod.LineTotal), '0.00') AS SalesValue 
FROM SalesLT.ProductCategory pc
JOIN SalesLT.Product p ON pc.ProductCategoryID = p.ProductCategoryID
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY pc.Name
)
SELECT *
FROM Incomes
ORDER BY Category