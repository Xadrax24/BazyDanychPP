
CREATE DATABASE geostratygrafia;

CREATE SCHEMA geostrat;


CREATE TABLE geostrat.geoeon (
    id_eon SERIAL PRIMARY KEY,
    nazwa_eon VARCHAR(12)
);


CREATE TABLE geostrat.geoera (
    id_era SERIAL PRIMARY KEY,
    id_eon INT REFERENCES geostrat.geoeon(id_eon),
    nazwa_era VARCHAR(12)
);



CREATE TABLE geostrat.geookres (
    id_okres SERIAL PRIMARY KEY,
    id_era INT REFERENCES geostrat.geoera(id_era),
    nazwa_okres VARCHAR(12)
);


CREATE TABLE geostrat.geoepoka (
    id_epoka SERIAL PRIMARY KEY,
    id_okres INT REFERENCES geostrat.geookres(id_okres),
    nazwa_epoka VARCHAR(12)
);


CREATE TABLE geostrat.geopietro (
    id_pietro SERIAL PRIMARY KEY,
    id_epoka INT REFERENCES geostrat.geoepoka(id_epoka),
    nazwa_pietro VARCHAR(12)
);

INSERT INTO geostrat.geoeon (nazwa_eon) VALUES ('Fanerozoik');

INSERT INTO geostrat.geoera (id_eon, nazwa_era) VALUES
    (1, 'Paleozoik'),
    (1, 'Mezozoik'),
    (1, 'Kenozik');

INSERT INTO geostrat.geookres (id_era, nazwa_okres) VALUES
    (1, 'Dewon'),
    (1, 'Karbon'),
    (1, 'Perm'),
    (2, 'Trias'),
    (2, 'Jura'),
    (2, 'Kreda'),
    (3, 'Paleogen'),
    (3, 'Neogen'),
    (3, 'Czwartorzęd');

INSERT INTO geostrat.geoepoka (id_okres, nazwa_epoka) VALUES
    (1, 'Dolny'),
    (1, 'Środkowy'),
    (1, 'Górny'),
    (2, 'Dolny'),
    (2, 'Górny'),
    (3, 'Dolny'),
    (3, 'Środkowy'),
    (3, 'Górny'),
    (4, 'Dolna'),
    (4, 'Środkowa'),
    (4, 'Górna'),
    (5, 'Dolna'),
    (5, 'Środkowa'),
    (5, 'Górna'),
    (6, 'Dolna'),
    (6, 'Górna'),
    (7, 'Paleocen'),
    (7, 'Eocen'),
    (7, 'Oligocen'),
    (8, 'Miocen'),
    (8, 'Pliocen'),
    (9, 'Plejstocen'),
    (9, 'Holocen');

INSERT INTO geostrat.geopietro (id_epoka, nazwa_pietro) VALUES
    (1, 'Lochkow'),
    (1, 'Prag'),
    (1, 'Ems'),
    (2, 'Eifel'),
    (2, 'Żywet'),
    (3, 'Fran'),
    (3, 'Famen'),
    (4, 'Turnej'),
    (4, 'Wizen'),
    (4, 'Serpuchow'),
    (5, 'Baszkir'),
    (5, 'Moskow'),
    (5, 'Kasimow'),
    (5, 'Gżel'),
    (6, 'Assel'),
    (6, 'Sakmar'),
    (6, 'Artinsk'),
    (6, 'Kungur'),
    (7, 'Road'),
    (7, 'Word'),
    (7, 'Kapitan'),
    (8, 'Wucziaping'),
    (8, 'Czangsing'),
    (9, 'Ind'),
    (9, 'Olenek'),
    (10, 'Anizyk'),
    (10, 'Ladyn'),
    (11, 'Karnik'),
    (11, 'Noryk'),
    (11, 'Retyk'),
    (12, 'Hettang'),
    (12, 'Synemur'),
    (12, 'Pliensbach'),
    (12, 'Toark'),
    (13, 'Aalen'),
    (13, 'Bajos'),
    (13, 'Baton'),
    (13, 'Kelowej'),
    (14, 'Oksford'),
    (14, 'Kimeryd'),
    (14, 'Tyton'),
    (15, 'Berrias'),
    (15, 'Walanżyn'),
    (15, 'Hoteryw'),
    (15, 'Barrem'),
    (15, 'Apt'),
    (15, 'Alb'),
    (16, 'Cenoman'),
    (16, 'Turon'),
    (16, 'Koniak'),
    (16, 'Santon'),
    (16, 'Kampan'),
    (16, 'Mastrycht'),
    (17, 'Dan'),
    (17, 'Zeland'),
    (17, 'Tanet'),
    (18, 'Iprez'),
    (18, 'Lutet'),
    (18, 'Barton'),
    (18, 'Priabon'),
    (19, 'Rupel'),
    (19, 'Szat'),
    (20, 'Akwitan'),
    (20, 'Burdygał'),
    (20, 'Lang'),
    (20, 'Serrwal'),
    (20, 'Torton'),
    (20, 'Messyn'),
    (21, 'Zankl'),
    (21, 'Piacent'),
    (22, 'Gelas'),
    (22, 'Kalabr'),
    (22, 'Chiban'),
    (22, 'Późny Chiban'),
    (23, 'Grenland'),
    (23, 'Northgrip'),
    (23, 'Megalaj');


