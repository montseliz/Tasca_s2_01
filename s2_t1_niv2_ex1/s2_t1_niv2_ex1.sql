-- MySQL Workbench Synchronization
-- Generated: 2023-01-14 23:24
-- Model: New Model
-- Version: 1.0
-- Project: s2_t1_niv2_ex1
-- Author: Montse Liz

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `youtube`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(9) NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  `user_gender` ENUM('F', 'M') NOT NULL COMMENT 'F: Female\nM: Male',
  `user_country` VARCHAR(45) NOT NULL,
  `user_zip` VARCHAR(5) NULL DEFAULT NULL,
  `user_birthdate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) VISIBLE,
  UNIQUE INDEX `user_password_UNIQUE` (`user_password` ASC) VISIBLE,
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `video_id` INT(11) NOT NULL AUTO_INCREMENT,
  `video_title` VARCHAR(100) NOT NULL,
  `video_description` VARCHAR(255) NULL DEFAULT NULL,
  `video_size` DOUBLE(10,2) NOT NULL,
  `video_file_name` VARCHAR(45) NOT NULL,
  `video_duration` TIME NOT NULL,
  `video_thumbnail` VARCHAR(255) NOT NULL,
  `video_reproductions` INT(10) UNSIGNED NULL DEFAULT 0 COMMENT 'In case of not having reproductions yet, the defaut expression indicates that has 0 reproductions. ',
  `video_likes` INT(10) UNSIGNED NULL DEFAULT 0 COMMENT 'In case of not having likes, the defaut expression indicates that has 0 likes. ',
  `video_dislikes` INT(10) UNSIGNED NULL DEFAULT 0 COMMENT 'In case of not having dislikes, the defaut expression indicates that has 0 dislikes. ',
  `video_condition` ENUM('públic', 'ocult', 'privat') NOT NULL,
  `video_datetime_publishing` DATETIME NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  `channel_channel_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_video_user_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_video_channel1_idx` (`channel_channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_user`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_video_channel1`
    FOREIGN KEY (`channel_channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `channel_id` INT(11) NOT NULL AUTO_INCREMENT,
  `channel_name` VARCHAR(45) NOT NULL,
  `channel_description` VARCHAR(255) NULL DEFAULT NULL,
  `channel_datetime_creation` DATETIME NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`channel_id`),
  UNIQUE INDEX `channel_name_UNIQUE` (`channel_name` ASC) VISIBLE,
  INDEX `fk_channel_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`subscription` (
  `user_user_id` INT(11) NOT NULL,
  `channel_channel_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_user_id`, `channel_channel_id`),
  INDEX `fk_user_has_channel_channel1_idx` (`channel_channel_id` ASC) VISIBLE,
  INDEX `fk_user_has_channel_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_channel_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_channel_channel1`
    FOREIGN KEY (`channel_channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`tag` (
  `tag_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `playlist_id` INT(11) NOT NULL AUTO_INCREMENT,
  `playlist_name` VARCHAR(45) NOT NULL,
  `playlist_datetime_creation` DATETIME NOT NULL,
  `playlist_condition` ENUM('pública', 'privada') NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `fk_playlist_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist_has_video` (
  `playlist_playlist_id` INT(11) NOT NULL,
  `video_video_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlist_playlist_id`, `video_video_id`),
  INDEX `fk_playlist_has_video_video1_idx` (`video_video_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_video_playlist1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_video_playlist1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `youtube`.`playlist` (`playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_video_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`comment` (
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `comment_text` VARCHAR(255) NOT NULL,
  `comment_datetime` DATETIME NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  `video_video_id` INT(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `fk_comment_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_comment_video1_idx` (`video_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`feedback_video` (
  `feedback_video_id` INT(11) NOT NULL AUTO_INCREMENT,
  `feedback_video_reaction` ENUM('L', 'D') NOT NULL COMMENT 'L: Like\nD: Dislike',
  `feedback_video_datetime` DATETIME NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  `video_video_id` INT(11) NOT NULL,
  PRIMARY KEY (`feedback_video_id`),
  INDEX `fk_feedback_video_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_feedback_video_video1_idx` (`video_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_feedback_video_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_feedback_video_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`feedback_comment` (
  `feedback_comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `feedback_comment_reaction` ENUM('L', 'D') NOT NULL COMMENT 'L: Like\nD: Dislike',
  `feedback_comment_datetime` DATETIME NOT NULL,
  `comment_comment_id` INT(11) NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`feedback_comment_id`),
  INDEX `fk_feedback_comment_comment1_idx` (`comment_comment_id` ASC) VISIBLE,
  INDEX `fk_feedback_comment_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_feedback_comment_comment1`
    FOREIGN KEY (`comment_comment_id`)
    REFERENCES `youtube`.`comment` (`comment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_feedback_comment_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`video_has_tag` (
  `video_video_id` INT(11) NOT NULL,
  `tag_tag_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_video_id`, `tag_tag_id`),
  INDEX `fk_video_has_tag_tag1_idx` (`tag_tag_id` ASC) VISIBLE,
  INDEX `fk_video_has_tag_video1_idx` (`video_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_has_tag_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_video_has_tag_tag1`
    FOREIGN KEY (`tag_tag_id`)
    REFERENCES `youtube`.`tag` (`tag_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
