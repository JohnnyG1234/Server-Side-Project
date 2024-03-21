-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema parts
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `parts` ;

-- -----------------------------------------------------
-- Schema parts
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parts` DEFAULT CHARACTER SET utf8 ;
USE `parts` ;

-- -----------------------------------------------------
-- Table `Part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Part` ;

CREATE TABLE IF NOT EXISTS `Part` (
  `part_num` VARCHAR(10) NOT NULL,
  `part_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`part_num`))
;


-- -----------------------------------------------------
-- Table `PartHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartHistory` ;

CREATE TABLE IF NOT EXISTS `PartHistory` (
  `part_num` VARCHAR(10) NOT NULL,
  `part_hist_date` DATE NOT NULL,
  `part_price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`part_num`, `part_hist_date`),
  CONSTRAINT `2`
    FOREIGN KEY (`part_num`)
    REFERENCES `Part` (`part_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `PartInventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartInventory` ;

CREATE TABLE IF NOT EXISTS `PartInventory` (
  `part_num` VARCHAR(10) NOT NULL,
  `part_qty` INT NOT NULL,
  `part_min` INT NOT NULL,
  PRIMARY KEY (`part_num`),
  CONSTRAINT `1`
    FOREIGN KEY (`part_num`)
    REFERENCES `Part` (`part_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `PartProduct`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartProduct` ;

CREATE TABLE IF NOT EXISTS `PartProduct` (
  `part_num` VARCHAR(10) NOT NULL,
  `prod_id` INT NOT NULL,
  PRIMARY KEY (`part_num`, `prod_id`)
);


-- -----------------------------------------------------
-- Table `PartVendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartVendor` ;

CREATE TABLE IF NOT EXISTS `PartVendor` (
  `vcid` INT NOT NULL,
  `part_num` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`vcid`,`part_num`)
);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
