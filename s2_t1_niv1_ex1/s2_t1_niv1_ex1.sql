-- MySQL Workbench Synchronization
-- Generated: 2023-01-13 23:26
-- Model: New Model
-- Version: 1.0
-- Project: s2_t1_niv1_ex1
-- Author: Montse Liz

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optica`.`provider` (
  `provider_id` INT(11) NOT NULL AUTO_INCREMENT,
  `provider_name` VARCHAR(45) NOT NULL,
  `provider_phone` VARCHAR(9) NOT NULL,
  `provider_fax` VARCHAR(9) NULL DEFAULT NULL,
  `provider_nif` VARCHAR(9) NOT NULL,
  `provider_address_id` INT(11) NOT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE INDEX `provider_phone_UNIQUE` (`provider_phone` ASC) VISIBLE,
  UNIQUE INDEX `provider_nif_UNIQUE` (`provider_nif` ASC) VISIBLE,
  INDEX `provider_name` (`provider_name` ASC) VISIBLE,
  INDEX `fk_provider_adress1_idx` (`provider_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_provider_adress1`
    FOREIGN KEY (`provider_address_id`)
    REFERENCES `optica`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `glasses_brand` VARCHAR(45) NOT NULL,
  `glasses_graduation_R` DECIMAL(5,2) NOT NULL COMMENT 'The graduation of the right eye. ',
  `glasses_graduation_L` DECIMAL(5,2) NOT NULL COMMENT 'The graduation of the left eye. ',
  `glasses_frame` CHAR(1) NOT NULL COMMENT 'Possible values:\nF = Floating\nP = Pasta\nM = Metallic\n',
  `glasses_colour_frame` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_colour_glass_R` VARCHAR(45) NULL DEFAULT NULL COMMENT 'The colour of the right glass. ',
  `glasses_colour_glass_L` VARCHAR(45) NULL DEFAULT NULL COMMENT 'The colour of the left glass.',
  `glasses_price` DECIMAL(10,2) NOT NULL,
  `provider_provider_id` INT(11) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `glasses_brand` (`glasses_brand` ASC) VISIBLE,
  INDEX `fk_glasses_provider_idx` (`provider_provider_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_provider`
    FOREIGN KEY (`provider_provider_id`)
    REFERENCES `optica`.`provider` (`provider_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_phone` VARCHAR(9) NOT NULL,
  `customer_email` VARCHAR(255) NOT NULL,
  `customer_registration` DATETIME NOT NULL,
  `customer_recommendation_id` INT(11) NULL DEFAULT NULL,
  `customer_address_id` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customers_email_UNIQUE` (`customer_email` ASC) VISIBLE,
  UNIQUE INDEX `customers_phone_UNIQUE` (`customer_phone` ASC) VISIBLE,
  INDEX `customers_registration` (`customer_registration` ASC) VISIBLE,
  INDEX `fk_customers_adress1_idx` (`customer_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_adress1`
    FOREIGN KEY (`customer_address_id`)
    REFERENCES `optica`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`sale` (
  `sale_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sale_employee` VARCHAR(45) NOT NULL,
  `sale_date` DATETIME NOT NULL,
  `customer_customer_id` INT(11) NOT NULL,
  `glasses_glasses_id` INT(11) NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `fk_sales_customers1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_sales_glasses1_idx` (`glasses_glasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_sales_customers1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `optica`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_glasses1`
    FOREIGN KEY (`glasses_glasses_id`)
    REFERENCES `optica`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address_street` VARCHAR(255) NOT NULL,
  `address_number` VARCHAR(45) NOT NULL,
  `address_floor` VARCHAR(45) NULL DEFAULT NULL,
  `address_door` VARCHAR(45) NULL DEFAULT NULL,
  `address_city` VARCHAR(45) NOT NULL,
  `address_zip` VARCHAR(5) NOT NULL,
  `address_country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `adress_country` (`address_country` ASC) INVISIBLE,
  INDEX `adress_city` (`address_city` ASC) INVISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
