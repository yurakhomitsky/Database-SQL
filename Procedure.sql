
-- Оновлення населення країни
DELIMITER //
CREATE PROCEDURE Update_Population(Countr_y varchar(40),new_population int(11))
BEGIN
declare ID_1 int;
if Countr_y  in (select name_country from country) and new_population > 0 then
SELECT 
    id_country
INTO ID_1 FROM
    country
WHERE
    name_country = Countr_y; 
UPDATE country SET population = new_population WHERE (id_country=ID_1);
select concat('Нове населення ',name_country,' складає ',convert(population,char),' людей') as 'Повідомлення'
from country
where id_country=ID_1;
elseif Countr_y  not in (select name_country from country) then
Select 'Такої країни у базі не існує' as 'Повідомлення';
elseif new_population < 0 then
Select 'Населення не може бути відємним' as 'Повідомлення';
end if;
END //

call Update_Population('США',9230045);



-- Видалення країни з організації
DELIMITER //
CREATE PROCEDURE Delete_Country_From_Org(Countr_y varchar(40),abr varchar(40), param2 date)
BEGIN
declare ID_1 int;
declare ID_2 int;
 IF(!EXISTS(SELECT id_org FROM country_in_organization
INNER JOIN union_n ON union_n_union_id = union_id
INNER JOIN country ON country_id_country = id_country
WHERE name_country = Countr_y AND  abbrevitation= abr)) THEN
SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Країна не вступала в цю організацію';
end if;
if Countr_y  in (select name_country from country) and abr in(select abbrevitation from union_n)  then
SELECT 
    id_country
INTO ID_1 FROM
    country
WHERE
    name_country = Countr_y;
    select union_id
    INTO ID_2 from
    union_n
    where abbrevitation=abr;
UPDATE country_in_organization SET date_of_release = param2 WHERE (country_id_country=ID_1 and union_n_union_id=ID_2);
select concat(name_country,' вийшла з Організації ','"',name_union,'"',' Дата виходу- ',date_of_release) as 'Повідомлення'
FROM country inner join country_in_organization on id_country=country_id_country inner join union_n on union_id=union_n_union_id
where id_country=ID_1 and union_n_union_id=ID_2;
elseif Countr_y  not in (select name_country from country) then
Select 'Такої країни у базі не існує' as 'Повідомлення';
elseif abr  not in (select abbrevitation  from union_n) then
Select 'Такої організації у базі не існує' as 'Повідомлення';
end if;
END //

drop procedure Delete_Country_From_Org


call Delete_Country_From_Org('Канада','РЄ','2019-05-13');-- тригер

call Delete_Country_From_Org('Україна','РЄ','2019-05-29');

call Delete_Country_From_Org('Німеччина','ОБСЄ','2019-05-29');-- ввести

drop trigger check_date_release

DELIMITER //
CREATE TRIGGER check_date_release
BEFORE UPDATE
   ON country_in_organization FOR EACH ROW
BEGIN
DECLARE exception CONDITION FOR SQLSTATE '22012';
DECLARE CONTINUE HANDLER FOR exception RESIGNAL SET MESSAGE_TEXT = 'Ви не можете додати дату виходу.Тому що країна раніше вийшла';
if old.date_of_release is not null then
SIGNAL exception;
end if;
END //



-- Інформація про країну 
DELIMITER //
CREATE PROCEDURE Information_about_country(Countr_y varchar(40))
BEGIN
if Countr_y  in (select name_country from country)  then
SELECT 
    name_country as 'Країна',
    name_capital as 'Столиця',
    name_land as 'Материк',
    name_region as 'Регіон',
    currency as 'Валюта',
    president as 'Президент',
    GROUP_CONCAT(Distinct(name_lang) SEPARATOR '; ') as 'Державні мови',
    GROUP_CONCAT(Distinct(name_union) SEPARATOR '; ') as 'Союзи держави'
FROM
   union_n inner join country_in_organization on union_id=union_n_union_id 
   inner join country on id_country=country_id_country 
   inner join capital on id_capital=capital_id_capital
   inner join language_in_country on id_country=language_in_country.country_id_country
   inner join language on id_lang =language_id_lang
   inner join regions on id_regions =regions_id_regions
   inner join mainland on id_land=mainland_id_land
    where name_country = Countr_y;
elseif Countr_y  not in (select name_country from country) then
Select 'Такої країни у базі не існує' as 'Повідомлення';
end if;
END //
call Information_about_country ('Канада');


