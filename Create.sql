create database map;
use map;
set foreign_key_checks=0;
SHOW ENGINE INNODB STATUS;

CREATE TABLE capital (
  `id_capital` INT NOT NULL AUTO_INCREMENT,
  `name_capital` VARCHAR(30) NULL,
  `area` INT NULL,
  `population` INT NULL,
  `mayor` VARCHAR(30) NULL,
  PRIMARY KEY (`id_capital`));
  
CREATE TABLE `сapital_in_time_zone` (
  `id_time_zone` INT NOT NULL AUTO_INCREMENT,
  `capital_id_capital` INT NOT NULL,
  `time_zone_id_zone` INT NOT NULL,
  PRIMARY KEY (`id_time_zone`),
    FOREIGN KEY (`capital_id_capital`)
    REFERENCES capital (`id_capital`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`time_zone_id_zone`)
    REFERENCES time_zone (`id_zone`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE `country_in_organization` (
  `id_org` INT NOT NULL AUTO_INCREMENT,
  `date_of_entry` DATE NULL,
  `date_of_release` DATE NULL,
  `union_n_union_id` INT NOT NULL,
  `country_id_country` INT NOT NULL,
  PRIMARY KEY (`id_org`),
    FOREIGN KEY (`union_n_union_id`)
    REFERENCES `union_n` (`union_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`country_id_country`)
    REFERENCES `country` (`id_country`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE mainland (
  `id_land` INT NOT NULL AUTO_INCREMENT,
  `name_land` VARCHAR(30) NULL,
  `area` INT NULL,
  `population` INT NULL,
  PRIMARY KEY (`id_land`));


CREATE TABLE regions (
  `id_regions` INT NOT NULL AUTO_INCREMENT,
  `name_region` VARCHAR(45) NULL,
  `area` INT NULL,
  `population` INT NULL,
  `mainland_id_land` INT NOT NULL,
  PRIMARY KEY (`id_regions`),
    FOREIGN KEY (`mainland_id_land`)
    REFERENCES `mainland` (`id_land`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);



CREATE TABLE country (
  `id_country` INT NOT NULL AUTO_INCREMENT,
  `name_country` VARCHAR(45) NOT NULL,
  `Area` INT(11) NOT NULL,
  `date_of_indenpedence` DATE NOT NULL,
  `forms_of_government` ENUM('Respublica', 'Monarhiya') NULL,
  `currency` VARCHAR(25) NULL DEFAULT '$',
  `president` VARCHAR(25) NULL,
  `vice_president` VARCHAR(25) NULL,
  `population` INT NULL,
  `capital_id_capital` INT NOT NULL,
  `regions_id_regions` INT NOT NULL,
  `phone_cod` VARCHAR(10) NULL,
  PRIMARY KEY (`id_country`),
    FOREIGN KEY (`capital_id_capital`)
    REFERENCES capital (`id_capital`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`regions_id_regions`)
    REFERENCES `regions` (`id_regions`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE union_n (
  `union_id` INT NOT NULL AUTO_INCREMENT,
  `name_union` VARCHAR(80) NULL,
  `abbrevitation` VARCHAR(15) NULL,
  `date_of_foundation` DATE NULL DEFAULT '0000-00-00',
  `headquartes` VARCHAR(30) NULL,
  `head` VARCHAR(45) NULL,
  PRIMARY KEY (`union_id`));


CREATE TABLE `language` (
  `id_lang` INT NOT NULL AUTO_INCREMENT,
  `name_lang` VARCHAR(45) NULL,
  `carries` INT NULL,
  `state` INT NULL,
  `official` INT NULL,
  `language_cod` VARCHAR(10) NULL,
  PRIMARY KEY (`id_lang`));


CREATE TABLE `time_zone` (
  `id_zone` INT NOT NULL AUTO_INCREMENT,
  `name_zone` VARCHAR(45) NULL,
  `time` TIME NULL,
  PRIMARY KEY (`id_zone`));


CREATE TABLE `economy` (
  `id_economy` INT NOT NULL AUTO_INCREMENT,
  `VVP` DECIMAL(9,2) NULL,
  `Cost_of_arm` DECIMAL(15,1) NULL,
  `cost_of_education` DECIMAL(15,1) NULL,
  `cost_of_medicine` DECIMAL(15,1) NULL,
  `price_export` DECIMAL(15,1) NULL,
  `price_import` DECIMAL(15,1) NULL,
  `milion` VARCHAR(20) NULL DEFAULT 'Milion $',
  `year` YEAR NULL,
  `country_id_country` INT NOT NULL,
  PRIMARY KEY (`id_economy`),
    FOREIGN KEY (`country_id_country`)
    REFERENCES country (`id_country`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE`language_in_county` (
  `id_lang_in_count` INT NOT NULL AUTO_INCREMENT,
  `language_id_lang` INT NOT NULL,
  `country_id_country` INT NOT NULL,
  PRIMARY KEY (`id_lang_in_count`),
    FOREIGN KEY (`language_id_lang`)
    REFERENCES language (`id_lang`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`country_id_country`)
    REFERENCES country (`id_country`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `country_in_organization` (
  `id_org` INT NOT NULL AUTO_INCREMENT,
  `date_of_entry` DATE NULL,
  `date_of_release` DATE NULL,
  `union_n_union_id` INT NOT NULL,
  `country_id_country` INT NOT NULL,
  PRIMARY KEY (`id_org`),
    FOREIGN KEY (`union_n_union_id`)
    REFERENCES `union_n` (`union_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`country_id_country`)
    REFERENCES `country` (`id_country`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);




