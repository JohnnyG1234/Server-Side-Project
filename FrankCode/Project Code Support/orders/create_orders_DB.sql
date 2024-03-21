-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=1;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema orders
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS orders ;

-- -----------------------------------------------------
-- Schema orders
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS orders DEFAULT CHARACTER SET utf8 ;
USE orders ;

-- -----------------------------------------------------
-- Table OrderData
-- -----------------------------------------------------
DROP TABLE IF EXISTS OrderData ;

CREATE TABLE IF NOT EXISTS OrderData (
  cid INT NOT NULL,
  order_id INT NOT NULL,
  order_date DATETIME NOT NULL,
  PRIMARY KEY (order_id, cid ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table CurrStatus
-- -----------------------------------------------------
DROP TABLE IF EXISTS CurrStatus ;

CREATE TABLE IF NOT EXISTS CurrStatus (
  statusID INT NOT NULL,
  status_desc VARCHAR(45) NOT NULL,
  PRIMARY KEY (statusID))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table OrderStatus
-- -----------------------------------------------------
DROP TABLE IF EXISTS OrderStatus ;

CREATE TABLE IF NOT EXISTS OrderStatus (
  order_id INT NOT NULL,
  statusID INT NOT NULL,
  as_of_date DATETIME NOT NULL,
  PRIMARY KEY (order_id, statusID),
  CONSTRAINT fk_OrderStatus_Status1
    FOREIGN KEY (statusID)
    REFERENCES CurrStatus (statusID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_OrderStatus_Order1
    FOREIGN KEY (order_id)
    REFERENCES OrderData (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table LineItem
-- -----------------------------------------------------
DROP TABLE IF EXISTS LineItem ;

CREATE TABLE IF NOT EXISTS LineItem (
  order_id INT NOT NULL,
  pid INT NOT NULL,
  qty INT NOT NULL,
  PRIMARY KEY (order_id),
  CONSTRAINT fk_LineItem_Order1
    FOREIGN KEY (order_id)
    REFERENCES OrderData (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table OrderPayment
-- -----------------------------------------------------
DROP TABLE IF EXISTS OrderPayment ;

CREATE TABLE IF NOT EXISTS OrderPayment (
  order_id INT NOT NULL,
  cid INT NOT NULL,
  method_id INT NOT NULL,
  INDEX fk_OrderPayment_Order1_idx (order_id ASC),
  PRIMARY KEY (order_id),
  CONSTRAINT fk1_OrderPayment_Order1
    FOREIGN KEY (order_id)
    REFERENCES OrderData (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
