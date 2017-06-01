-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema restauracja
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restauracja
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restauracja` DEFAULT CHARACTER SET utf8 ;
USE `restauracja` ;

-- -----------------------------------------------------
-- Table `restauracja`.`Pracownik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Pracownik` (
  `ID_pracownika` INT NOT NULL,
  `Imie` VARCHAR(45) NULL,
  `Nazwisko` VARCHAR(45) NULL,
  `Stanowisko` VARCHAR(45) NULL,
  `Miejscowosc` VARCHAR(45) NULL,
  `Nr_telefonu` INT NULL,
  `Zatrudniono` DATE NULL,
  PRIMARY KEY (`ID_pracownika`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Klient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Klient` (
  `ID_klienta` INT NOT NULL,
  PRIMARY KEY (`ID_klienta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Historia zamowienia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Historia zamowienia` (
  `ID_zamowienia` INT NOT NULL,
  `Pracownik_ID_pracownika` INT NOT NULL,
  `Zlozono` DATETIME(0) NULL,
  `Wydano` DATETIME(0) NULL,
  `Czy_reklamacja` TINYINT NULL,
  `Razem` FLOAT NULL,
  `Klient_ID_Klienta` INT NOT NULL,
  `Szczegoly zamowienia_ID_Szczegoly zamowienia` INT NOT NULL,
  PRIMARY KEY (`ID_zamowienia`, `Pracownik_ID_pracownika`, `Klient_ID_Klienta`, `Szczegoly zamowienia_ID_Szczegoly zamowienia`),
  INDEX `fk_Historia zamowienia_Pracownik1_idx` (`Pracownik_ID_pracownika` ASC),
  INDEX `fk_Historia zamowienia_Klient1_idx` (`Klient_ID_Klienta` ASC),
  CONSTRAINT `fk_Historia zamowienia_Pracownik1`
    FOREIGN KEY (`Pracownik_ID_pracownika`)
    REFERENCES `restauracja`.`Pracownik` (`ID_pracownika`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historia zamowienia_Klient1`
    FOREIGN KEY (`Klient_ID_Klienta`)
    REFERENCES `restauracja`.`Klient` (`ID_klienta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Rachunek`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Rachunek` (
  `ID_rachunku` INT NOT NULL,
  `Historia zamowienia_ID_zamowienia` INT NOT NULL,
  `Historia zamowienia_Klient_Numer_klienta` INT NOT NULL,
  `Cena` INT NULL,
  `Wystawiono` DATETIME(0) NULL,
  `Znizka` FLOAT NULL,
  `Sposob_zaplaty` VARCHAR(45) NULL,
  `Reszta` FLOAT NULL,
  PRIMARY KEY (`ID_rachunku`, `Historia zamowienia_ID_zamowienia`, `Historia zamowienia_Klient_Numer_klienta`),
  INDEX `fk_Rachunek_Historia zamowienia1_idx` (`Historia zamowienia_ID_zamowienia` ASC, `Historia zamowienia_Klient_Numer_klienta` ASC),
  CONSTRAINT `fk_Rachunek_Historia zamowienia1`
    FOREIGN KEY (`Historia zamowienia_ID_zamowienia`)
    REFERENCES `restauracja`.`Historia zamowienia` (`ID_zamowienia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Typy_dan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Typy_dan` (
  `ID_Typu_dania` INT NOT NULL,
  `Nazwa_typu` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Typu_dania`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Danie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Danie` (
  `ID_dania` INT NOT NULL,
  `Ilosc_kalorii` INT NULL,
  `Cena` INT NULL,
  `Czas_oczekiwania` FLOAT NULL,
  `Nazwa_dania` VARCHAR(45) NULL,
  `Typy_dan_ID_Typu_dania` INT NOT NULL,
  PRIMARY KEY (`ID_dania`, `Typy_dan_ID_Typu_dania`),
  INDEX `fk_Danie_Typy_dan1_idx` (`Typy_dan_ID_Typu_dania` ASC),
  CONSTRAINT `fk_Danie_Typy_dan1`
    FOREIGN KEY (`Typy_dan_ID_Typu_dania`)
    REFERENCES `restauracja`.`Typy_dan` (`ID_Typu_dania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Historia zamowienia_has_Danie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Historia zamowienia_has_Danie` (
  `Historia zamowienia_ID_zamowienia` INT NOT NULL,
  `Historia zamowienia_Pracownik_ID_pracownika` INT NOT NULL,
  `Historia zamowienia_Klient_ID_Klienta` INT NOT NULL,
  `Danie_ID_dania` INT NOT NULL,
  `Danie_Typy_dan_ID_Typu_dania` INT NOT NULL,
  PRIMARY KEY (`Historia zamowienia_ID_zamowienia`, `Historia zamowienia_Pracownik_ID_pracownika`, `Historia zamowienia_Klient_ID_Klienta`, `Danie_ID_dania`, `Danie_Typy_dan_ID_Typu_dania`),
  INDEX `fk_Historia zamowienia_has_Danie_Danie1_idx` (`Danie_ID_dania` ASC, `Danie_Typy_dan_ID_Typu_dania` ASC),
  INDEX `fk_Historia zamowienia_has_Danie_Historia zamowienia1_idx` (`Historia zamowienia_ID_zamowienia` ASC, `Historia zamowienia_Pracownik_ID_pracownika` ASC, `Historia zamowienia_Klient_ID_Klienta` ASC),
  CONSTRAINT `fk_Historia zamowienia_has_Danie_Historia zamowienia1`
    FOREIGN KEY (`Historia zamowienia_ID_zamowienia` , `Historia zamowienia_Pracownik_ID_pracownika` , `Historia zamowienia_Klient_ID_Klienta`)
    REFERENCES `restauracja`.`Historia zamowienia` (`ID_zamowienia` , `Pracownik_ID_pracownika` , `Klient_ID_Klienta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historia zamowienia_has_Danie_Danie1`
    FOREIGN KEY (`Danie_ID_dania`)
    REFERENCES `restauracja`.`Danie` (`ID_dania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Skladniki_dania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Skladniki_dania` (
  `ID_Skladnika` INT NOT NULL,
  `Nazwa_skladnika` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Skladnika`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Danie_has_Skladniki_dania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Danie_has_Skladniki_dania` (
  `Danie_ID_dania` INT NOT NULL,
  `Danie_Typy_dan_ID_Typu_dania` INT NOT NULL,
  `Skladniki_dania_ID_Skladnika` INT NOT NULL,
  PRIMARY KEY (`Danie_ID_dania`, `Danie_Typy_dan_ID_Typu_dania`, `Skladniki_dania_ID_Skladnika`),
  INDEX `fk_Danie_has_Skladniki_dania_Skladniki_dania1_idx` (`Skladniki_dania_ID_Skladnika` ASC),
  INDEX `fk_Danie_has_Skladniki_dania_Danie1_idx` (`Danie_ID_dania` ASC, `Danie_Typy_dan_ID_Typu_dania` ASC),
  CONSTRAINT `fk_Danie_has_Skladniki_dania_Danie1`
    FOREIGN KEY (`Danie_ID_dania`)
    REFERENCES `restauracja`.`Danie` (`ID_dania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Danie_has_Skladniki_dania_Skladniki_dania1`
    FOREIGN KEY (`Skladniki_dania_ID_Skladnika`)
    REFERENCES `restauracja`.`Skladniki_dania` (`ID_Skladnika`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
