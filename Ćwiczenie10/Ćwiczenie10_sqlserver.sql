CREATE DATABASE Geostratygrafia;
GO

USE Geostratygrafia;
GO

CREATE SCHEMA Geostrat;
GO


--Tworzenie tabeli znoramalizowanej

CREATE TABLE Geostrat.GeoEon (
id_eon INT NOT NULL PRIMARY KEY,
nazwa_eon VARCHAR(12)
);

CREATE TABLE Geostrat.GeoEra (
id_era INT NOT NULL PRIMARY KEY,
id_eon INT,
nazwa_era VARCHAR(12),
FOREIGN KEY (id_eon) REFERENCES Geostrat.GeoEon(id_eon)
);

CREATE TABLE Geostrat.GeoOkres (
id_okres INT NOT NULL PRIMARY KEY,
id_era INT,
nazwa_okres VARCHAR(12),
FOREIGN KEY (id_era) REFERENCES Geostrat.GeoEra(id_era)
);

CREATE TABLE Geostrat.GeoEpoka (
id_epoka INT NOT NULL PRIMARY KEY,
id_okres INT,
nazwa_epoka VARCHAR(12),
FOREIGN KEY (id_okres) REFERENCES Geostrat.GeoOkres(id_okres)
);

CREATE TABLE Geostrat.GeoPietro (
id_pietro INT NOT NULL PRIMARY KEY,
id_epoka INT,
nazwa_pietro VARCHAR(12),
FOREIGN KEY (id_epoka) REFERENCES Geostrat.GeoEpoka(id_epoka)
);


INSERT INTO Geostrat.GeoEon (id_eon, nazwa_eon)
VALUES 
    (1, 'Fanerozoik');

INSERT INTO Geostrat.GeoEra (id_era, id_eon, nazwa_era)
VALUES 
    (1, 1, 'Paleozoik'),
    (2, 1, 'Mezozoik'),
    (3, 1, 'Kenozik');

INSERT INTO Geostrat.GeoOkres (id_okres, id_era, nazwa_okres)
VALUES 
    (1, 1, 'Dewon'),
    (2, 1, 'Karbon'),
    (3, 1, 'Perm'),
	(4, 2, 'Trias'),
	(5, 2, 'Jura'),
	(6, 2, 'Kreda'),
	(7, 3, 'Paleogen'),
	(8, 3, 'Neogen'),
	(9, 3, 'Czwartorzêd');

INSERT INTO Geostrat.GeoEpoka (id_epoka, id_okres, nazwa_epoka)
VALUES 
    (1, 1, 'Dolny'),
    (2, 1, 'Œrodkowy'),
    (3, 1, 'Górny'),
	(4, 2, 'Dolny'),
	(5, 2, 'Górny'),
	(6, 3, 'Dolny'),
	(7, 3, 'Œrodkowy'),
	(8, 3, 'Górny'),
	(9, 4, 'Dolna'),
	(10, 4, 'Œrodkowa'),
	(11, 4, 'Górna'),
	(12, 5, 'Dolna'),
	(13, 5, 'Œrodkowa'),
	(14, 5, 'Górna'),
	(15, 6, 'Dolna'),
	(16, 6, 'Górna'),
	(17, 7, 'Paleocen'),
	(18, 7, 'Eocen'),
	(19, 7, 'Oligocen'),
	(20, 8, 'Miocen'),
	(21, 8, 'Pliocen'),
	(22, 9, 'Plejstocen'),
	(23, 9, 'Holocen');

	INSERT INTO Geostrat.GeoPietro (id_pietro, id_epoka, nazwa_pietro)
