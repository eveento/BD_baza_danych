INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('1', 'przystawka');
INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('2', 'zupa');
INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('3', 'danie główne');
INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('4', 'dodatek');
INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('5', 'deser');
INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('6', 'napój zimny');
INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('7', 'napój ciepły');
INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('8', 'alkohol');
INSERT INTO `restauracja`.`typy dan` (`ID_Typu_dania`, `Nazwa_typu_dania`) VALUES ('9', 'przyprawa');


INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('1');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('2');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('3');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('4');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('5');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('6');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('7');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('8');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('9');
INSERT INTO `restauracja`.`klienci` (`ID_klienta`) VALUES ('10');

INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('101', 'Ozajasz', 'Oldberg', 'Kierownik', '2017-06-03');
INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('102', 'Azajasz', 'Aldberg', 'Kierownik', '2017-06-03');
INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('201', 'Michau', 'Miau', 'Obsługa', '2017-06-03');
INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('202', 'Kichau', 'Kiau', 'Obsługa', '2017-06-03');
INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('203', 'Bichau', 'Biau', 'Obsługa', '2017-06-03');
INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('204', 'Pichau', 'Piau', 'Obsługa', '2017-06-03');
INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('301', 'Dindu', 'Duff', 'Cieć', '2017-06-03');
INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('302', 'Bindu', 'Buff', 'Cieć', '2017-06-03');
INSERT INTO `restauracja`.`pracownicy` (`ID_pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Zatrudniono`) VALUES ('303', 'Kindu', 'Kuff', 'Cieć', '2017-06-03');


INSERT INTO `restauracja`.`dania` (`ID_dania`, `Typy dan_ID_Typu_dania`, `Ilosc_kalorii`, `Cena`, `Czas_oczekiwania`, `Nazwa_dania`) VALUES ('201', '2', '201', '1', '1', 'rosół');
INSERT INTO `restauracja`.`dania` (`ID_dania`, `Typy dan_ID_Typu_dania`, `Ilosc_kalorii`, `Cena`, `Czas_oczekiwania`, `Nazwa_dania`) VALUES ('202', '2', '202', '2', '2', 'pomidorowa');
INSERT INTO `restauracja`.`dania` (`ID_dania`, `Typy dan_ID_Typu_dania`, `Ilosc_kalorii`, `Cena`, `Czas_oczekiwania`, `Nazwa_dania`) VALUES ('203', '2', '200', '3', '3', 'ogórkowa');
INSERT INTO `restauracja`.`dania` (`ID_dania`, `Typy dan_ID_Typu_dania`, `Ilosc_kalorii`, `Cena`, `Czas_oczekiwania`, `Nazwa_dania`) VALUES ('204', '2', '203', '1', '1', 'grochowa');
INSERT INTO `restauracja`.`dania` (`ID_dania`, `Typy dan_ID_Typu_dania`, `Ilosc_kalorii`, `Cena`, `Czas_oczekiwania`, `Nazwa_dania`) VALUES ('205', '2', '204', '2', '2', 'flaki');
