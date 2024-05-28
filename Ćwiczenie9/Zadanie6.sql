USE AdventureWorks2022
GO

BEGIN TRANSACTION
UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty * 1.05
IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
	ROLLBACK;
ELSE
	COMMIT;

SELECT * FROM Sales.SalesOrderDetail;