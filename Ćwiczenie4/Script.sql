create database firma;

create schema rozliczenia;

create table rozliczenia.pracownicy (
id_pracownika INT not null primary key,
imie VARCHAR(30) not null,
nazwisko VARCHAR(50) not null,
adres VARCHAR(100),
telefon VARCHAR(15)
);

create table rozliczenia.godziny (
id_godziny INT primary key,
data DATE,
liczba_godzin INT,
id_pracownika INT
);

create table rozliczenia.pensje (
id_pensji INT primary key,
stanowisko VARCHAR(50),
kwota DECIMAL(10,2),
id_premii INT
);

create table rozliczenia.premie (
id_premii INT primary key,
rodzaj VARCHAR(30),
kwota DECIMAL(10,2)
);

alter table rozliczenia.godziny
add constraint id_pracownika
foreign key (id_pracownika)
references rozliczenia.pracownicy(id_pracownika);

alter table rozliczenia.pensje
add constraint id_premii
foreign key (id_premii)
references rozliczenia.premie(id_premii);

insert into rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
values (1, 'Andrzej', 'Suchoński', 'ul. Wiejska 13 Warszawa', '882533440'),
(2, 'Wiktor', 'Marciniak', 'ul. Długa 66 Kraków', '884766349'),
(3, 'Anna', 'Wiśniewska', 'ul. Sąsiedzka 44 Gdańsk', '774892650'),
(4, 'Alicja', 'Dąbrowska', 'ul. Ogrodowa 7, Białystok', '321654987'),
(5, 'Andrzej', 'Lis', 'ul. Polna 15, Gdańsk', '789123456'),
(6, 'Barbara', 'Wójcik', 'ul. Rycerska 20, Łódź', '654987321'),
(7, 'Krzysztof', 'Kaczmarek', 'ul. Miodowa 25, Szczecin', '852963741'),
(8, 'Magdalena', 'Zielińska', 'ul. Książęca 30, Lublin', '369258147'),
(9, 'Marek', 'Szymański', 'ul. Długa 35, Katowice', '147852369'),
(10, 'Michał', 'Woźnicki', 'ul. Wroniecka 9, Poznań', '258147369');

insert into rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
values
(1, '2024-04-01', 8, 1),
(2, '2024-04-02', 7, 2),
(3, '2024-04-03', 6, 3),
(4, '2024-04-04', 8, 4),
(5, '2024-04-05', 7, 5),
(6, '2024-04-06', 8, 6),
(7, '2024-04-07', 6, 7),
(8, '2024-04-08', 8, 8),
(9, '2024-04-09', 7, 9),
(10, '2024-04-10', 8, 10);

insert into rozliczenia.premie (id_premii, rodzaj, kwota)
values
(1, 'Premia za wyniki', 500.00),
(2, 'Premia jubileuszowa', 1000.00),
(3, 'Premia świąteczna', 300.00),
(4, 'Premia motywacyjna', 600.00),
(5, 'Premia za staż', 800.00),
(6, 'Premia uznaniowa', 400.00),
(7, 'Premia specjalna', 700.00),
(8, 'Premia nagrodowa', 900.00),
(9, 'Premia za efektywność', 750.00),
(10, 'Premia za innowacje', 850.00);

insert into rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
values
(1, 'Kierownik', 4000.00, 1),
(2, 'Specjalista', 3000.00, 2),
(3, 'Pracownik fizyczny', 2500.00, 3),
(4, 'Analityk', 3500.00, 4),
(5, 'Doradca klienta', 2800.00, 5),
(6, 'Technik', 2600.00, 6),
(7, 'Sprzedawca', 2300.00, 7),
(8, 'Księgowy', 3200.00, 8),
(9, 'Inżynier', 3800.00, 9),
(10, 'Administrator', 2700.00, 10);

select nazwisko, adres from rozliczenia.pracownicy;

select data,
date_part('dow', data) as dzien_tygodnia,
date_part('month', data) as miesiac 
from rozliczenia.godziny;

alter table rozliczenia.pensje
rename column kwota to kwota_brutto;

alter table rozliczenia.pensje
add column kwota_netto DECIMAL(10,2);

update rozliczenia.pensje
set kwota_netto = kwota_brutto * 0.75;

select * from rozliczenia.pensje;
