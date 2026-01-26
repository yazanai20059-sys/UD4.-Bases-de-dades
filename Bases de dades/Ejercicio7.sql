-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercicio7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio7` ;
USE `Ejercicio7` ;

-- -----------------------------------------------------
-- Table `Ejercicio7`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio7`.`Vendedor` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direcio` VARCHAR(45) NULL,
  `data_naixement` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio7`.`Client` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direcio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio7`.`TIQUET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio7`.`TIQUET` (
  `id` INT NOT NULL,
  `numero_factura` VARCHAR(45) NULL,
  `data` VARCHAR(45) NULL,
  `hora` VARCHAR(45) NULL,
  `Total` VARCHAR(45) NULL,
  `Client_id` INT NOT NULL,
  `Vendedor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_TIQUET_Client1_idx` (`Client_id` ASC) VISIBLE,
  INDEX `fk_TIQUET_Vendedor1_idx` (`Vendedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_TIQUET_Client1`
    FOREIGN KEY (`Client_id`)
    REFERENCES `Ejercicio7`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TIQUET_Vendedor1`
    FOREIGN KEY (`Vendedor_id`)
    REFERENCES `Ejercicio7`.`Vendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio7`.`PRODUCTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio7`.`PRODUCTE` (
  `id` INT NOT NULL,
  `descripcio` VARCHAR(45) NULL,
  `PreuUnitat` VARCHAR(45) NULL,
  `Quantitat` VARCHAR(45) NULL,
  `CodiBarres` VARCHAR(45) NULL,
  `iva` VARCHAR(45) NULL,
  `pvp` INT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio7`.`LINIATIQUET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio7`.`LINIATIQUET` (
  `id` INT NOT NULL,
  `unitat` VARCHAR(45) NULL,
  `descompte` VARCHAR(45) NULL,
  `TIQUET_id` INT NOT NULL,
  `PRODUCTE_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_LINIATIQUET_TIQUET_idx` (`TIQUET_id` ASC) VISIBLE,
  INDEX `fk_LINIATIQUET_PRODUCTE1_idx` (`PRODUCTE_id` ASC) VISIBLE,
  CONSTRAINT `fk_LINIATIQUET_TIQUET`
    FOREIGN KEY (`TIQUET_id`)
    REFERENCES `Ejercicio7`.`TIQUET` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LINIATIQUET_PRODUCTE1`
    FOREIGN KEY (`PRODUCTE_id`)
    REFERENCES `Ejercicio7`.`PRODUCTE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
