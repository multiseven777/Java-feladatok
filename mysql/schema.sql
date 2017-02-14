-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies` ;
USE `movies` ;

SELECT CONCAT('DROP TABLES IF EXIST ',
 template,
 dvd, ';')

FROM
    information_schema_tables

WHERE
    table_schema = 'movies'

-- -----------------------------------------------------
-- Table `movies`.`template`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`template` (
  `movie_name` VARCHAR(45) NOT NULL,
  `movie_release` YEAR NOT NULL,
  `movie_genre` VARCHAR(45) NULL,
  PRIMARY KEY (`movie_name`, `movie_release`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `movies`.`dvd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`dvd` (
  `dvd_id` INT NOT NULL AUTO_INCREMENT,
  `name_m` VARCHAR(45) NOT NULL,
  `release_m` YEAR NOT NULL,
  `lead_actor` VARCHAR(45) NULL,
  `imdb_rating` INT NULL,
  `user_rating` INT NULL,
  PRIMARY KEY (`dvd_id`, `name_m`, `release_m`),
  INDEX `fk_dvd_template_idx` (`name_m` ASC, `release_m` ASC),
  CONSTRAINT `fk_dvd_template`
    FOREIGN KEY (`name_m` , `release_m`)
    REFERENCES `movies`.`template` (`movie_name` , `movie_release`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
