-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema Payments
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Payments` ;

-- -----------------------------------------------------
-- Schema Payments
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Payments` DEFAULT CHARACTER SET utf8 ;
USE `Payments` ;

-- -----------------------------------------------------
-- Table `Customer_Card`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer_Card` ;

CREATE TABLE IF NOT EXISTS `Customer_Card` (
  `card_number` BIGINT NOT NULL,
  `cid` INT NOT NULL,
  `CVN` VARCHAR(255) NOT NULL,
  `card_month` VARCHAR(255) NOT NULL,
  `card_year` VARCHAR(255) NOT NULL,
  `card_name` VARCHAR(255) NOT NULL,
  `card_address` VARCHAR(255) NOT NULL,
  `card_city` VARCHAR(255) NOT NULL,
  `card_state` VARCHAR(255) NOT NULL,
  `card_zip` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`card_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

