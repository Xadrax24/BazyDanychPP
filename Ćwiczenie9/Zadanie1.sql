USE AdventureWorks2022
GO

BEGIN TRANSACTION
UPDATE Production.Product SET StandardCost = StandardCost * 1.1
WHERE ProductID = 680
COMMIT;

SELECT StandardCost FROM Production.Product
WHERE ProductID = 680;