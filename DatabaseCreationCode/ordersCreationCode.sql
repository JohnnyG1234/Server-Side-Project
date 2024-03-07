-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema orders
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema orders
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `orders` DEFAULT CHARACTER SET utf8 ;
USE `orders` ;

-- -----------------------------------------------------
-- Table `orders`.`PlacedOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orders`.`PlacedOrder` (
  `order_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orders`.`CurrStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orders`.`CurrStatus` (
  `status_id` INT NOT NULL,
  `status_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orders`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orders`.`OrderStatus` (
  `status_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `as_of_date` DATETIME NOT NULL,
  PRIMARY KEY (`status_id`, `order_id`),
  INDEX `CurrStatusPlacedOrder1_idx` (`order_id` ASC) VISIBLE,
  INDEX `CurrStatusPlacedOrder_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `CurrStatusPlacedOrder`
    FOREIGN KEY (`status_id`)
    REFERENCES `orders`.`CurrStatus` (`status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CurrStatusPlacedOrder1`
    FOREIGN KEY (`order_id`)
    REFERENCES `orders`.`PlacedOrder` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orders`.`LineItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orders`.`LineItem` (
  `pid` INT NOT NULL,
  `qty` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`pid`, `order_id`),
  INDEX `LineItem1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `LineItem1`
    FOREIGN KEY (`order_id`)
    REFERENCES `orders`.`PlacedOrder` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orders`.`OrderPayment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orders`.`OrderPayment` (
  `cid (FK)` INT NOT NULL,
  `method_id (FK)` INT NOT NULL,
  `payment_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `table11`
    FOREIGN KEY (`order_id`)
    REFERENCES `orders`.`PlacedOrder` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
