-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema m4prog
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `m4prog` ;

-- -----------------------------------------------------
-- Schema m4prog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `m4prog` DEFAULT CHARACTER SET utf8 ;
USE `m4prog` ;

-- -----------------------------------------------------
-- Table `m4prog`.`klant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`klant` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`klant` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(250) NOT NULL,
  `geboortedatum` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`abonnement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`abonnement` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`abonnement` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `abonnementtype` VARCHAR(45) NOT NULL,
  `kostenPerMaand` DECIMAL(10,2) UNSIGNED NOT NULL,
  `mbGratis` INT UNSIGNED NOT NULL,
  `smsGratis` INT UNSIGNED NOT NULL,
  `belMinuten` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `abonnementtype_UNIQUE` (`abonnementtype` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`factuur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`factuur` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`factuur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `vanmaand` INT NOT NULL,
  `factuurDatum` DATETIME NOT NULL,
  `betaaldDatum` DATETIME NOT NULL,
  `totaalBedrag` DECIMAL(10,2) NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_factuur_klant1_idx` (`klant_id` ASC) VISIBLE,
  CONSTRAINT `fk_factuur_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `m4prog`.`klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`dienstcodes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`dienstcodes` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`dienstcodes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dienstnaam` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`tarief`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`tarief` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`tarief` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `perunit` DECIMAL(10,2) NOT NULL,
  `tariefnaam` VARCHAR(250) NOT NULL,
  `geldigvan` DATETIME NOT NULL,
  `geldigtot` DATETIME NULL,
  `dienstcodes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tariefnaam_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_tarief_dienstcodes_idx` (`dienstcodes_id` ASC) VISIBLE,
  CONSTRAINT `fk_tarief_dienstcodes`
    FOREIGN KEY (`dienstcodes_id`)
    REFERENCES `m4prog`.`dienstcodes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`gesprekken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`gesprekken` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`gesprekken` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naarnummer` VARCHAR(45) NOT NULL,
  `startdatum` DATETIME NOT NULL,
  `einddatum` DATETIME NOT NULL,
  `tarief_id` INT NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_gesprekken_tarief1_idx` (`tarief_id` ASC) VISIBLE,
  INDEX `fk_gesprekken_klant1_idx` (`klant_id` ASC) VISIBLE,
  CONSTRAINT `fk_gesprekken_tarief1`
    FOREIGN KEY (`tarief_id`)
    REFERENCES `m4prog`.`tarief` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gesprekken_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `m4prog`.`klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`smsverbruik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`smsverbruik` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`smsverbruik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naarnummer` VARCHAR(45) NULL,
  `aantalpaginas` INT NULL,
  `tarief_id` INT NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  `datum` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_smsverbruik_tarief1_idx` (`tarief_id` ASC) VISIBLE,
  INDEX `fk_smsverbruik_klant1_idx` (`klant_id` ASC) VISIBLE,
  CONSTRAINT `fk_smsverbruik_tarief1`
    FOREIGN KEY (`tarief_id`)
    REFERENCES `m4prog`.`tarief` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_smsverbruik_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `m4prog`.`klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`dataverbruik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`dataverbruik` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`dataverbruik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `MBs` VARCHAR(45) NOT NULL,
  `datum` DATETIME NOT NULL,
  `tarief_id` INT NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_dataverbruik_tarief1_idx` (`tarief_id` ASC) VISIBLE,
  INDEX `fk_dataverbruik_klant1_idx` (`klant_id` ASC) VISIBLE,
  CONSTRAINT `fk_dataverbruik_tarief1`
    FOREIGN KEY (`tarief_id`)
    REFERENCES `m4prog`.`tarief` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dataverbruik_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `m4prog`.`klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`abonnement_has_tarief`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`abonnement_has_tarief` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`abonnement_has_tarief` (
  `abonnement_id` INT UNSIGNED NOT NULL,
  `tarief_id` INT NOT NULL,
  PRIMARY KEY (`abonnement_id`, `tarief_id`),
  INDEX `fk_abonnement_has_tarief_tarief1_idx` (`tarief_id` ASC) VISIBLE,
  INDEX `fk_abonnement_has_tarief_abonnement1_idx` (`abonnement_id` ASC) VISIBLE,
  CONSTRAINT `fk_abonnement_has_tarief_abonnement1`
    FOREIGN KEY (`abonnement_id`)
    REFERENCES `m4prog`.`abonnement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_abonnement_has_tarief_tarief1`
    FOREIGN KEY (`tarief_id`)
    REFERENCES `m4prog`.`tarief` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`contract` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`contract` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ingangsdatum` DATETIME NOT NULL,
  `einddatum` DATETIME NOT NULL,
  `abonnement_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_contract_abonnement1_idx` (`abonnement_id` ASC) VISIBLE,
  CONSTRAINT `fk_contract_abonnement1`
    FOREIGN KEY (`abonnement_id`)
    REFERENCES `m4prog`.`abonnement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m4prog`.`klant_has_contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m4prog`.`klant_has_contract` ;

CREATE TABLE IF NOT EXISTS `m4prog`.`klant_has_contract` (
  `klant_id` INT UNSIGNED NOT NULL,
  `contract_id` INT NOT NULL,
  PRIMARY KEY (`klant_id`, `contract_id`),
  INDEX `fk_klant_has_contract_contract1_idx` (`contract_id` ASC) VISIBLE,
  INDEX `fk_klant_has_contract_klant1_idx` (`klant_id` ASC) VISIBLE,
  CONSTRAINT `fk_klant_has_contract_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `m4prog`.`klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_klant_has_contract_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `m4prog`.`contract` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