-- Оновлення витрат на експорт ALL - Оновити всім
DELIMITER //
CREATE PROCEDURE Update_Price_export (countr_y varchar(50), Money int, yea_r year)
BEGIN
declare ID_1 int;
select id_country into ID_1 from country where name_country=Countr_y; 
if Countr_y  in (select name_country from country) and yea_r in (select year from economy)  then
UPDATE Economy SET Price_export = Price_export + Money WHERE country_id_country=ID_1 and Year=yea_r;
SELECT 
    name_country AS 'Країна',
    economy.price_export AS 'Обновлений прайс на експорт',
    economy.year AS 'рік'
FROM
    economy
        JOIN
    country ON id_country = country_id_country
WHERE
    id_country = id_1
        AND economy.year = yea_r;
elseif countr_y = 'ALL' and yea_r in (select year from economy) then
UPDATE Economy SET Price_export = Price_export + Money where Year=yea_r;
SELECT 
    name_country AS 'Країна',
    economy.price_export AS 'Обновлений прайс на експорт',
    economy.year AS 'рік'
FROM
    economy
        JOIN
 country ON id_country = country_id_country
WHERE
    economy.year = yea_r;
elseif  Countr_y not in (select name_country from country) and Countr_y <> 'ALL' and yea_r not in (select year from economy) then
select 'Немає такої країни та такого року у базі даних' as 'Повідомлення';
elseif  Countr_y not in (select name_country from country) and Countr_y <> 'ALL' then
select 'Немає такої країни у базі даних' as 'Повідомлення';
elseif  Countr_y  in (select name_country from country) and  yea_r not in (select year from economy) or Countr_y = 'ALL' and  yea_r not in (select year from economy) then
select 'Немає такого року у базі даних' as 'Повідомлення';
END IF;
END//

call Update_Price_export('Україна',+200,'2001')


-- Столиці у часовому поясі. ALL - всі часові пояси
DELIMITER //
CREATE PROCEDURE Information_time_zone (time_zon_e varchar(15))
BEGIN
if time_zon_e in (select name_zone from time_zone) then 
SELECT 
    name_capital as 'Столиця',
   name_zone as 'Часовий пояс',
    CONCAT('Точний час у місті  <<',
            name_capital,
            '>>  є  <<',
            CONVERT( CONVERT( UTC_TIME() + time_zone.time , TIME) , CHAR),
            '>>') AS 'Світові годинники'
FROM time_zone join сapital_in_time_zone on id_zone=time_zone_id_zone join capital on id_capital=capital_id_capital 
WHERE
    name_zone = time_zon_e;
elseif time_zon_e = 'ALL' then
SELECT 
    CONCAT('Точний час у місті  <<',
            name_capital,
            '>>  є  <<',
            CONVERT( CONVERT( UTC_TIME() + time_zone.time , TIME) , CHAR),
            '>>') AS 'Світові годинники'
FROM time_zone join сapital_in_time_zone on id_zone=time_zone_id_zone join capital on id_capital=capital_id_capital;
elseif  time_zon_e not in (select name_zone from time_zone) and time_zon_e <> 'ALL' then
select 'Не коректно передані параметри' as 'Повідомлення';
END IF;
END //

drop procedure Information_time_zone;
call Information_time_zone('UTC+3');



-- Інформацію про економіку країни за певний рік. ALL - Всі країни 
DELIMITER //
CREATE PROCEDURE Information_about_economy (countr_y varchar(40),yea_r year)
BEGIN
declare ID_1 int;
select id_country into ID_1 from country where name_country=countr_y;
if countr_y in (select name_country from country) and yea_r in (select distinct(year) from economy) then
SELECT 
    name_country AS 'Країна',
    CONCAT(CONVERT( economy.VVP , CHAR), ' $') AS 'Витрати на особу на рік',
    CONCAT(CONVERT( economy.Cost_of_army , CHAR),
            ' MILION $') AS 'Витрати на армію',
    CONCAT(CONVERT( economy.Cost_of_education , CHAR),
            ' MILION $') AS 'Витрати на освіту',
    CONCAT(CONVERT( economy.Cost_of_medicine , CHAR),
            ' MILION $') AS 'Витрати на медицину',
    CONCAT(CONVERT( economy.Price_export , CHAR),
            ' MILION $') AS 'Експорт',
    CONCAT(CONVERT( economy.Price_import , CHAR),
            ' MILION $') AS 'Імпорт'
FROM
    economy
        JOIN
 country ON id_country = country_id_country
WHERE
    id_country = ID_1
        AND economy.Year = yea_r;
