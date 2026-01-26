-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercici2.c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercici2.c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercici2.c` ;
USE `Ejercici2.c` ;

-- -----------------------------------------------------
-- Table `Ejercici2.c`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.c`.`Alumne` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(100) NOT NULL,
  `telefon` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.c`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.c`.`Departament` (
  `id` INT NOT NULL,
  `nom` VARCHAR(100) NOT NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.c`.`Modul`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.c`.`Modul` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `credit` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `professor` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.c`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.c`.`matricula` (
  `id` INT NOT NULL,
  `alumne` VARCHAR(45) NOT NULL,
  `data` VARCHAR(45) NULL,
  `assignatura` VARCHAR(45) NULL,
  `Cursacademic` VARCHAR(45) NULL,
  `Alumne_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_matricula_Alumne1_idx` (`Alumne_id` ASC) VISIBLE,
  CONSTRAINT `fk_matricula_Alumne1`
    FOREIGN KEY (`Alumne_id`)
    REFERENCES `Ejercici2.c`.`Alumne` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.c`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.c`.`professor` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NULL,
  `titulació` VARCHAR(45) NULL,
  `telefon` VARCHAR(14) NULL,
  `Especializacion` VARCHAR(45) NULL,
  `Departament_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_professor_Departament1_idx` (`Departament_id` ASC) VISIBLE,
  CONSTRAINT `fk_professor_Departament1`
    FOREIGN KEY (`Departament_id`)
    REFERENCES `Ejercici2.c`.`Departament` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercici2.c`.`ModulMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercici2.c`.`ModulMatricula` (
  `ID` INT NOT NULL,
  `matricula_id` INT NOT NULL,
  `Modul_id` INT NOT NULL,
  `professor_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_ModulMatricula_matricula1_idx` (`matricula_id` ASC) VISIBLE,
  INDEX `fk_ModulMatricula_Modul1_idx` (`Modul_id` ASC) VISIBLE,
  INDEX `fk_ModulMatricula_professor1_idx` (`professor_id` ASC) VISIBLE,
  CONSTRAINT `fk_ModulMatricula_matricula1`
    FOREIGN KEY (`matricula_id`)
    REFERENCES `Ejercici2.c`.`matricula` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModulMatricula_Modul1`
    FOREIGN KEY (`Modul_id`)
    REFERENCES `Ejercici2.c`.`Modul` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModulMatricula_professor1`
    FOREIGN KEY (`professor_id`)
    REFERENCES `Ejercici2.c`.`professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
