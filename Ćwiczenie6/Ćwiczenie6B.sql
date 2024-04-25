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
    @name=N'Tabela z danymi zatrudnionych pracownik�w.';

CREATE TABLE ksiegowosc.godziny (
id_godziny INT not null primary key,
data DATE,
liczba_godzin INT,
id_pracownika INT foreign key references ksiegowosc.pracownicy(id_pracownika)
);

EXEC sys.sp_addextendedproperty 
    @name=N'Tabela z ilo�ci� wypracowanych godzin.';

CREATE TABLE ksiegowosc.pensje (
id_pensji INT primary key,
stanowisko VARCHAR(50),
kwota DECIMAL(10,2)
);

EXEC sys.sp_addextendedproperty 
    @name=N'Tabela z warto�ciami pensji pracowniczych.';

CREATE TABLE ksiegowosc.premie (
id_premii INT primary key,
rodzaj VARCHAR(30),
kwota DECIMAL(10,2)
);

EXEC sys.sp_addextendedproperty 
    @name=N'Tabela z warto�ciami premii.';

CREATE TABLE ksiegowosc.wynagrodzenie (
id_wynagrodzenia INT primary key,
data DATE,
id_pracownika INT foreign key references ksiegowosc.pracownicy(id_pracownika),
id_godziny INT foreign key references ksiegowosc.godziny(id_godziny),
id_pensji INT foreign key references ksiegowosc.pensje(id_pensji),
id_premii INT foreign key references ksiegowosc.premie(id_premii)
);
EXEC sys.sp_addextendedproperty 
    @name=N'Tabela podsumowuj�ca ca�o�ciowe wynagrodzenie pracownik�w.';

INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) -- ZADANIE 5
values 
(1, 'Andrzej', 'Sucho�ski', 'ul. Wiejska 13 Warszawa', '882533440'),
(2, 'Wiktor', 'Marciniak', 'ul. D�uga 66 Krak�w', '884766349'),
(3, 'Anna', 'Wi�niewska', 'ul. S�siedzka 44 Gda�sk', '774892650'),
(4, 'Alicja', 'D�browska', 'ul. Ogrodowa 7, Bia�ystok', '321654987'),
(5, 'Andrzej', 'Lis', 'ul. Polna 15, Gda�sk', '789123456'),
(6, 'Janusz', 'W�jcik', 'ul. Rycerska 20, ��d�', '654987321'),
(7, 'Krzysztof', 'Kaczmarek', 'ul. Miodowa 25, Szczecin', '852963741'),
(8, 'Magdalena', 'Zieli�ska', 'ul. Ksi���ca 30, Lublin', '369258147'),
(9, 'Marek', 'Szyma�ski', 'ul. D�uga 35, Katowice', '147852369'),
(10, 'Micha�', 'Wo�nicki', 'ul. Wroniecka 9, Pozna�', '258147369');

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
(3, 'Premia �wi�teczna', 200.00),
(4, 'Premia motywacyjna', 600.00),
(5, 'Premia za sta�', 800.00),
(6, 'Premia uznaniowa', 0.00),
(7, 'Premia specjalna', 700.00),
(8, 'Premia nagrodowa', 900.00),
(9, 'Premia za efektywno��', 750.00),
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
(8, 'Ksi�gowy', 3200.00),
(9, 'In�ynier', 3800.00),
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

	ALTER TABLE ksiegowosc.godziny 
	ADD liczba_nadgodzin INT;
	UPDATE ksiegowosc.godziny
	SET liczba_nadgodzin = CASE
		WHEN (liczba_godzin * 20) > 160 THEN (liczba_godzin * 20) - 160
		ELSE 0
	END;

ALTER TABLE ksiegowosc.pracownicy -- a)
ADD telefon_kierunkowy VARCHAR(20)
UPDATE ksiegowosc.pracownicy
SET telefon_kierunkowy = CONCAT('(+48)', telefon);

ALTER TABLE ksiegowosc.pracownicy -- b)
ADD telefon_podzielony VARCHAR(23)
UPDATE ksiegowosc.pracownicy
SET telefon_podzielony = CONCAT(SUBSTRING(telefon, 1, 3), '-', SUBSTRING(telefon, 4, 3), '-', SUBSTRING(telefon, 7, 3))

SELECT id_pracownika, UPPER(imie) AS imie, UPPER(nazwisko) AS nazwisko, UPPER(adres) AS adres, telefon -- c)
FROM ksiegowosc.pracownicy
WHERE UPPER(nazwisko) = (
    SELECT TOP 1 UPPER(nazwisko)
    FROM ksiegowosc.pracownicy
    ORDER BY LEN(nazwisko) DESC
);

SELECT -- d)
HASHBYTES('MD5', nazwisko) AS nazwisko_md5,
HASHBYTES('MD5', imie) AS imie_md5,
HASHBYTES('MD5', CAST(s.kwota AS VARCHAR(100))) AS pensja_md5
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje s ON w.id_pensji = s.id_pensji;


SELECT p.id_pracownika, p.nazwisko, p.imie, s.kwota AS pensja, m.kwota AS premia -- e)
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.pensje s ON w.id_pensji = s.id_pensji
LEFT JOIN ksiegowosc.premie m ON w.id_premii = m.id_premii;


SELECT CONCAT('Pracownik ', p.imie, ' ', p.nazwisko, ', w dniu ', w.data,  -- f)
    ' otrzyma� pensj� ca�kowit� na kwot� ', s.kwota + m.kwota + (g.liczba_nadgodzin * 50), ' z�, gdzie ',
    'wynagrodzenie zasadnicze wynosi�o: ', s.kwota, ' z�, premia: ', m.kwota, 
    ' z�, nadgodziny: ', (g.liczba_nadgodzin * 50), ' z�') AS raport
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.pensje s ON w.id_pensji = s.id_pensji
LEFT JOIN ksiegowosc.premie m ON w.id_premii = m.id_premii
LEFT JOIN ksiegowosc.godziny g ON w.id_godziny = g.id_godziny;