elseif countr_y='ALL' and yea_r in (select distinct(year) from economy) then
SELECT 
    name_country AS 'Країна',
    CONCAT(CONVERT( economy.VVP , CHAR), ' $') AS 'Витрати на особу на рік',
    CONCAT(CONVERT( economy.Cost_of_army , CHAR),
            ' MILION $') AS 'Витрати на армію',
    CONCAT(CONVERT( economy.Cost_of_education , CHAR),
            ' MILION $') AS 'Витрати на освіту',
    CONCAT(CONVERT( economy.Cost_of_medicine , CHAR),
            ' MILION $') AS 'Витрати на медицину',
    CONCAT(CONVERT( economy.Price_export , CHAR),
            ' MILION $') AS 'Експорт',
    CONCAT(CONVERT( economy.Price_import , CHAR),
            ' MILION $') AS 'Імпорт'
FROM
    economy
        JOIN
 country ON id_country = country_id_country
    where economy.year=yea_r;
elseif yea_r not in (select distinct(year) from economy) and countr_y in (select name_country  from country) or yea_r not in (select distinct(year) from economy) and countr_y='ALL' then 
select 'Немає такого року у базі даних' as 'Повідомлення';
elseif yea_r  in (select distinct(year) from economy) and countr_y not in (select name_country  from country) or yea_r  in (select distinct(year) from economy) and countr_y='ALL' then 
select 'Немає такої країни у базі даних' as 'Повідомлення';
end if; 
END //

call Information_about_economy ('Україна','2001')


-- Функції


-- Країна у організації (in) - У організації (not in) - вийшла з організації
DELIMITER //
CREATE FUNCTION Country_in_unio_n (Countr_y varchar(50), Status varchar(15)) RETURNS varchar(500) deterministic
BEGIN
DECLARE QQQ varchar(500);
if Status='in' then 
SELECT 
    GROUP_CONCAT(name_union
        SEPARATOR ';   ')
INTO QQQ FROM country inner join 
country_in_organization on id_country=country_id_country 
inner join union_n on union_id=union_n_union_id
WHERE
    name_country = countr_y and country_in_organization.Date_of_release is null
GROUP BY name_country;
elseif Status='not in' then 
SELECT 
    GROUP_CONCAT(name_union
        SEPARATOR ';   ')
INTO QQQ FROM country inner join 
country_in_organization on id_country=country_id_country 
inner join union_n on union_id=union_n_union_id
WHERE
    name_country = countr_y and country_in_organization.Date_of_release is not null
GROUP BY  name_country;
end if;
return QQQ;
END //

drop function Country_in_unio_n;

select name_country as 'Країна', Country_in_unio_n(name_country,'not in') as 'Організації' 
from country




-- Пріоритетне завдання країни за певний рік
DELIMITER //
CREATE FUNCTION Preority (Countr_y varchar(50), yea_r year) RETURNS varchar(200) deterministic
BEGIN
declare QQQ varchar(200);
if yea_r in (select distinct(year) from economy) then
SELECT 
    CONCAT(
            ' Пріоритетним завданням є розвиток у області ',
            CASE
                WHEN
                    economy.cost_of_army >= economy.Cost_of_education
                        AND economy.Cost_of_army >= economy.Cost_of_medicine
                THEN
                    'Армія'
                WHEN
                    economy.Cost_of_education >= economy.Cost_of_army
                        AND economy.cost_of_education >= economy.Cost_of_medicine
                THEN
                    'Освіта'
                WHEN
                    economy.Cost_of_medicine >= economy.Cost_of_army
                        AND economy.Cost_of_medicine >= economy.Cost_of_education
                THEN
                    'Медицина'
            END) into QQQ
FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
WHERE name_country=countr_y and economy.year=yea_r;
end if; 
return QQQ;
END //

SELECT 
    name_country AS 'Країна',
    economy.year AS 'Рік',
    Preority(name_country, economy.year) AS 'Пріоритетне завдання'
FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
WHERE
    economy.year = '2001'
    



