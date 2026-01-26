-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercici2.A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercici2.A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercici2.A` ;
USE `Ejercici2.A` ;

-- -----------------------------------------------------
-- Table `Ejercici2.A`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.A`.`PACIENT` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(100) NOT NULL,
  `Mobil` VARCHAR(13) NULL,
  `Direccio` VARCHAR(100) NULL,
  `NumeroSS` VARCHAR(25) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.A`.`METGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.A`.`METGE` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(100) NOT NULL,
  `NumColegiat` VARCHAR(25) NOT NULL,
  `Especialitat` VARCHAR(100) NULL,
  `Carrec` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.A`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.A`.`CONSULTA` (
  `DATA` DATE NULL,
  `Despatx` VARCHAR(45) NULL,
  `Diagnostic` VARCHAR(255) NULL,
  `PACIENT_id` INT NOT NULL,
  `METGE_id` INT NOT NULL,
  `ID` INT NOT NULL,
  INDEX `fk_CONSULTA_PACIENT_idx` (`PACIENT_id` ASC) VISIBLE,
  INDEX `fk_CONSULTA_METGE1_idx` (`METGE_id` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_PACIENT`
    FOREIGN KEY (`PACIENT_id`)
    REFERENCES `Ejercici2.A`.`PACIENT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_METGE1`
    FOREIGN KEY (`METGE_id`)
    REFERENCES `Ejercici2.A`.`METGE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
