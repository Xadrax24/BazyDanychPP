CREATE DATABASE firma; -- ZADANIE 1
GO

CREATE SCHEMA ksiegowosc; -- ZADANIE 2
GO

USE firma;
GO


CREATE TABLE ksiegowosc.pracownicy (  -- ZADANIE 4
id_pracownika INT not null primary key,
imie VARCHAR(30) not null,
nazwisko VARCHAR(50) not null,
adres VARCHAR(100),
telefon VARCHAR(15),
);
EXEC sys.sp_addextendedproperty 
    @name=N'Tabela z danymi zatrudnionych pracowników.';

CREATE TABLE ksiegowosc.godziny (
id_godziny INT not null primary key,
data DATE,
liczba_godzin INT,
id_pracownika INT foreign key references ksiegowosc.pracownicy(id_pracownika)
);

EXEC sys.sp_addextendedproperty 
    @name=N'Tabela z iloœci¹ wypracowanych godzin.';

CREATE TABLE ksiegowosc.pensje (
id_pensji INT primary key,
stanowisko VARCHAR(50),
kwota DECIMAL(10,2)
);

EXEC sys.sp_addextendedproperty 
    @name=N'Tabela z wartoœciami pensji pracowniczych.';

CREATE TABLE ksiegowosc.premie (
id_premii INT primary key,
rodzaj VARCHAR(30),
kwota DECIMAL(10,2)
);

EXEC sys.sp_addextendedproperty 
    @name=N'Tabela z wartoœciami premii.';

CREATE TABLE ksiegowosc.wynagrodzenie (
id_wynagrodzenia INT primary key,
data DATE,
id_pracownika INT foreign key references ksiegowosc.pracownicy(id_pracownika),
id_godziny INT foreign key references ksiegowosc.godziny(id_godziny),
id_pensji INT foreign key references ksiegowosc.pensje(id_pensji),
id_premii INT foreign key references ksiegowosc.premie(id_premii)
);
EXEC sys.sp_addextendedproperty 
    @name=N'Tabela podsumowuj¹ca ca³oœciowe wynagrodzenie pracowników.';

INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) -- ZADANIE 5
values 
(1, 'Andrzej', 'Suchoñski', 'ul. Wiejska 13 Warszawa', '882533440'),
(2, 'Wiktor', 'Marciniak', 'ul. D³uga 66 Kraków', '884766349'),
(3, 'Anna', 'Wiœniewska', 'ul. S¹siedzka 44 Gdañsk', '774892650'),
(4, 'Alicja', 'D¹browska', 'ul. Ogrodowa 7, Bia³ystok', '321654987'),
(5, 'Andrzej', 'Lis', 'ul. Polna 15, Gdañsk', '789123456'),
(6, 'Janusz', 'Wójcik', 'ul. Rycerska 20, £ódŸ', '654987321'),
(7, 'Krzysztof', 'Kaczmarek', 'ul. Miodowa 25, Szczecin', '852963741'),
(8, 'Magdalena', 'Zieliñska', 'ul. Ksi¹¿êca 30, Lublin', '369258147'),
(9, 'Marek', 'Szymañski', 'ul. D³uga 35, Katowice', '147852369'),
(10, 'Micha³', 'WoŸnicki', 'ul. Wroniecka 9, Poznañ', '258147369');

INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
values
(1, '2024-04-01', 8, 1),
(2, '2024-04-02', 9, 2),
(3, '2024-04-03', 6, 3),
(4, '2024-04-04', 8, 4),
(5, '2024-04-05', 7, 5),
(6, '2024-04-06', 8, 6),
(7, '2024-04-07', 6, 7),
(8, '2024-04-08', 8, 8),
(9, '2024-04-09', 10, 9),
(10, '2024-04-10', 8, 10);

INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
values
(1, 'Premia za wyniki', 500.00),
(2, 'Premia jubileuszowa', 1000.00),
(3, 'Premia œwi¹teczna', 200.00),
(4, 'Premia motywacyjna', 600.00),
(5, 'Premia za sta¿', 800.00),
(6, 'Premia uznaniowa', 0.00),
(7, 'Premia specjalna', 700.00),
(8, 'Premia nagrodowa', 900.00),
(9, 'Premia za efektywnoœæ', 750.00),
(10, 'Premia za innowacje', 0.00);

INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
values
(1, 'Kierownik', 4000.00),
(2, 'Specjalista', 3000.00),
(3, 'Pracownik fizyczny', 2500.00),
(4, 'Analityk', 3500.00),
(5, 'Doradca klienta', 2800.00),
(6, 'Technik', 2600.00),
(7, 'Sprzedawca', 2300.00),
(8, 'Ksiêgowy', 3200.00),
(9, 'In¿ynier', 3800.00),
(10, 'Administrator', 2700.00);

INSERT INTO ksiegowosc.wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
values
(1,'2024-04-01', 1, 1, 1, 6),
(2,'2024-04-02', 2, 2, 2, 10),
(3,'2024-04-03', 3, 3, 3, 4),
(4,'2024-04-04', 4, 4, 4, 3),
(5,'2024-04-05', 5, 5, 5, 2),
(6,'2024-04-06', 6, 6, 6, 1),
(7,'2024-04-07', 7, 7, 7, 10),
(8,'2024-04-08', 8, 8, 8, 9),
(9,'2024-04-09', 9, 9, 9, 8),
(10,'2024-04-10', 10, 10, 10, 7);



SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy; -- ZADANIE 6 a)


SELECT id_pracownika FROM ksiegowosc.pracownicy -- b)
JOIN ksiegowosc.pensje ON id_pracownika = id_pensji
WHERE kwota > 1000;


SELECT p.id_pracownika, imie FROM ksiegowosc.pracownicy p -- c)
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.premie m ON w.id_premii = m.id_premii
JOIN ksiegowosc.pensje n ON w.id_pensji = n.id_pensji
WHERE m.kwota = 0 AND n.kwota > 2000;


SELECT id_pracownika, imie, nazwisko -- d)
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';

SELECT id_pracownika, imie, nazwisko -- e)
FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';


	ALTER TABLE ksiegowosc.godziny 
	ADD liczba_nadgodzin INT;
	UPDATE ksiegowosc.godziny
	SET liczba_nadgodzin = CASE
		WHEN (liczba_godzin * 20) > 160 THEN (liczba_godzin * 20) - 160
		ELSE 0
	END;

SELECT imie, nazwisko, liczba_nadgodzin FROM ksiegowosc.pracownicy p -- f)
JOIN ksiegowosc.godziny g ON g.id_pracownika = p.id_pracownika
GROUP BY imie, nazwisko, liczba_nadgodzin;

SELECT imie, nazwisko, kwota FROM ksiegowosc.pracownicy -- g)
JOIN ksiegowosc.pensje ON id_pracownika = id_pensji
WHERE kwota > 1500 AND kwota < 3000
GROUP BY imie, nazwisko, kwota;

SELECT p.imie, p.nazwisko, g.liczba_nadgodzin, z.kwota FROM ksiegowosc.pracownicy p -- h)
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.premie z ON w.id_premii = z.id_premii
JOIN ksiegowosc.godziny g ON w.id_pracownika = g.id_pracownika
WHERE g.liczba_nadgodzin > 0 AND z.kwota = 0;


SELECT kwota, imie, nazwisko FROM ksiegowosc.pracownicy -- i)
JOIN ksiegowosc.pensje ON id_pracownika = id_pensji
GROUP BY kwota, imie, nazwisko;

SELECT imie, nazwisko, z.kwota AS pensja, x.kwota AS premia FROM ksiegowosc.pracownicy -- j)
JOIN ksiegowosc.pensje z ON id_pracownika = id_pensji
JOIN ksiegowosc.premie x ON id_pracownika = id_premii
GROUP BY imie, nazwisko, z.kwota, x.kwota
ORDER BY z.kwota DESC, x.kwota DESC;
