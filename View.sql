

-- Найпопулярніша та найменш популярна мови світу
CREATE VIEW Language_view AS
    SELECT 
        CONCAT(name_lang,
                ' країнах світу, а також офіційна у  ',
                language.official,
                ' країнах світу. Код мови - ',
                language.language_cod) AS 'Світові мови'
    FROM
        language_in_country
            JOIN
        language ON id_lang = language_id_lang
    WHERE
        id_lang = (SELECT 
                id_lang
            FROM
                language_in_country
                    JOIN
                language ON id_lang = language_id_lang
            GROUP BY id_lang
            ORDER BY COUNT(language_id_lang) DESC
            LIMIT 1)
    GROUP BY id_lang 
    UNION all SELECT 
        CONCAT(name_lang,
                ' офіційна у  ',
                language.official,
                ' країнах світу. Код мови - ',
                language.language_cod) AS 'Найпопулярніша мова'
    FROM
        language_in_country
            JOIN
        language ON id_lang = language_id_lang
    WHERE
        id_lang = (SELECT 
                id_lang
            FROM
                language_in_country
                    JOIN
                language ON id_lang = language_id_lang
            GROUP BY id_lang
            ORDER BY COUNT(language_id_lang) asc
            LIMIT 1)
    GROUP BY id_lang;
    
    
    drop view Language_view;
select * from Language_view;
use map;

-- Витрати на армію країн по рокам
CREATE VIEW cost_of_army AS
    SELECT 
        CONCAT('2000 YEAR   ',
                name_country,
                ' витратила на армію ',
                economy.cost_of_army,
                'Milion $ ') AS 'Витрати на армію'
    FROM
        economy
            JOIN
        country ON id_country = economy.country_id_country
    WHERE
        economy.year = '2000' 
    UNION SELECT 
        CONCAT('2001 YEAR   ',
                name_country,
                ' витратила на армію ',
                economy.cost_of_army,
                'Milion $ ') AS 'Витрати на армію'
    FROM
        economy
            JOIN
        country ON id_country = economy.country_id_country
    WHERE
        economy.year = '2001' 
    UNION all SELECT 
        CONCAT('2002 YEAR   ',
                name_country,
                ' витратила на армію ',
                economy.cost_of_army,
                'Milion $ ') AS 'Витрати на армію'
    FROM
        economy
            JOIN
        country ON id_country = economy.country_id_country
    WHERE
        economy.year = '2002';

drop view cost_of_army;
select * from cost_of_army ; 

-- Найбільша та найменша столиця
CREATE VIEW capital_view AS
    SELECT 
        CONCAT(name_capital,
                ' - є найменша за площею світова столиця з площею ',
                Capital.area,
                'Кв/Км з населенням ',
                Capital.population,
                '. Мером ',
               name_capital,
                ' є ',
                Capital.mayor) AS 'Світові стлиці'
    FROM
        capital
    WHERE
        id_capital = (SELECT 
                id_capital
            FROM
                capital
            ORDER BY area
            LIMIT 1) 
    UNION SELECT 
        CONCAT(name_capital,
                ' - є найбільша за площею світова столиця з площею ',
                Capital.area,
                'Кв/Км з населенням ',
                Capital.population,
                '. Мером ',
               name_capital,
                ' є ',
                Capital.mayor)
    FROM
        capital
    WHERE
        id_capital = (SELECT 
               id_capital
            FROM
                capital
            ORDER BY area DESC
            LIMIT 1);
                   
SELECT *FROM capital_view;   


-- Дані про найменшу організацію
CREATE VIEW litle_union AS
    SELECT 
        CONCAT('У організації ',
                name_union,
                ' є ',
                CAST(COUNT(country_in_organization.country_id_country) AS CHAR),
                ' країн. Штаб квартира організації - ',
                headquartes,
                '. Голова організації ',
                head) AS 'Відомості про найменшу організацію'
    FROM
        country_in_organization
            JOIN
        union_n ON union_id = country_in_organization.union_n_union_id
    GROUP BY name_union ,headquartes , head
    ORDER BY COUNT(country_in_organization.country_id_country)
    LIMIT 1;

drop view litle_union;
select*from litle_union;



-- Витрати на медицину по регіонам та їх сума
create view cost_medicine as
SELECT 
    CONCAT(name_region,
            ' витратила на медицину   ',
            SUM(economy.cost_of_medicine),
            'Milion $') AS 'Витрати на медицину'
FROM
    economy
        JOIN
    country ON id_country = economy.country_id_country
        JOIN
    regions on id_regions=regions_id_regions 
GROUP BY name_region
UNION SELECT 
    CONCAT('СУМА  ',
            SUM(economy.cost_of_medicine),
            'Milion $')
FROM
   economy
        JOIN
    country ON id_country = economy.country_id_country
        JOIN
    regions on id_regions=regions_id_regions;
   
select * from  cost_medicine;   



-- Країни в одинакових часових зонах
CREATE VIEW times_country AS
    SELECT 
        GROUP_CONCAT(name_country) AS Країни,
        name_zone AS 'Часова зона',
        COUNT(*) AS Кількість
    FROM
        time_zone
            JOIN
        сapital_in_time_zone ON id_zone = time_zone_id_zone
            JOIN
        capital ON id_capital = capital_id_capital
            JOIN
        country ON id_capital = country.capital_id_capital
    GROUP BY name_zone
    HAVING Кількість > 1;
select*from times_country;


-- Представлення яке зберігає інформацію про мови на яких говорять в регіонах
CREATE VIEW region AS
    SELECT 
        name_region,
        GROUP_CONCAT(DISTINCT name_country) AS Країни,
        GROUP_CONCAT(DISTINCT name_lang) AS Мови
    FROM
        regions
            JOIN
        country ON id_regions = regions_id_regions
            JOIN
        language_in_country ON id_country = country_id_country
            JOIN
        language ON id_lang = language_id_lang
    GROUP BY id_regions;
    
    drop view region;
    select*from region;


-- Найбільші столиці в регіонах
CREATE VIEW reg_cap AS
    SELECT 
        name_region AS Регіон,
        name_capital AS 'Столиця',
        CONCAT(CONVERT( MAX(capital.area) , CHAR),
                '  KM^2') AS 'Площа'
    FROM
        regions
            INNER JOIN
        country ON id_regions = regions_id_regions
            INNER JOIN
        capital ON id_capital = capital_id_capital
    GROUP BY name_region;

select*from reg_cap;


-- Найбільше населення по регіонах
create view pop_reg as
SELECT 
    name_region AS Регіон,
    CONCAT(CONVERT( regions.area , CHAR), '  KM^2') AS 'Площа',
    SUM(country.population) AS Населення
FROM
    regions
        INNER JOIN
    country ON id_regions = regions_id_regions
GROUP BY id_regions
ORDER BY Населення DESC;
  
-- Час в країнах
create view time_country as
    SELECT 
        name_region as Регіон,
        GROUP_CONCAT(DISTINCT name_country) AS Країни,
         group_concat('Час у країні <<',
            name_country,
            '>>  є  -',
            CONVERT( CONVERT( UTC_TIME() + time_zone.time , TIME) , CHAR),
            '>>') AS 'Світові годинники'
  FROM
        time_zone
            JOIN
        сapital_in_time_zone ON id_zone = time_zone_id_zone
            JOIN
        capital ON id_capital = capital_id_capital
            JOIN
        country ON id_capital = country.capital_id_capital
			JOIN 
		regions on id_regions=regions_id_regions
        group by id_regions;
    

    drop view time_country;
    select*from time_country;


        
        
        

       

