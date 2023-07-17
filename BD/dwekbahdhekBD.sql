-- MySQL Script generated by MySQL Workbench
-- Mon Mar 28 20:32:59 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Administrateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrateur` (
  `email_admin` VARCHAR(45) NOT NULL,
  `cin` INT NOT NULL,
  `photo_admin` VARCHAR(45) NULL,
  `username_admin` VARCHAR(45) NOT NULL,
  `sexe_admin` VARCHAR(45) NOT NULL,
  `tel_admin` INT NOT NULL,
  `mdp_admin` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`email_admin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `email_client` VARCHAR(45) NOT NULL,
  `cin` INT NOT NULL,
  `photo_client` VARCHAR(45) NULL,
  `username_client` VARCHAR(45) NOT NULL,
  `dateN` DATE NULL,
  `sexe_client` VARCHAR(45) NOT NULL,
  `tel_client` INT NOT NULL,
  `mdp_client` VARCHAR(15) NOT NULL,
  `lieu_client` VARCHAR(100) NOT NULL,
  `Administrateur_email_admin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email_client`),
  INDEX `fk_Client_Administrateur1_idx` (`Administrateur_email_admin` ASC),
  CONSTRAINT `fk_Client_Administrateur1`
    FOREIGN KEY (`Administrateur_email_admin`)
    REFERENCES `mydb`.`Administrateur` (`email_admin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Médecin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Médecin` (
  `email_medecin` VARCHAR(45) NOT NULL,
  `cin_medecin` INT NOT NULL,
  `photo_medecin` VARCHAR(45) NULL,
  `username_medecin` VARCHAR(45) NOT NULL,
  `dateN` DATE NULL,
  `sexe_medecin` VARCHAR(45) NOT NULL,
  `tel_medecin` INT NOT NULL,
  `mdp_medecin` VARCHAR(15) NOT NULL,
  `fichier_medecin` VARCHAR(100) NULL,
  `Administrateur_email_admin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email_medecin`),
  INDEX `fk_Médecin_Administrateur1_idx` (`Administrateur_email_admin` ASC),
  CONSTRAINT `fk_Médecin_Administrateur1`
    FOREIGN KEY (`Administrateur_email_admin`)
    REFERENCES `mydb`.`Administrateur` (`email_admin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Médicament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Médicament` (
  `nom_commercial` VARCHAR(45) NOT NULL,
  `laboratoire` VARCHAR(45) NOT NULL,
  `dci` VARCHAR(45) NOT NULL,
  `quantité` SMALLINT NOT NULL,
  `Pharmacie_adr_pharmacie` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`nom_commercial`, `laboratoire`),
  INDEX `fk_Médicament_Pharmacie1_idx` (`Pharmacie_adr_pharmacie` ASC),
  CONSTRAINT `fk_Médicament_Pharmacie1`
    FOREIGN KEY (`Pharmacie_adr_pharmacie`)
    REFERENCES `mydb`.`Pharmacie` (`adr_pharmacie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pharmacie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pharmacie` (
  `adr_pharmacie` VARCHAR(100) NULL,
  `email_pharmacie` VARCHAR(45) NULL,
  `nom_pharmacie` VARCHAR(45) NULL,
  `type_pharmacie` VARCHAR(45) NULL,
  `tel_pharmacie` INT NULL,
  PRIMARY KEY (`adr_pharmacie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pharmacien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pharmacien` (
  `email_pharmacien` VARCHAR(45) NOT NULL,
  `cin_pharmacien` INT NOT NULL,
  `photo_pharmacien` VARCHAR(45) NULL,
  `username_pharmacien` VARCHAR(45) NOT NULL,
  `dateN` DATE NULL,
  `sexe_pharmacien` VARCHAR(45) NOT NULL,
  `tel_pharmacien` INT NOT NULL,
  `mdp_pharmacien` VARCHAR(15) NOT NULL,
  `fichier_pharmacien` VARCHAR(100) NULL,
  `adr_pharmacie` VARCHAR(100) NULL,
  `Administrateur_email_admin` VARCHAR(45) NOT NULL,
  `Pharmacie_adr_pharmacie` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`email_pharmacien`),
  INDEX `fk_Pharmacien_Administrateur1_idx` (`Administrateur_email_admin` ASC),
  INDEX `fk_Pharmacien_Pharmacie1_idx` (`Pharmacie_adr_pharmacie` ASC) ,
  CONSTRAINT `fk_Pharmacien_Administrateur1`
    FOREIGN KEY (`Administrateur_email_admin`)
    REFERENCES `mydb`.`Administrateur` (`email_admin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pharmacien_Pharmacie1`
    FOREIGN KEY (`Pharmacie_adr_pharmacie`)
    REFERENCES `mydb`.`Pharmacie` (`adr_pharmacie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Post` (
  `titre_post` VARCHAR(45) NOT NULL,
  `photo_post` VARCHAR(45) NOT NULL,
  `paragraphes_post` VARCHAR(45) NOT NULL,
  `username_medecin` VARCHAR(45) NOT NULL,
  `date_post` VARCHAR(45) NOT NULL,
  `mot_clé_post` VARCHAR(45) NOT NULL,
  `Médecin_email_medecin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`titre_post`, `Médecin_email_medecin`),
  INDEX `fk_Post_Médecin1_idx` (`Médecin_email_medecin` ASC),
  CONSTRAINT `fk_Post_Médecin1`
    FOREIGN KEY (`Médecin_email_medecin`)
    REFERENCES `mydb`.`Médecin` (`email_medecin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
