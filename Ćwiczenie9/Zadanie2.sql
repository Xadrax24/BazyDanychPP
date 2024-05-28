USE AdventureWorks2022
GO

BEGIN TRANSACTION
DELETE FROM Production.TransactionHistory
WHERE ProductID = 707;
DELETE FROM Sales.SalesOrderDetail
WHERE ProductID = 707;
DELETE FROM Sales.SpecialOfferProduct
WHERE ProductID = 707;
DELETE FROM Purchasing.PurchaseOrderDetail
WHERE ProductID = 707;
DELETE FROM Purchasing.ProductVendor
WHERE ProductID = 707;
DELETE FROM Production.ProductProductPhoto
WHERE ProductID = 707;
DELETE FROM Production.ProductListPriceHistory
WHERE ProductID = 707;
DELETE FROM Production.ProductInventory
WHERE ProductID = 707;
DELETE FROM Production.ProductCostHistory
WHERE ProductID = 707;

DELETE FROM Production.Product
WHERE ProductID = 707
ROLLBACK;

SELECT * FROM Production.Product
WHERE ProductID = 707;