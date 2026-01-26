-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercicio5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio5` ;
USE `Ejercicio5` ;

-- -----------------------------------------------------
-- Table `Ejercicio5`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio5`.`CLIENT` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(14) NULL,
  `NOM` VARCHAR(45) NULL,
  `COGNOM` VARCHAR(45) NULL,
  `DIRECIO` VARCHAR(255) NULL,
  `POBLACIO` VARCHAR(100) NULL,
  `EMAIL` VARCHAR(100) NULL,
  `TELEFON` VARCHAR(14) NULL,
  `USUARI` VARCHAR(50) NULL,
  `CONTRASENYA` VARCHAR(50) NULL,
  `NUMERODEVEICLES` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio5`.`TipusVeicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio5`.`TipusVeicles` (
  `id` INT NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio5`.`VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio5`.`VEHICLE` (
  `id` INT NOT NULL,
  `NumBastidor` VARCHAR(25) NULL,
  `Marca` VARCHAR(50) NULL,
  `Model` VARCHAR(50) NULL,
  `Matricula` VARCHAR(50) NULL,
  `CLIENT_id` INT NOT NULL,
  `TipusVeicles_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_VEHICLE_CLIENT_idx` (`CLIENT_id` ASC) VISIBLE,
  INDEX `fk_VEHICLE_TipusVeicles1_idx` (`TipusVeicles_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_CLIENT`
    FOREIGN KEY (`CLIENT_id`)
    REFERENCES `Ejercicio5`.`CLIENT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VEHICLE_TipusVeicles1`
    FOREIGN KEY (`TipusVeicles_id`)
    REFERENCES `Ejercicio5`.`TipusVeicles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio5`.`CITA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio5`.`CITA` (
  `id` INT NOT NULL,
  `DIA` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `VEHICLE_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_CITA_VEHICLE1_idx` (`VEHICLE_id` ASC) VISIBLE,
  CONSTRAINT `fk_CITA_VEHICLE1`
    FOREIGN KEY (`VEHICLE_id`)
    REFERENCES `Ejercicio5`.`VEHICLE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
