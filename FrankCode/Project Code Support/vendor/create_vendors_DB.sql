-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=1;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendors
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS vendors;

-- -----------------------------------------------------
-- Schema vendors
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS vendors ;
USE vendors;

-- -----------------------------------------------------
-- Table Company
-- -----------------------------------------------------
DROP TABLE IF EXISTS Company ;

CREATE TABLE IF NOT EXISTS Company (
  vcid INT NOT NULL,
  vcname VARCHAR(255) NOT NULL,
  PRIMARY KEY (vcid))
;


-- -----------------------------------------------------
-- Table SalesPerson
-- -----------------------------------------------------
DROP TABLE IF EXISTS SalesPerson ;

CREATE TABLE IF NOT EXISTS SalesPerson (
  vspid INT NOT NULL,
  vsfn VARCHAR(255) NOT NULL,
  vsln VARCHAR(255) NOT NULL,
  vcid INT NOT NULL,
  PRIMARY KEY (vspid),
  CONSTRAINT FK1_SalesPerson
    FOREIGN KEY (vcid)
    REFERENCES Company (vcid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table Address
-- -----------------------------------------------------
DROP TABLE IF EXISTS Address ;

CREATE TABLE IF NOT EXISTS Address (
  vcid INT NOT NULL,
  vstreet VARCHAR(255) NOT NULL,
  vcity VARCHAR(255) NOT NULL,
  vst CHAR(2) NOT NULL,
  vzip CHAR(5) NOT NULL,
  PRIMARY KEY (vcid),
  CONSTRAINT FK1_Add
    FOREIGN KEY (vcid)
    REFERENCES Company (vcid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table Contact
-- -----------------------------------------------------
DROP TABLE IF EXISTS Contact ;

CREATE TABLE IF NOT EXISTS Contact (
  vspcontactid INT NOT NULL,
  vspcontact_type VARCHAR(255) NOT NULL,
  PRIMARY KEY (vspcontactid))
;


-- -----------------------------------------------------
-- Table SalesPersonContact
-- -----------------------------------------------------
DROP TABLE IF EXISTS SalesPersonContact ;

CREATE TABLE IF NOT EXISTS SalesPersonContact (
  vspid INT NOT NULL,
  vspcontactid INT NOT NULL,
  vspcontact VARCHAR(255) NOT NULL,
  PRIMARY KEY (vspid, vspcontactid),
  CONSTRAINT FK1_SalesContact
    FOREIGN KEY (vspid)
    REFERENCES SalesPerson (vspid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK2_SalesContact
    FOREIGN KEY (vspcontactid)
    REFERENCES Contact (vspcontactid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
