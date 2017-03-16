-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cv
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cv
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cv` DEFAULT CHARACTER SET utf8 ;
USE `cv` ;

-- -----------------------------------------------------
-- Table `cv`.`cv_template`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cv`.`cv_template` (
  `first_name` VARCHAR(45) NOT NULL,
  `second_name` VARCHAR(45) NULL,
  `birth_date` DATE NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `primary_school` VARCHAR(45) NULL,
  `high_school` VARCHAR(45) NULL,
  `university` VARCHAR(45) NULL,
  `known_languages` VARCHAR(45) NULL,
  `knowledge` VARCHAR(45) NULL,
  `previous_works` VARCHAR(45) NULL,
  `other` VARCHAR(45) NULL,
  PRIMARY KEY (`first_name`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
