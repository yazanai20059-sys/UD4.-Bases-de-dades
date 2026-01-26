-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercici4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercici4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercici4` ;
USE `Ejercici4` ;

-- -----------------------------------------------------
-- Table `Ejercici4`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici4`.`client` (
  `id` INT NOT NULL,
  ` DNI` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognom` VARCHAR(100) NULL,
  `Direcio` VARCHAR(255) NULL,
  `telefon` VARCHAR(14) NULL,
  `VIP_id` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici4`.`Tipupolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici4`.`Tipupolissa` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `Discripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici4`.`venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici4`.`venedor` (
  `id` INT NOT NULL,
  `identificador` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(100) NULL,
  `Direcio` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici4`.`Polissa` (
  `id` INT NOT NULL,
  `Numero` VARCHAR(25) NULL,
  `Preu` INT NULL,
  `Tipusdepagament` VARCHAR(45) NULL,
  `Datadecontratacio` VARCHAR(50) NULL,
  `Datadeinici` VARCHAR(50) NULL,
  `Datadefin` VARCHAR(50) NULL,
  `Tipupolissa_ID` INT NOT NULL,
  `client_id` INT NOT NULL,
  `venedor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Polissa_Tipupolissa_idx` (`Tipupolissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_client1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_Polissa_venedor1_idx` (`venedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Tipupolissa`
    FOREIGN KEY (`Tipupolissa_ID`)
    REFERENCES `Ejercici4`.`Tipupolissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `Ejercici4`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_venedor1`
    FOREIGN KEY (`venedor_id`)
    REFERENCES `Ejercici4`.`venedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
