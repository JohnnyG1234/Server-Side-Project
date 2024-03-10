-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendor
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `vendor` ;

-- -----------------------------------------------------
-- Schema vendor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendor` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema vendor
-- -----------------------------------------------------
USE `vendor` ;

-- -----------------------------------------------------
-- Table `mydb`.`VendorCompany`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vendor`.`VendorCompany` ;

CREATE TABLE IF NOT EXISTS `vendor`.`VendorCompany` (
  `vid` INT NOT NULL AUTO_INCREMENT,
  `vendor_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`vid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendor`.`VendorSalesPerson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vendor`.`VendorSalesPerson` ;

CREATE TABLE IF NOT EXISTS `vendor`.`VendorSalesPerson` (
  `v_person_id` INT NOT NULL AUTO_INCREMENT,
  `vfn` VARCHAR(45) NOT NULL,
  `vln` VARCHAR(45) NOT NULL,
  `vid` INT NOT NULL,
  PRIMARY KEY (`v_person_id`),
  CONSTRAINT `fk_VenorContact_VendorCompany`
    FOREIGN KEY (`vid`)
    REFERENCES `mydb`.`VendorCompany` (`vid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendor`.`VendorContact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vendor`.`VendorContact` ;

CREATE TABLE IF NOT EXISTS `vendor`.`VendorContact` (
  `v_contact_id` INT NOT NULL AUTO_INCREMENT,
  `v_contact_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`v_contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendor`.`VendorPersonContact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vendor`.`VendorPersonContact` ;

CREATE TABLE IF NOT EXISTS `vendor`.`VendorPersonContact` (
  `v_person_id` INT NOT NULL,
  `v_contact_id` INT NOT NULL,
  `v_contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`v_person_id`, `v_contact_id`),
  CONSTRAINT `fk_VenorContact_has_VendorContact_VenorContact1`
    FOREIGN KEY (`v_person_id`)
    REFERENCES `mydb`.`VendorSalesPerson` (`v_person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VenorContact_has_VendorContact_VendorContact1`
    FOREIGN KEY (`v_contact_id`)
    REFERENCES `mydb`.`VendorContact` (`v_contact_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
