CREATE TABLE capital (
  id_capital  INT NOT NULL,
   name_capital  VARCHAR(30) NULL,
   area  INT NULL,
   population  INT NULL,
   mayor  VARCHAR(30) NULL,
  PRIMARY KEY ( id_capital ));
			   

CREATE TABLE  time_zone  (
   id_zone  INT NOT NULL,
   name_zone  VARCHAR(45) NULL,
   time  TIME NULL,
  PRIMARY KEY ( id_zone ));
			   
CREATE TABLE  сapital_in_time_zone  (
   id_time_zone  INT NOT NULL ,
   capital_id_capital  INT NOT NULL,
   time_zone_id_zone  INT NOT NULL,
  PRIMARY KEY ( id_time_zone ),
    FOREIGN KEY ( capital_id_capital )
    REFERENCES capital ( id_capital )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY ( time_zone_id_zone )
    REFERENCES time_zone ( id_zone )
    ON DELETE CASCADE
    ON UPDATE CASCADE);
			   
CREATE TABLE mainland (
   id_land  INT NOT NULL ,
   name_land  VARCHAR(30) NULL,
   area  INT NULL,
   population  INT NULL,
  PRIMARY KEY ( id_land ));
			   
CREATE TABLE regions (
   id_regions  INT NOT NULL,
   name_region  VARCHAR(45) NULL,
   area  INT NULL,
   population  INT NULL,
   mainland_id_land  INT NOT NULL,
  PRIMARY KEY ( id_regions ),
    FOREIGN KEY ( mainland_id_land )
    REFERENCES  mainland  ( id_land )
    ON DELETE CASCADE
    ON UPDATE CASCADE);
		
create type Forms as ENUM ('Президентська','Парламентська','Абсолютна','Конституційна')
CREATE TABLE country (
   id_country  INT NOT NULL ,
   name_country  VARCHAR(45) NOT NULL,
   Area  INT NOT NULL,
   date_of_indenpedence  DATE NOT NULL,
   forms_of_government  Forms,
   currency  VARCHAR(25) NULL DEFAULT '$',
   president  VARCHAR(25) NULL,
   vice_president  VARCHAR(25) NULL,
   population  INT NULL,
   capital_id_capital  INT NOT NULL,
   regions_id_regions  INT NOT NULL,
   phone_cod  VARCHAR(10) NULL,
  PRIMARY KEY ( id_country ),
    FOREIGN KEY ( capital_id_capital )
    REFERENCES capital ( id_capital )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY ( regions_id_regions )
    REFERENCES  regions  ( id_regions )
    ON DELETE CASCADE
    ON UPDATE CASCADE);
			   
CREATE TABLE union_n (
   union_id  INT NOT NULL,
   name_union  VARCHAR(80) NULL,
   abbrevitation  VARCHAR(15) NULL,
   date_of_foundation  DATE NULL,
   headquartes  VARCHAR(30) NULL,
   head  VARCHAR(45) NULL,
  PRIMARY KEY ( union_id ));
			   
 CREATE TABLE  language  (
   id_lang  INT NOT NULL ,
   name_lang  VARCHAR(45) NULL,
   carries  INT NULL,
   official  INT NULL,
   language_cod  VARCHAR(10) NULL,
  PRIMARY KEY ( id_lang ));
			   
CREATE TABLE language_in_county  (
   id_lang_in_count  INT NOT NULL ,
   country_id_country  INT NOT NULL,
language_id_lang  INT NOT NULL,
  PRIMARY KEY ( id_lang_in_count ),
    FOREIGN KEY ( language_id_lang )
    REFERENCES language ( id_lang )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY ( country_id_country )
    REFERENCES country ( id_country )
    ON DELETE CASCADE
    ON UPDATE CASCADE);
			   
 CREATE TABLE  country_in_organization  (
   id_org  INT NOT NULL ,
   date_of_entry  DATE NULL,
   date_of_release  DATE NULL,
   union_n_union_id  INT NOT NULL,
   country_id_country  INT NOT NULL,
  PRIMARY KEY ( id_org ),
    FOREIGN KEY ( union_n_union_id )
    REFERENCES  union_n  ( union_id )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY ( country_id_country )
    REFERENCES  country  ( id_country )
    ON DELETE CASCADE
    ON UPDATE CASCADE);
			   
CREATE TABLE  economy  (
   id_economy  INT NOT NULL ,
   VVP  DECIMAL(9,2) NULL,
   Cost_of_army  DECIMAL(15,1) NULL,
   Cost_of_education  DECIMAL(15,1) NULL,
   Cost_of_medicine  DECIMAL(15,1) NULL,
   Price_export  DECIMAL(15,1) NULL,
   Price_import  DECIMAL(15,1) NULL,
   milion  VARCHAR(20) NULL DEFAULT 'Milion $',
   year int NULL,
   country_id_country  INT NOT NULL,
  PRIMARY KEY ( id_economy ),
    FOREIGN KEY ( country_id_country )
    REFERENCES country ( id_country )
    ON DELETE CASCADE
    ON UPDATE CASCADE);
			   
			   			   
CREATE TABLE ocean (
   id_ocean  INT NOT NULL ,
   name_ocean  VARCHAR(30) NULL,
   area  INT NULL,
   avg_depth  INT NULL,
  PRIMARY KEY ( id_ocean ));