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
-- Table `Part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Part` ;

CREATE TABLE IF NOT EXISTS `Part` (
  `SKU` INT NOT NULL,
  `part_name` VARCHAR(45) NOT NULL,
  `vid` INT NOT NULL,
  PRIMARY KEY (`SKU`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product` ;

CREATE TABLE IF NOT EXISTS `Product` (
  `pid` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `prod_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductPart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductPart` ;

CREATE TABLE IF NOT EXISTS `ProductPart` (
  `SKU` INT NOT NULL,
  `pid` INT NOT NULL,
  `qty_part_on_hand` INT NOT NULL,
  `last_update` DATE NOT NULL,
  PRIMARY KEY (`SKU`, `pid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductInventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductInventory` ;

CREATE TABLE IF NOT EXISTS `ProductInventory` (
  `pid` INT NOT NULL,
  `quantity_on_hand` VARCHAR(45) NOT NULL,
  `as_of_date` DATE NOT NULL,
  `trigger_order` INT NOT NULL,
  PRIMARY KEY (`pid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductPrice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductPrice` ;

CREATE TABLE IF NOT EXISTS `ProductPrice` (
  `pid` INT NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`pid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductPriceHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductPriceHistory` ;

CREATE TABLE IF NOT EXISTS `ProductPriceHistory` (
  `pid` INT NOT NULL,
  `price_date` DATE NOT NULL,
  `last_price` INT NOT NULL,
  PRIMARY KEY (`pid`, `price_date`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
