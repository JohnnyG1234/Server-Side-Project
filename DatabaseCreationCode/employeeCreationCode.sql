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
-- Table `Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee` ;

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_ID` INT NOT NULL,
  `employee_firstname` VARCHAR(45) NOT NULL,
  `employee_lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address` ;

CREATE TABLE IF NOT EXISTS `Address` (
  `employee_address_ID` INT NOT NULL,
  `employee_street` VARCHAR(45) NOT NULL,
  `employee_city` VARCHAR(45) NOT NULL,
  `employee_state` VARCHAR(2) NOT NULL,
  `employee_zip` VARCHAR(5) NOT NULL,
  `employee_ID` INT NOT NULL,
  PRIMARY KEY (`employee_address_ID`),
  INDEX `Address_idx` (`employee_ID` ASC) VISIBLE,
  CONSTRAINT `Address`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `Employee` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ContactType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ContactType` ;

CREATE TABLE IF NOT EXISTS `ContactType` (
  `contact_id` INT NOT NULL,
  `contact_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeeContact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmployeeContact` ;

CREATE TABLE IF NOT EXISTS `EmployeeContact` (
  `employee_ID` INT NOT NULL,
  `contact_id` INT NOT NULL,
  `contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_ID`, `contact_id`),
  INDEX `EmployeeContactType2_idx` (`contact_id` ASC) VISIBLE,
  INDEX `EmployeeContactType1_idx` (`employee_ID` ASC) VISIBLE,
  CONSTRAINT `EmployeeContactType1`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `Employee` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EmployeeContactType2`
    FOREIGN KEY (`contact_id`)
    REFERENCES `ContactType` (`contact_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Department` ;

CREATE TABLE IF NOT EXISTS `Department` (
  `dept_ID` INT NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dept_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee_Position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee_Position` ;

CREATE TABLE IF NOT EXISTS `Employee_Position` (
  `position_ID` INT NOT NULL,
  `position_name` VARCHAR(45) NOT NULL,
  `dept_ID` INT NOT NULL,
  PRIMARY KEY (`position_ID`),
  INDEX `Employee_Position1_idx` (`dept_ID` ASC) VISIBLE,
  CONSTRAINT `Employee_Position1`
    FOREIGN KEY (`dept_ID`)
    REFERENCES `Department` (`dept_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HistoryStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HistoryStatus` ;

CREATE TABLE IF NOT EXISTS `HistoryStatus` (
  `status_id` INT NOT NULL,
  `status_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeeHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmployeeHistory` ;

CREATE TABLE IF NOT EXISTS `EmployeeHistory` (
  `start_date` DATETIME NOT NULL,
  `salary` INT NOT NULL,
  `comments` VARCHAR(255) NOT NULL,
  `employee_ID` INT NOT NULL,
  `position_ID` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`start_date`, `employee_ID`, `position_ID`),
  INDEX `EmployeeHistory2_idx` (`employee_ID` ASC) VISIBLE,
  INDEX `EmployeeHistory3_idx` (`position_ID` ASC) VISIBLE,
  INDEX `EmployeeHistory1_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `EmployeeHistory2`
    FOREIGN KEY (`employee_ID`)
    REFERENCES `Employee` (`employee_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EmployeeHistory3`
    FOREIGN KEY (`position_ID`)
    REFERENCES `Employee_Position` (`position_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EmployeeHistory1`
    FOREIGN KEY (`status_id`)
    REFERENCES `HistoryStatus` (`status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaryType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SalaryType` ;

CREATE TABLE IF NOT EXISTS `SalaryType` (
  `salary_ID` INT NOT NULL,
  `salary_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`salary_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaryPosition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SalaryPosition` ;

CREATE TABLE IF NOT EXISTS `SalaryPosition` (
  `salary_date` DATETIME NOT NULL,
  `salary_value` INT NOT NULL,
  `position_ID` INT NOT NULL,
  `salary_ID` INT NOT NULL,
  PRIMARY KEY (`salary_date`),
  INDEX `SalaryPosition1_idx` (`position_ID` ASC) VISIBLE,
  INDEX `SalaryPosition2_idx` (`salary_ID` ASC) VISIBLE,
  CONSTRAINT `SalaryPosition1`
    FOREIGN KEY (`position_ID`)
    REFERENCES `Employee_Position` (`position_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SalaryPosition2`
    FOREIGN KEY (`salary_ID`)
    REFERENCES `SalaryType` (`salary_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
