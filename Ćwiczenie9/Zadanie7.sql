USE AdventureWorks2022
GO

BEGIN TRANSACTION
DECLARE @AVERAGE DECIMAL(6,2);
SELECT @AVERAGE = AVG(StandardCost) 
FROM Production.Product;


	--ALTER TABLE Production.WorkOrderRouting
    --DROP CONSTRAINT FK_WorkOrderRouting_WorkOrder_WorkOrderID;

    --ALTER TABLE Production.WorkOrder
    --DROP CONSTRAINT FK_WorkOrder_Product_ProductID;

	--ALTER TABLE Production.ProductListPriceHistory
    --DROP CONSTRAINT FK_ProductListPriceHistory_Product_ProductID;

	--ALTER TABLE Production.ProductInventory
    --DROP CONSTRAINT FK_ProductInventory_Product_ProductID;
	--ALTER TABLE Production.ProductReview
    --DROP CONSTRAINT FK_ProductReview_Product_ProductID;

	ALTER TABLE Production.ProductDocument
	DROP CONSTRAINT FK_ProductDocument_Product_ProductID

DELETE FROM Production.Product
WHERE StandardCost > @AVERAGE

IF @@ROWCOUNT > 10
BEGIN
	ROLLBACK;
END
ELSE
BEGIN
	COMMIT;
END