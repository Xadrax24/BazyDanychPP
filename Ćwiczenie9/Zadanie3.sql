USE AdventureWorks2022
GO

BEGIN TRANSACTION
INSERT INTO Production.Product(Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, Size, SizeUnitMeasureCode, 
WeightUnitMeasureCode, Weight, DaysToManufacture, ProductLine, Class, Style, ProductSubcategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, rowguid, 
ModifiedDate) 
VALUES ('New Product', 'NP-001', 1, 1, 'Red', 100, 50, 20.00, 40.00, 'M', 'CM', 'LB', 2.5, 5, 'T', 'H', 'U', 1, 1, GETDATE(),NULL,NULL, NEWID(), GETDATE());
COMMIT;

SELECT * FROM Production.Product
WHERE  ProductID < 1100;