SELECT 
    geopietro.id_pietro,
    geopietro.nazwa_pietro,
    geoepoka.id_epoka,
    geoepoka.nazwa_epoka,
    geookres.id_okres,
    geookres.nazwa_okres,
    geoera.id_era,
    geoera.nazwa_era,
    geoeon.id_eon,
    geoeon.nazwa_eon
INTO geostrat.geotabela
FROM 
    geostrat.geopietro
JOIN geostrat.geoepoka ON geopietro.id_epoka = geoepoka.id_epoka
JOIN geostrat.geookres ON geoepoka.id_okres = geookres.id_okres
JOIN geostrat.geoera ON geookres.id_era = geoera.id_era
JOIN geostrat.geoeon ON geoera.id_eon = geoeon.id_eon;


CREATE TABLE geostrat.milion (
    liczba INT,
    cyfra INT,
    bit INT
);

CREATE TABLE geostrat.dziesiec (
    cyfra INT,
    bit INT
);


INSERT INTO geostrat.dziesiec (cyfra, bit) VALUES 
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


INSERT INTO geostrat.milion 
SELECT 
    a1.cyfra + 10 * a2.cyfra + 100 * a3.cyfra + 1000 * a4.cyfra + 10000 * a5.cyfra + 100000 * a6.cyfra AS liczba,
    a1.cyfra AS cyfra,
    a1.bit AS bit
FROM 
    geostrat.dziesiec a1,
    geostrat.dziesiec a2,
    geostrat.dziesiec a3,
    geostrat.dziesiec a4,
    geostrat.dziesiec a5,
    geostrat.dziesiec a6;

-- 1 ZL
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT COUNT(*) 
FROM geostrat.milion 
INNER JOIN geostrat.geotabela ON (geostrat.milion.liczba % 77) + 1 = geostrat.geotabela.id_pietro;
SET enable_seqscan TO ON;

-- 2 ZL
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT COUNT(*)
FROM geostrat.milion
INNER JOIN geostrat.geopietro ON (geostrat.milion.liczba % 77) + 1 = geostrat.geopietro.id_pietro
INNER JOIN geostrat.geoepoka ON geopietro.id_epoka = geoepoka.id_epoka
INNER JOIN geostrat.geookres ON geoepoka.id_okres = geookres.id_okres
INNER JOIN geostrat.geoera ON geookres.id_era = geoera.id_era
INNER JOIN geostrat.geoeon ON geoera.id_eon = geoeon.id_eon;
SET enable_seqscan TO ON;

-- 3 ZG
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT COUNT(*) 
FROM geostrat.milion 
WHERE (geostrat.milion.liczba % 77) + 1 = 
(SELECT id_pietro 
 FROM geostrat.geotabela
 WHERE (geostrat.milion.liczba % 77) + 1 = id_pietro
);
SET enable_seqscan TO ON;

-- 4 ZG
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT COUNT(*) 
FROM geostrat.milion 
WHERE (geostrat.milion.liczba % 77) + 1 =
(
    SELECT geopietro.id_pietro 
    FROM geostrat.geopietro 
    INNER JOIN geostrat.geoepoka ON geopietro.id_epoka = geoepoka.id_epoka
    INNER JOIN geostrat.geookres ON geoepoka.id_okres = geookres.id_okres
    INNER JOIN geostrat.geoera ON geookres.id_era = geoera.id_era
    INNER JOIN geostrat.geoeon ON geoera.id_eon = geoeon.id_eon
    WHERE (geostrat.milion.liczba % 77) + 1 = geopietro.id_pietro
);
SET enable_seqscan TO ON;
