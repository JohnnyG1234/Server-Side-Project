-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema products
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `products` ;

CREATE SCHEMA IF NOT EXISTS `products` ;
USE `products` ;

-- -----------------------------------------------------
-- Table `Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product` ;

CREATE TABLE IF NOT EXISTS `Product` (
  `pid` INT(11) NOT NULL,
  `prod_name` VARCHAR(45) NOT NULL,
  `prod_desc` VARCHAR(255) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`pid`))
;


-- -----------------------------------------------------
-- Table `PartProduct`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartProduct` ;

CREATE TABLE IF NOT EXISTS `PartProduct` (
  `part_num` VARCHAR(10) NOT NULL,
  `pid` INT(11) NOT NULL,
  PRIMARY KEY (`part_num`,`pid`))
  ;

-- -----------------------------------------------------
-- Table `ProductInventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductInventory` ;

CREATE TABLE IF NOT EXISTS `ProductInventory` (
  `pid` INT(11) NOT NULL,
  `qty_on_hand` INT(11) NOT NULL,
  `as_of_date` DATETIME NOT NULL,
  `trigger_order` INT(11) NOT NULL,
  PRIMARY KEY (`pid`))
;


-- -----------------------------------------------------
-- Table `ProductPriceHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductPriceHistory` ;

CREATE TABLE IF NOT EXISTS `ProductPriceHistory` (
  `pid` INT(11) NOT NULL,
  `price_date` DATETIME NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`pid`, `price_date`)
);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
