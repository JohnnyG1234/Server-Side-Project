-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Address Type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address Type` ;

CREATE TABLE IF NOT EXISTS `Address Type` (
  `add_id` INT NOT NULL,
  `address_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`add_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZipCodeCity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZipCodeCity` ;

CREATE TABLE IF NOT EXISTS `ZipCodeCity` (
  `zip_code` CHAR(5) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `st` CHAR(2) NOT NULL,
  PRIMARY KEY (`zip_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer` ;

CREATE TABLE IF NOT EXISTS `Customer` (
  `cid` INT NOT NULL,
  `title` CHAR(4) NOT NULL,
  `cfn` VARCHAR(45) NOT NULL,
  `cln` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address` ;

CREATE TABLE IF NOT EXISTS `Address` (
  `cid` INT NOT NULL,
  `add_id` INT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `zip_code` CHAR(5) NOT NULL,
  PRIMARY KEY (`cid`, `add_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Contact Type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Contact Type` ;

CREATE TABLE IF NOT EXISTS `Contact Type` (
  `contact_id` INT NOT NULL,
  `contact_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerContact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustomerContact` ;

CREATE TABLE IF NOT EXISTS `CustomerContact` (
  `cid` INT NOT NULL,
  `contact_id` INT NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cid`, `contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PaymentMethod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PaymentMethod` ;

CREATE TABLE IF NOT EXISTS `PaymentMethod` (
  `method_id` INT NOT NULL,
  `method_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`method_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerPaymentMethod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustomerPaymentMethod` ;

CREATE TABLE IF NOT EXISTS `CustomerPaymentMethod` (
  `cid` INT NOT NULL,
  `method_id` INT NOT NULL,
  PRIMARY KEY (`cid`, `method_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bank` ;

CREATE TABLE IF NOT EXISTS `Bank` (
  `routing_ID` INT NOT NULL,
  `bank_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`routing_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Checking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Checking` ;

CREATE TABLE IF NOT EXISTS `Checking` (
  `cid` INT NOT NULL,
  `method_id` INT NOT NULL,
  `acct_id` INT NOT NULL,
  `routing_ID` INT NOT NULL,
  PRIMARY KEY (`cid`, `method_id`, `acct_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GiftCardAmt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GiftCardAmt` ;

CREATE TABLE IF NOT EXISTS `GiftCardAmt` (
  `gift_card_number` CHAR(16) NOT NULL,
  `card_amt` INT NOT NULL,
  PRIMARY KEY (`gift_card_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GiftCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GiftCard` ;

CREATE TABLE IF NOT EXISTS `GiftCard` (
  `cid` INT NOT NULL,
  `method_id` INT NOT NULL,
  `gift_card_number` CHAR(16) NOT NULL,
  PRIMARY KEY (`cid`, `method_id`, `gift_card_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Card` ;

CREATE TABLE IF NOT EXISTS `Card` (
  `card_number` CHAR(16) NOT NULL,
  `card_name` VARCHAR(45) NOT NULL,
  `card_ccv2` CHAR(4) NOT NULL,
  `card_zip` CHAR(5) NOT NULL,
  `card_month` CHAR(2) NOT NULL,
  `card_year` CHAR(4) NOT NULL,
  PRIMARY KEY (`card_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CreditDebit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CreditDebit` ;

CREATE TABLE IF NOT EXISTS `CreditDebit` (
  `cid` INT NOT NULL,
  `method_id` INT NOT NULL,
  `card_number` CHAR(16) NOT NULL,
  PRIMARY KEY (`cid`, `method_id`, `card_number`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
