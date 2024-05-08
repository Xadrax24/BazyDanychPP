USE AdventureWorks2022
GO

CREATE OR ALTER TRIGGER LASTNAME ON Person.Person
AFTER INSERT
AS
BEGIN
	UPDATE Person.Person
	SET LastName = UPPER(LastName) FROM Person.Person;
END;

INSERT INTO Person.Person (FirstName, LastName, BusinessEntityID, PersonType)
VALUES ('Michael', 'Woznicki', 306, 'EM');

SELECT * FROM Person.Person;