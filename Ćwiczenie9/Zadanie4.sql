USE AdventureWorks2022
GO

BEGIN TRANSACTION
UPDATE Production.Product SET StandardCost = StandardCost * 1.1
    IF ((SELECT SUM(StandardCost) FROM Production.Product) < 50000)
        COMMIT;
    ELSE
        ROLLBACK;
SELECT * FROM Production.Product