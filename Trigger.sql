-- Внесення країниу у організацію. Якщо організація була створена пізніше то помилка
DELIMITER //
create trigger  Add_country_in_organization before insert on country_in_organization for each row
begin 
DECLARE countr_y varchar(50);
DECLARE unio_n_1 varchar(50);
DECLARE exception CONDITION FOR SQLSTATE '22012';
DECLARE CONTINUE HANDLER FOR exception 
RESIGNAL SET MESSAGE_TEXT = 'Організація була створена пізніше від поточної дати вступу';
SELECT 
    name_country
INTO countr_y FROM
    country
WHERE
    id_country = new.country_id_country;
SELECT 
    name_union
INTO unio_n_1 FROM
    union_n
WHERE
    union_id = new.union_n_union_id;
if (new.Date_of_entry < (select Date_of_foundation from union_n where  union_id=new.union_n_union_id))
then
SIGNAL exception;
end if;
end//
drop trigger Add_country_in_organization;

-- Запрацює
INSERT INTO country_in_organization VALUES (36,'1999-01-22',NULL,6,12);

-- Не запрацює
INSERT INTO country_in_organization VALUES (36,'1899-01-22',NULL,4,2);



-- Перевірка чи країна є в організаці
DELIMITER //
create trigger  Add_country_in_organization_2 before insert on country_in_organization for each row
begin 
DECLARE exception CONDITION FOR SQLSTATE '22012';
DECLARE CONTINUE HANDLER FOR exception 
RESIGNAL SET MESSAGE_TEXT = 'Країна вже вступила у цю організацію';
if  (select date_of_release from country_in_organization where country_id_country=new.country_id_country and union_n_union_id=new.union_n_union_id) is null
then
SIGNAL exception;
end if;
end//

-- Не запрацює
INSERT INTO country_in_organization ( union_n_union_id, country_id_country, Date_of_entry) VALUES ( '4', '2', '1989-01-22');



-- Перевірка чи країна має таку мову
DELIMITER //
create trigger  add_language_in_country before insert on language_in_country for each row
begin 
declare countr_y varchar(50);
declare languag_e varchar(50);
DECLARE exception CONDITION FOR SQLSTATE '22012';
DECLARE CONTINUE HANDLER FOR exception 
RESIGNAL SET MESSAGE_TEXT = 'Країна вже має державну мову як ви намагаєтесь додати';
SELECT 
    name_country
INTO countr_y FROM
    country
WHERE
	 id_country= new.country_id_country;
SELECT 
    name_lang
INTO languag_e FROM
    language
WHERE
    id_lang = new.language_id_lang;
if (select id_lang_in_count from language_in_country where country_id_country=new.country_id_country and language_id_lang=new.language_id_lang) is not null 
then
SIGNAL exception;
end if;
end//
drop trigger add_language_in_country;

-- Запрацює
INSERT INTO language_in_country (country_id_country, language_id_lang) VALUES ('4', '2');

-- Не запрацює
INSERT INTO language_in_country (country_id_country, language_id_lang) VALUES ('4', '6');




-- Заборона додавання часового пояса
DELIMITER //
create trigger add_Time_zone before insert on time_zone for each row
begin 
DECLARE exception CONDITION FOR SQLSTATE '22012';
DECLARE exception_2 CONDITION FOR SQLSTATE '22013';
DECLARE CONTINUE HANDLER FOR exception RESIGNAL SET MESSAGE_TEXT = 'Ви не можете додати такий часовий пояс. Тому що такого часового пояса не існує';
DECLARE CONTINUE HANDLER FOR exception_2 RESIGNAL SET MESSAGE_TEXT = 'Ви не можете додати такий часовий пояс. Тому що він уже існує в базі';
if new.name_zone not in(select name_zone from time_zone) then
SIGNAL exception;
else 
SIGNAL exception_2;
end if;
end//


-- Перший варіант помилки
INSERT INTO time_zone (name_zone) VALUES ('UTC+14');

-- Другий варіант помилки
INSERT INTO time_zone (name_zone) VALUES ('UTC+18');


-- Перевірка даних
DELIMITER $$
CREATE  TRIGGER check1
BEFORE INSERT ON economy
FOR EACH ROW
BEGIN
  IF  (new.VVP)<=0 or (new.cost_of_army)<=0 or (new.cost_of_education)<=0 or (new.cost_of_medicine)<=0 or (new.price_export)<=0 or (new.price_import)<=0
  THEN
   SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Помилка вводу !';
  END IF;
END$$
drop trigger check1;

INSERT INTO economy (id_economy,  VVP, Cost_of_army, Cost_of_education, Cost_of_medicine, Price_export, Price_import,year,country_id_country) VALUES (52,0,245,80,135,350,0,2001,17);

DELIMITER $$
CREATE  TRIGGER check2
BEFORE INSERT  ON regions
FOR EACH ROW
BEGIN
  IF  (new.name_region like '%Європа' and new.mainland_id_land<>1) or (new.name_region like '%Азія' and new.mainland_id_land<>1) 
  THEN
   SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning:Цей регіон не може бути на цьому материку!(Регіон повинен бути на материку Євразія)';
elseif  (new.name_region like '%Африка' and new.mainland_id_land<>3) 
THEN 
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning:Цей регіон не може бути на цьому материку!(Регіон повинен бути на материку Африка)';
elseif (new.name_region like '%Америка' and new.mainland_id_land<>2) 
THEN 
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning:Цей регіон не може бути на цьому материку!(Регіон повинен бути на материку Америка)';
  END IF;
END$$
drop trigger check2;

INSERT INTO regions VALUES (20, 'Південна Америка', '1784000','3');