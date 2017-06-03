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
-- Table `restauracja`.`Klienci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Klienci` (
  `ID_klienta` INT NOT NULL,
  PRIMARY KEY (`ID_klienta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Pracownicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Pracownicy` (
  `ID_pracownika` INT NOT NULL,
  `Imie` VARCHAR(45) NULL,
  `Nazwisko` VARCHAR(45) NULL,
  `Stanowisko` VARCHAR(45) NULL,
  `Zatrudniono` DATE NULL,
  PRIMARY KEY (`ID_pracownika`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Zamowienia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Zamowienia` (
  `ID_zamowienia` INT NOT NULL AUTO_INCREMENT,
  `Zlozono` DATETIME(0) NULL,
  `Wydano` DATETIME(0) NULL,
  `Czy_reklamacja` TINYINT NULL,
  `Razem` FLOAT NULL,
  `Klienci_ID_klienta` INT NOT NULL,
  `Pracownicy_ID_pracownika` INT NOT NULL,
  PRIMARY KEY (`ID_zamowienia`, `Klienci_ID_klienta`, `Pracownicy_ID_pracownika`),
  INDEX `fk_Zamowienia_Klienci1_idx` (`Klienci_ID_klienta` ASC),
  INDEX `fk_Zamowienia_Pracownicy1_idx` (`Pracownicy_ID_pracownika` ASC),
  CONSTRAINT `fk_Zamowienia_Klienci1`
    FOREIGN KEY (`Klienci_ID_klienta`)
    REFERENCES `restauracja`.`Klienci` (`ID_klienta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Zamowienia_Pracownicy1`
    FOREIGN KEY (`Pracownicy_ID_pracownika`)
    REFERENCES `restauracja`.`Pracownicy` (`ID_pracownika`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Rachunki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Rachunki` (
  `ID_rachunku` INT NOT NULL,
  `Cena` INT NULL,
  `Wystawiono` DATETIME(0) NULL,
  `Znizka` FLOAT NULL,
  `Sposob_zaplaty` VARCHAR(45) NULL,
  `Reszta` FLOAT NULL,
  `Zamowienia_ID_zamowienia` INT NOT NULL,
  `Zamowienia_Klienci_ID_klienta` INT NOT NULL,
  `Zamowienia_Pracownicy_ID_pracownika` INT NOT NULL,
  PRIMARY KEY (`ID_rachunku`, `Zamowienia_ID_zamowienia`, `Zamowienia_Klienci_ID_klienta`, `Zamowienia_Pracownicy_ID_pracownika`),
  INDEX `fk_Rachunki_Zamowienia1_idx` (`Zamowienia_ID_zamowienia` ASC, `Zamowienia_Klienci_ID_klienta` ASC, `Zamowienia_Pracownicy_ID_pracownika` ASC),
  CONSTRAINT `fk_Rachunki_Zamowienia1`
    FOREIGN KEY (`Zamowienia_ID_zamowienia` , `Zamowienia_Klienci_ID_klienta` , `Zamowienia_Pracownicy_ID_pracownika`)
    REFERENCES `restauracja`.`Zamowienia` (`ID_zamowienia` , `Klienci_ID_klienta` , `Pracownicy_ID_pracownika`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Typy dan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Typy dan` (
  `ID_Typu_dania` INT NOT NULL,
  `Nazwa_typu_dania` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Typu_dania`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Dania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Dania` (
  `ID_dania` INT NOT NULL,
  `Typy dan_ID_Typu_dania` INT NOT NULL,
  `Ilosc_kalorii` INT NULL,
  `Cena` INT NULL,
  `Czas_oczekiwania` FLOAT NULL,
  `Nazwa_dania` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_dania`, `Typy dan_ID_Typu_dania`),
  INDEX `fk_Dania_Typy dan1_idx` (`Typy dan_ID_Typu_dania` ASC),
  CONSTRAINT `fk_Dania_Typy dan1`
    FOREIGN KEY (`Typy dan_ID_Typu_dania`)
    REFERENCES `restauracja`.`Typy dan` (`ID_Typu_dania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Typ skladnika`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Typ skladnika` (
  `ID_Typu_skladnika` INT NOT NULL,
  `Nazwa_typu_skladnika` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Typu_skladnika`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Skladniki_dania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Skladniki_dania` (
  `ID_Skladnika` INT NOT NULL,
  `Typ skladnika_ID_Typu_skladnika` INT NOT NULL,
  `Nazwa_skladnika` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Skladnika`, `Typ skladnika_ID_Typu_skladnika`),
  INDEX `fk_Skladniki_dania_Typ skladnika1_idx` (`Typ skladnika_ID_Typu_skladnika` ASC),
  CONSTRAINT `fk_Skladniki_dania_Typ skladnika1`
    FOREIGN KEY (`Typ skladnika_ID_Typu_skladnika`)
    REFERENCES `restauracja`.`Typ skladnika` (`ID_Typu_skladnika`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Dania_has_Skladniki_dania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Dania_has_Skladniki_dania` (
  `Dania_ID_dania` INT NOT NULL,
  `Dania_Typy dan_ID_Typu_dania` INT NOT NULL,
  `Skladniki_dania_ID_Skladnika` INT NOT NULL,
  `Skladniki_dania_Typ skladnika_ID_Typu_skladnika` INT NOT NULL,
  PRIMARY KEY (`Dania_ID_dania`, `Dania_Typy dan_ID_Typu_dania`, `Skladniki_dania_ID_Skladnika`, `Skladniki_dania_Typ skladnika_ID_Typu_skladnika`),
  INDEX `fk_Dania_has_Skladniki_dania_Skladniki_dania1_idx` (`Skladniki_dania_ID_Skladnika` ASC, `Skladniki_dania_Typ skladnika_ID_Typu_skladnika` ASC),
  INDEX `fk_Dania_has_Skladniki_dania_Dania1_idx` (`Dania_ID_dania` ASC, `Dania_Typy dan_ID_Typu_dania` ASC),
  CONSTRAINT `fk_Dania_has_Skladniki_dania_Dania1`
    FOREIGN KEY (`Dania_ID_dania` , `Dania_Typy dan_ID_Typu_dania`)
    REFERENCES `restauracja`.`Dania` (`ID_dania` , `Typy dan_ID_Typu_dania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dania_has_Skladniki_dania_Skladniki_dania1`
    FOREIGN KEY (`Skladniki_dania_ID_Skladnika` , `Skladniki_dania_Typ skladnika_ID_Typu_skladnika`)
    REFERENCES `restauracja`.`Skladniki_dania` (`ID_Skladnika` , `Typ skladnika_ID_Typu_skladnika`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restauracja`.`Zamowienia_has_Dania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restauracja`.`Zamowienia_has_Dania` (
  `Zamowienia_ID_zamowienia` INT NOT NULL,
  `Zamowienia_Klienci_ID_klienta` INT NOT NULL,
  `Zamowienia_Pracownicy_ID_pracownika` INT NOT NULL,
  `Dania_ID_dania` INT NOT NULL,
  `Dania_Typy dan_ID_Typu_dania` INT NOT NULL,
  PRIMARY KEY (`Zamowienia_ID_zamowienia`, `Zamowienia_Klienci_ID_klienta`, `Zamowienia_Pracownicy_ID_pracownika`, `Dania_ID_dania`, `Dania_Typy dan_ID_Typu_dania`),
  INDEX `fk_Zamowienia_has_Dania_Dania1_idx` (`Dania_ID_dania` ASC, `Dania_Typy dan_ID_Typu_dania` ASC),
  INDEX `fk_Zamowienia_has_Dania_Zamowienia1_idx` (`Zamowienia_ID_zamowienia` ASC, `Zamowienia_Klienci_ID_klienta` ASC, `Zamowienia_Pracownicy_ID_pracownika` ASC),
  CONSTRAINT `fk_Zamowienia_has_Dania_Zamowienia1`
    FOREIGN KEY (`Zamowienia_ID_zamowienia` , `Zamowienia_Klienci_ID_klienta` , `Zamowienia_Pracownicy_ID_pracownika`)
    REFERENCES `restauracja`.`Zamowienia` (`ID_zamowienia` , `Klienci_ID_klienta` , `Pracownicy_ID_pracownika`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Zamowienia_has_Dania_Dania1`
    FOREIGN KEY (`Dania_ID_dania` , `Dania_Typy dan_ID_Typu_dania`)
    REFERENCES `restauracja`.`Dania` (`ID_dania` , `Typy dan_ID_Typu_dania`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