VALUES 
    (1, 1, 'Lochkow'),
    (2, 1, 'Prag'),
    (3, 1, 'Ems'),
	(4, 2, 'Eifel'),
	(5, 2, '¯ywet'),
	(6, 3, 'Fran'),
	(7, 3, 'Famen'),
	(8, 4, 'Turnej'),
	(9, 4, 'Wizen'),
	(10, 4, 'Serpuchow'),
	(11, 5, 'Baszkir'),
	(12, 5, 'Moskow'),
	(13, 5, 'Kasimow'),
	(14, 5, 'G¿el'),
	(15, 6, 'Assel'),
	(16, 6, 'Sakmar'),
	(17, 6, 'Artinsk'),
	(18, 6, 'Kungur'),
	(19, 7, 'Road'),
	(20, 7, 'Word'),
	(21, 7, 'Kapitan'),
	(22, 8, 'Wucziaping'),
	(23, 8, 'Czangsing'),
	(24, 9, 'Ind'),
	(25, 9, 'Olenek'),
	(26, 10, 'Anizyk'),
	(27, 10, 'Ladyn'),
	(28, 11, 'Karnik'),
	(29, 11, 'Noryk'),
	(30, 11, 'Retyk'),
	(31, 12, 'Hettang'),
	(32, 12, 'Synemur'),
	(33, 12, 'Pliensbach'),
	(34, 12, 'Toark'),
	(35, 13, 'Aalen'),
	(36, 13, 'Bajos'),
	(37, 13, 'Baton'),
	(38, 13, 'Kelowej'),
	(39, 14, 'Oksford'),
	(40, 14, 'Kimeryd'),
	(41, 14, 'Tyton'),
	(42, 15, 'Berrias'),
	(43, 15, 'Walan¿yn'),
	(44, 15, 'Hoteryw'),
	(45, 15, 'Barrem'),
	(46, 15, 'Apt'),
	(47, 15, 'Alb'),
	(48, 16, 'Cenoman'),
	(49, 16, 'Turon'),
	(50, 16, 'Koniak'),
	(51, 16, 'Santon'),
	(52, 16, 'Kampan'),
	(53, 16, 'Mastrycht'),
	(54, 17, 'Dan'),
	(55, 17, 'Zeland'),
	(56, 17, 'Tanet'),
	(57, 18, 'Iprez'),
	(58, 18, 'Lutet'),
	(59, 18, 'Barton'),
	(60, 18, 'Priabon'),
	(61, 19, 'Rupel'),
	(62, 19, 'Szat'),
	(63, 20, 'Akwitan'),
	(64, 20, 'Burdyga³'),
	(65, 20, 'Lang'),
	(66, 20, 'Serrwal'),
	(67, 20, 'Torton'),
	(68, 20, 'Messyn'),
	(69, 21, 'Zankl'),
	(70, 21, 'Piacent'),
	(71, 22, 'Gelas'),
	(72, 22, 'Kalabr'),
	(73, 22, 'Chiban'),
	(74, 22, 'PóŸny Chiban'),
	(75, 23, 'Grenland'),
	(76, 23, 'Northgrip'),
	(77, 23, 'Megalaj');

SELECT * FROM Geostrat.GeoPietro
--Tworzenie tabeli zdenormalizowanej

SELECT 
    GeoPietro.id_pietro,
	GeoPietro.nazwa_pietro,
    GeoEpoka.id_epoka,
	GeoEpoka.nazwa_epoka,
    GeoOkres.id_okres,
	GeoOkres.nazwa_okres,
    GeoEra.id_era,
	GeoEra.nazwa_era,
    GeoEon.id_eon,
	GeoEon.nazwa_eon
INTO Geostrat.GeoTabela
FROM 
    Geostrat.GeoPietro
JOIN Geostrat.GeoEpoka ON Geostrat.GeoPietro.id_epoka = Geostrat.GeoEpoka.id_epoka
JOIN Geostrat.GeoOkres ON Geostrat.GeoEpoka.id_okres = Geostrat.GeoOkres.id_okres
JOIN Geostrat.GeoEra ON Geostrat.GeoOkres.id_era = Geostrat.GeoEra.id_era
JOIN Geostrat.GeoEon ON Geostrat.GeoEra.id_eon = Geostrat.GeoEon.id_eon;

