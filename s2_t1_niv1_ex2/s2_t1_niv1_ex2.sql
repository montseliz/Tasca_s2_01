-- MySQL Workbench Synchronization
-- Generated: 2023-01-13 13:07
-- Model: New Model
-- Version: 1.0
-- Project: s2_t1_niv1_ex2
-- Author: Montse Liz

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_surname1` VARCHAR(45) NOT NULL,
  `customer_surname2` VARCHAR(45) NULL DEFAULT NULL,
  `customer_phone` VARCHAR(9) NOT NULL,
  `customer_address` VARCHAR(255) NOT NULL,
  `customer_zip` VARCHAR(5) NOT NULL,
  `locality_locality_id` INT(11) NOT NULL,
  `province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_phone_UNIQUE` (`customer_phone` ASC) VISIBLE,
  INDEX `fk_customer_locality_idx` (`locality_locality_id` ASC) VISIBLE,
  INDEX `fk_customer_province1_idx` (`province_province_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_locality`
    FOREIGN KEY (`locality_locality_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_province1`
    FOREIGN KEY (`province_province_id`)
    REFERENCES `pizzeria`.`province` (`province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`locality` (
  `locality_id` INT(11) NOT NULL AUTO_INCREMENT,
  `locality_name` VARCHAR(45) NOT NULL,
  `province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`locality_id`),
  INDEX `fk_locality_province1_idx` (`province_province_id` ASC) VISIBLE,
  CONSTRAINT `fk_locality_province1`
    FOREIGN KEY (`province_province_id`)
    REFERENCES `pizzeria`.`province` (`province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`province` (
  `province_id` INT(11) NOT NULL AUTO_INCREMENT,
  `province_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`province_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`shop` (
  `shop_id` INT(11) NOT NULL AUTO_INCREMENT,
  `shop_name` VARCHAR(45) NOT NULL,
  `shop_address` VARCHAR(255) NOT NULL,
  `shop_zip` VARCHAR(5) NOT NULL,
  `locality_locality_id` INT(11) NOT NULL,
  `province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`shop_id`),
  INDEX `fk_shop_locality1_idx` (`locality_locality_id` ASC) VISIBLE,
  INDEX `fk_shop_province1_idx` (`province_province_id` ASC) VISIBLE,
  CONSTRAINT `fk_shop_locality1`
    FOREIGN KEY (`locality_locality_id`)
    REFERENCES `pizzeria`.`locality` (`locality_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_shop_province1`
    FOREIGN KEY (`province_province_id`)
    REFERENCES `pizzeria`.`province` (`province_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`purchase` (
  `purchase_id` INT(11) NOT NULL AUTO_INCREMENT,
  `purchase_type` CHAR(1) NOT NULL COMMENT 'Possible values for the type of orders: \nH: At home\nS: In shop\n',
  `purchase_datetime` DATETIME NOT NULL,
  `purchase_delivery_datetime` DATETIME NULL DEFAULT NULL COMMENT 'In case of order in shop, indicate the default expression',
  `shop_shop_id` INT(11) NOT NULL,
  `customer_customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`purchase_id`),
  INDEX `fk_order_shop1_idx` (`shop_shop_id` ASC) VISIBLE,
  INDEX `fk_purchase_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_shop1`
    FOREIGN KEY (`shop_shop_id`)
    REFERENCES `pizzeria`.`shop` (`shop_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_purchase_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `pizzeria`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`product` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_type` CHAR(1) NOT NULL COMMENT 'Possible values for the type of products: \nP: Pizza\nH: Hamburguer\nB: Beverages',
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(255) NULL DEFAULT NULL,
  `product_picture` VARCHAR(255) NULL DEFAULT NULL,
  `product_price` DECIMAL(10,2) UNSIGNED NOT NULL,
  `categoryP_categoryP_id` INT(11) NULL DEFAULT NULL COMMENT 'In case of hamburger or beverage, indicate the default expression',
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_categoryP1_idx` (`categoryP_categoryP_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_categoryP1`
    FOREIGN KEY (`categoryP_categoryP_id`)
    REFERENCES `pizzeria`.`categoryP` (`categoryP_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`categoryP` (
  `categoryP_id` INT(11) NOT NULL AUTO_INCREMENT,
  `categoryP_name` VARCHAR(45) NOT NULL COMMENT 'The name category of pizza type product',
  PRIMARY KEY (`categoryP_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_type` CHAR(1) NOT NULL COMMENT 'Possible values for the type of employee: \nC: Cooker\nD: Delivery worker\n',
  `employee_name` VARCHAR(45) NOT NULL,
  `employee_surname1` VARCHAR(45) NOT NULL,
  `employee_surname2` VARCHAR(45) NULL DEFAULT NULL,
  `employee_nif` VARCHAR(9) NOT NULL,
  `employee_phone` VARCHAR(9) NOT NULL,
  `shop_shop_id` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE INDEX `employee_nif_UNIQUE` (`employee_nif` ASC) VISIBLE,
  UNIQUE INDEX `employee_phone_UNIQUE` (`employee_phone` ASC) VISIBLE,
  INDEX `fk_employee_shop1_idx` (`shop_shop_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_shop1`
    FOREIGN KEY (`shop_shop_id`)
    REFERENCES `pizzeria`.`shop` (`shop_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`purchase_has_product` (
  `purchase_purchase_id` INT(11) NOT NULL,
  `product_product_id` INT(11) NOT NULL,
  `amount_product` INT(10) UNSIGNED NOT NULL COMMENT 'The amount of the product selected. Indicate even if it\'s one product. ',
  `purchase_total_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`purchase_purchase_id`, `product_product_id`),
  INDEX `fk_purchase_has_product_product1_idx` (`product_product_id` ASC) VISIBLE,
  INDEX `fk_purchase_has_product_purchase1_idx` (`purchase_purchase_id` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_has_product_purchase1`
    FOREIGN KEY (`purchase_purchase_id`)
    REFERENCES `pizzeria`.`purchase` (`purchase_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_purchase_has_product_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `pizzeria`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
