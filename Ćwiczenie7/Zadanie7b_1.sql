USE AdventureWorks2022;
GO

CREATE OR ALTER FUNCTION Fibonacci (@n INT)
RETURNS INT
AS
BEGIN
	DECLARE @a INT = 0; -- aktualna pozycja w ci¹gu
	DECLARE @n1 INT = 0; -- pierwszy element
	DECLARE @n2 INT = 1; -- drugi element

	IF @n = 0
		RETURN @n1;
	ELSE IF @n = 1
		RETURN @n2;
	ELSE
	BEGIN
		DECLARE @i INT = 2;
		WHILE @i <= @n
		BEGIN
			SET @a = @n1 + @n2;
			SET @n1 = @n2;
			SET @n2 = @a;
			SET @i = @i + 1;
		END
		RETURN @a;
	END
	RETURN 0;
END
GO

CREATE OR ALTER PROCEDURE ShowFibonacci
	@n INT
AS
BEGIN
	PRINT 'Ci¹g Fibonacciego dla ' + CAST(@n AS VARCHAR(5)) + ' elementów:';
	DECLARE @i INT = 0;
	WHILE @i < @n
	BEGIN
		PRINT CAST(dbo.Fibonacci(@i) AS VARCHAR(5)) + ' ';
		SET @i = @i + 1;
	END
END
GO

EXEC ShowFibonacci 9;