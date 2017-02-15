-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `movies` ;

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies` ;
USE `movies` ;

-- -----------------------------------------------------
-- Table `movies`.`movie_database`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_database` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie_database` (
  `coll_id` INT NOT NULL AUTO_INCREMENT,
  `name_m` VARCHAR(45) NULL,
  `release_m` YEAR NULL,
  `genre_m` VARCHAR(45) NULL,
  `lead_actor` VARCHAR(45) NULL,
  `imdb_rating` INT NULL,
  `user_rating` INT NULL,
  PRIMARY KEY (`coll_id`),
  UNIQUE INDEX `name_m_UNIQUE` (`name_m` ASC),
  UNIQUE INDEX `release_m_UNIQUE` (`release_m` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `movies`.`movie_collection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_collection` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie_collection` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `movie_name` VARCHAR(45) NULL,
  `movie_release` YEAR NULL,
  PRIMARY KEY (`movie_id`),
  INDEX `fk_movie_collection_movie_database_idx` (`movie_name` ASC),
  INDEX `fk_movie_collection_movie_database1_idx` (`movie_release` ASC),
  UNIQUE INDEX `movie_name_UNIQUE` (`movie_name` ASC),
  UNIQUE INDEX `movie_release_UNIQUE` (`movie_release` ASC),
  CONSTRAINT `fk_movie_collection_movie_database`
    FOREIGN KEY (`movie_name`)
    REFERENCES `movies`.`movie_database` (`name_m`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_collection_movie_database1`
    FOREIGN KEY (`movie_release`)
    REFERENCES `movies`.`movie_database` (`release_m`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO user1;
 DROP USER user1;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user1' IDENTIFIED BY 'password1';

GRANT SELECT ON TABLE `movies`.* TO 'user1';
GRANT SELECT, INSERT, TRIGGER ON TABLE `movies`.* TO 'user1';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