-- Характеристика освіти
DELIMITER //
CREATE FUNCTION Education (Countr_y varchar(50), yea_r year) RETURNS varchar(50) deterministic
BEGIN
DECLARE QQQ varchar(50) default null;
if yea_r in (select distinct(year) from economy) then
SELECT 
    CASE
        WHEN
            economy.cost_of_education = (SELECT 
                    MAX(cost_of_education)
                FROM
                    economy
                WHERE
                    year = yea_r
                GROUP BY economy.country_id_country
                ORDER BY MAX(cost_of_education) DESC
                LIMIT 1) 
        THEN
            'Високий рівень освіти'
        WHEN
            economy.cost_of_education < (SELECT 
                    MAX(cost_of_education)
                FROM
                    economy
                WHERE
                    year = yea_r
                GROUP BY economy.country_id_country
                ORDER BY MAX(cost_of_education) DESC
                LIMIT 1)
                AND economy.cost_of_education >= (SELECT 
                    AVG(cost_of_education)
                FROM
                    economy
                WHERE
                    year = yea_r) 
        THEN
            'Середній рівень освіти'
        WHEN
            economy.cost_of_education < (SELECT 
                    AVG(cost_of_education) 
                FROM
                    economy
                WHERE
                    year = yea_r)
        THEN
            'Низький рівень освіти'
    END
INTO QQQ FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
WHERE
    name_country = countr_y
        AND economy.year = yea_r;
else 
SELECT 'Немає інформації про економіку по данному році' INTO QQQ;
end if;
return QQQ;
END // 

SELECT 
    name_country AS 'Країна',
    economy.year AS 'Рік',
    EDUCATION(name_country, economy.year) AS 'Коментар про освіту'
FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
WHERE
    economy.year = '2001'


-- Витрати та заробіток країна (+) -- Заробіток   (-) -- Витрати  (ALL) -- Розгорнута інформація 
DELIMITER //
CREATE FUNCTION Cost_Country (Countr_y varchar(50), yea_r year, W varchar(4)) RETURNS varchar(300) deterministic
BEGIN
declare QQQ varchar (300);
if w='-' and yea_r in (select distinct(year) from economy) then
SELECT 
    CONCAT(CONVERT( economy.cost_of_army + economy.cost_of_education + economy.cost_of_medicine + economy.price_import , CHAR),
            ' MILION $ (Витрачено)')
INTO QQQ FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
WHERE      
    name_country = Countr_y AND year = yea_r;
elseif w='+' and yea_r in (select distinct(year) from economy) then
SELECT 
    CONCAT(CONVERT(economy.price_export , CHAR),
            ' MILION $ (Зароблено)')
INTO QQQ FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
WHERE      
    name_country = Countr_y AND year = yea_r;
elseif  w='ALL' and yea_r in (select distinct(year) from economy) then
SELECT 
    CONCAT(CONVERT( economy.cost_of_army , CHAR),
            ' MILION $ (Витрачено) на армія;     ',
            CONVERT( economy.cost_of_education , CHAR),
            ' MILION $ (Витрачено) на освіту;     ',
            CONVERT( economy.cost_of_medicine , CHAR),
            ' MILION $ (Витрачено) на медицину;     ',
            CONVERT( economy.price_import , CHAR),
            ' MILION $ (Витрачено) на імпорт;     ',
            CONVERT( economy.price_export , CHAR),
            ' MILION $ (Зароблено) з експорту')
INTO QQQ 
FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
WHERE
    name_country = countr_y AND economy.year = yea_r;
end if;
return QQQ;
END //

SELECT 
    name_country AS 'Країна',
    economy.year AS 'Рік',
    Cost_Country(name_country, economy.year,'ALL') AS 'Витрати за рік'
FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
WHERE
    economy.year = '2001'


-- Повертає різницю в часі
DELIMITER //
CREATE FUNCTION Sub (Countr_y varchar(50), country_two varchar(50)) RETURNS varchar(100) deterministic
BEGIN
DECLARE QQQ varchar(100) default null;
if Countr_y in (select name_country from country) and country_two in (select name_country from country) then
SELECT   
		  
     CONCAT(Countr_y,' ',country_two,' різниця в часі між країнами: ',     
   CONVERT( time-(select time from time_zone
            JOIN
        сapital_in_time_zone ON id_zone = time_zone_id_zone
            JOIN
        capital ON id_capital = capital_id_capital
            JOIN
        country ON id_capital = country.capital_id_capital
			JOIN 
		regions on id_regions=regions_id_regions
        where name_country=Countr_y
        ),time),' годин' )
        
INTO QQQ from  time_zone
            JOIN
        сapital_in_time_zone ON id_zone = time_zone_id_zone
            JOIN
        capital ON id_capital = capital_id_capital
            JOIN
        country ON id_capital = country.capital_id_capital
			JOIN 
		regions on id_regions=regions_id_regions
WHERE
    name_country = country_two;
else 
SELECT 'Таких країн не існує в базі' INTO QQQ;
end if;
return QQQ;
END // 

drop function sub;
SELECT sub('Бразилія','Україна' ) AS 'Різниця в часі'

use map;
