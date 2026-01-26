-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercici2.b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercici2.b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercici2.b` ;
USE `Ejercici2.b` ;

-- -----------------------------------------------------
-- Table `Ejercici2.b`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.b`.`Cine` (
  `id` INT NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(13) NULL,
  `Ciutat` VARCHAR(100) NULL,
  `Numsalas` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.b`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.b`.`Pelicula` (
  `id` INT NOT NULL,
  `TITUL` VARCHAR(100) NULL,
  `Classificacio` VARCHAR(45) NULL,
  `GENERA` VARCHAR(100) NULL,
  `Director` VARCHAR(255) NULL,
  `Durada` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.b`.`Projeccio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.b`.`Projeccio` (
  `id` INT NOT NULL,
  `DATA` DATE NULL,
  `SALA` VARCHAR(45) NULL,
  `HORA` VARCHAR(45) NULL,
  `Cine_id` INT NOT NULL,
  `Pelicula_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Projeccio_Cine_idx` (`Cine_id` ASC) VISIBLE,
  INDEX `fk_Projeccio_Pelicula1_idx` (`Pelicula_id` ASC) VISIBLE,
  CONSTRAINT `fk_Projeccio_Cine`
    FOREIGN KEY (`Cine_id`)
    REFERENCES `Ejercici2.b`.`Cine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Pelicula1`
    FOREIGN KEY (`Pelicula_id`)
    REFERENCES `Ejercici2.b`.`Pelicula` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.b`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.b`.`Tarifa` (
  `id` INT NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(255) NULL,
  `PREU` VARCHAR(45) NULL,
  `Projeccio_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Tarifa_Projeccio1_idx` (`Projeccio_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tarifa_Projeccio1`
    FOREIGN KEY (`Projeccio_id`)
    REFERENCES `Ejercici2.b`.`Projeccio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
