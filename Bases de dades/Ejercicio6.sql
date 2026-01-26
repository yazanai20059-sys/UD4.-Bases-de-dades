-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercicio6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio6` ;
USE `Ejercicio6` ;

-- -----------------------------------------------------
-- Table `Ejercicio6`.`PASAJERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio6`.`PASAJERO` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(100) NULL,
  `Telefono` VARCHAR(14) NULL,
  `Email` VARCHAR(255) NULL,
  `Direccio` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio6`.`AVION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio6`.`AVION` (
  `id` INT NOT NULL,
  `Modelo` VARCHAR(100) NULL,
  `Capacidad` INT NULL,
  `Fabricant` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio6`.`VOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio6`.`VOL` (
  `id` INT NOT NULL,
  `NumVol` VARCHAR(7) NULL,
  `Origen` VARCHAR(100) NULL,
  `Desti` VARCHAR(100) NULL,
  `HoraLlegada` VARCHAR(45) NULL,
  `FechaSalida` VARCHAR(45) NULL,
  `FechaLlegada` VARCHAR(45) NULL,
  `HoraSalida` VARCHAR(45) NULL,
  `AVION_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_VUELO_AVION1_idx` (`AVION_id` ASC) VISIBLE,
  CONSTRAINT `fk_VUELO_AVION1`
    FOREIGN KEY (`AVION_id`)
    REFERENCES `Ejercicio6`.`AVION` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio6`.`RESERVA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio6`.`RESERVA` (
  `id` INT NOT NULL,
  `Codi` VARCHAR(10) NULL,
  `Fecha_Reserva` VARCHAR(45) NULL,
  `Importe_Total` VARCHAR(45) NULL,
  `VUELO_id` INT NOT NULL,
  `PASAJERO_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_RESERVA_VUELO1_idx` (`VUELO_id` ASC) VISIBLE,
  INDEX `fk_RESERVA_PASAJERO1_idx` (`PASAJERO_id` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVA_VUELO1`
    FOREIGN KEY (`VUELO_id`)
    REFERENCES `Ejercicio6`.`VOL` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVA_PASAJERO1`
    FOREIGN KEY (`PASAJERO_id`)
    REFERENCES `Ejercicio6`.`PASAJERO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