SELECT * FROM Geostrat.GeoTabela

CREATE TABLE Geostrat.Milion (
liczba int,
cyfra int,
bit int
);

CREATE TABLE Geostrat.Dziesiec (
cyfra INT,
bit INT
);

INSERT INTO Geostrat.Dziesiec (cyfra, bit)
VALUES 
    (0, 0),
    (1, 0),
    (2, 0),
    (3, 0),
    (4, 0),
    (5, 0),
    (6, 0),
    (7, 0),
    (8, 0),
    (9, 0);


INSERT INTO Geostrat.Milion 
SELECT 
a1.cyfra +10 * a2.cyfra +100 * a3.cyfra + 1000 * a4.cyfra + 10000 * a5.cyfra + 100000 * a6.cyfra AS liczba,
a1.cyfra AS cyfra,
a1.bit AS bit
FROM 
Geostrat.Dziesiec a1
CROSS JOIN Geostrat.Dziesiec a2
CROSS JOIN Geostrat.Dziesiec a3 
CROSS JOIN Geostrat.Dziesiec a4 
CROSS JOIN Geostrat.Dziesiec a5
CROSS JOIN Geostrat.Dziesiec a6;

-- 1 ZL
SET STATISTICS TIME ON;
SELECT COUNT(*) 
FROM Geostrat.Milion 
INNER JOIN Geostrat.GeoTabela ON (Geostrat.Milion.liczba % 77)+1 = Geostrat.GeoTabela.id_pietro;
SET STATISTICS TIME OFF;


-- 2 ZL
SET STATISTICS TIME ON;
SELECT COUNT(*)
FROM Geostrat.Milion
INNER JOIN Geostrat.GeoPietro ON (Geostrat.Milion.liczba % 77)+1 = Geostrat.GeoPietro.id_pietro
INNER JOIN Geostrat.GeoEpoka ON Geostrat.GeoPietro.id_epoka = Geostrat.GeoEpoka.id_epoka
INNER JOIN Geostrat.GeoOkres ON Geostrat.GeoEpoka.id_okres = Geostrat.GeoOkres.id_okres
INNER JOIN Geostrat.GeoEra ON Geostrat.GeoOkres.id_era = Geostrat.GeoEra.id_era
INNER JOIN Geostrat.GeoEon ON Geostrat.GeoEra.id_eon = Geostrat.GeoEon.id_eon;
SET STATISTICS TIME OFF;


-- 3 ZG
SET STATISTICS TIME ON;
SELECT COUNT(*) 
FROM Geostrat.Milion 
WHERE (Geostrat.Milion.liczba % 77)+1 = 
(SELECT id_pietro 
FROM Geostrat.GeoTabela
WHERE (Geostrat.Milion.liczba % 77)+1 = id_pietro
);
SET STATISTICS TIME OFF;


-- 4 ZG
SET STATISTICS TIME ON;
SELECT COUNT(*) 
FROM Geostrat.Milion 
WHERE (Geostrat.Milion.liczba % 77)+1 =
(
    SELECT Geostrat.GeoPietro.id_pietro 
    FROM Geostrat.GeoPietro 
    INNER JOIN Geostrat.GeoEpoka ON Geostrat.GeoPietro.id_epoka = Geostrat.GeoEpoka.id_epoka
    INNER JOIN Geostrat.GeoOkres ON Geostrat.GeoEpoka.id_okres = Geostrat.GeoOkres.id_okres
    INNER JOIN Geostrat.GeoEra ON Geostrat.GeoOkres.id_era = Geostrat.GeoEra.id_era
    INNER JOIN Geostrat.GeoEon ON Geostrat.GeoEra.id_eon = Geostrat.GeoEon.id_eon
	WHERE (Geostrat.Milion.liczba % 77)+1 = Geostrat.GeoPietro.id_pietro
);
SET STATISTICS TIME OFF;