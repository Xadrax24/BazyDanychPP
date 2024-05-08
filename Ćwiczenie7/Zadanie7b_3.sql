USE AdventureWorks2022
GO

CREATE OR ALTER TRIGGER taxRateMonitoring ON Sales.SalesTaxRate
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
		SELECT 1
		FROM inserted
        JOIN deleted ON inserted.TaxRate > deleted.TaxRate * 1.3
    )
    BEGIN
        PRINT N'Error - The change in TaxRate exceeds 30% limit.'
    END;
END;



UPDATE Sales.SalesTaxRate 
SET TaxRate = TaxRate*1.5
WHERE TaxRate = 7;