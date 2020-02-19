use map;

-- Точний час у місті
SELECT 
    CONCAT('Точний час у місті  <<',
            name_capital,
            '>>  є  - ',
            CONVERT( CONVERT( UTC_TIME() + time_zone.time , TIME) , CHAR),
            '>>') AS 'Світові годинники'
FROM time_zone join сapital_in_time_zone on id_zone=time_zone_id_zone join capital on id_capital=capital_id_capital;


-- Роки перебування країни у організації
SELECT 
    name_country AS Країна,
    name_union AS Організація,
    CONCAT(DAYOFMONTH(date_of_entry),
            ' ',
            MONTHNAME(date_of_entry),
            ' ',
            YEAR(date_of_entry)) AS 'Дата входу',
    CONCAT(DAYOFMONTH(date_of_release),
            ' ',
            MONTHNAME(date_of_release),
            ' ',
            YEAR(date_of_release)) AS 'Дата виходу',
    CASE
        WHEN
            date_of_release IS NOT NULL
        THEN
            CONCAT('Вийшла з організації,перебувала - ',
                    YEAR(date_of_release) - YEAR(date_of_entry),
                    ' років')
        ELSE CONCAT('Досі перебуває,уже ',
                YEAR(NOW()) - YEAR(date_of_entry),
                ' років')
    END AS 'Кількість днів перебування'
FROM
    country
        INNER JOIN
    country_in_organization ON id_country = country_id_country
        INNER JOIN
    union_n ON union_id = union_n_union_id
ORDER BY 'Роки перебування' ASC;

-- Інформація про організацію та список країн які входять в організацію
SELECT 
    name_union AS Організація,
    COUNT(country_id_country) AS 'Кількість країн в організації',
    GROUP_CONCAT(DISTINCT name_country
        ORDER BY name_country ASC
        SEPARATOR ', ') AS 'Список'
FROM
    country
        INNER JOIN
    country_in_organization ON id_country = country_id_country
        INNER JOIN
    union_n ON union_id = union_n_union_id
GROUP BY name_union;
    

-- Прибуток країни за 2000 рік
SELECT 
    name_country AS 'Країна',
    CONCAT(CONVERT( economy.price_export - economy.price_import , CHAR),
            ' Milion $') AS 'Прибуток'
FROM
    country
        INNER JOIN
    economy ON id_country = country_id_country
WHERE
    economy.year = '2000'
GROUP BY name_country;


-- Характеристика зарплатaт за 2000 рік
	SELECT 
     name_country as 'Країна',
    CASE
        WHEN
            economy.VVP = (SELECT 
                    MAX(VVP)
                FROM
                    economy)
        THEN
            'Високі заробітні плати'
        WHEN
            economy.VVP < (SELECT 
                    MAX(VVP)
                FROM
                    economy)
                AND economy.VVP >= (SELECT 
                    AVG(VVP)
                FROM
                    economy)
        THEN
            'Середні заробітні плати'
        WHEN
            economy.VVP < (SELECT 
                    AVG(VVP)
                FROM
                    economy)
        THEN
            'Низькі заробітні плати'
    END as 'Характеристика'
FROM country 
		inner join economy 
			on id_country=country_id_country
WHERE
    year = '2000';
    
    
 -- Витрати країн за 2001 рік
SELECT name_country as Країна,
(CASE Cost_of_army WHEN Cost_of_army  THEN CONCAT(CONVERT( Cost_of_army , CHAR),
            ' Miliard $') END) 'Витрати на армію',
(CASE Cost_of_education WHEN Cost_of_education  THEN CONCAT(CONVERT( Cost_of_education , CHAR),
            ' Miliard $') END) 'Витрати на освіту',
(CASE Cost_of_medicine WHEN Cost_of_medicine THEN CONCAT(CONVERT( Cost_of_medicine , CHAR),
            ' Miliard $') END) 'Витрати на медицину',
CONCAT(CONVERT(sum(cost_of_army+Cost_of_education+Cost_of_medicine),CHAR),' Miliard $') as 'Всього'
FROM country 
		inner join economy 
			on id_country=country_id_country
            where year='2001'
GROUP BY id_country;

-- Витрати по материкам 
SELECT 
    name_land AS 'Материк',
    CONCAT(CONVERT( SUM(Cost_of_army) , CHAR),
            ' Miliard $') AS 'Витрати на армію',
    CONCAT(CONVERT( SUM(Cost_of_education) , CHAR),
            ' Miliard $') AS 'Витрати на освіту',
    CONCAT(CONVERT( SUM(Cost_of_medicine) , CHAR),
            ' Miliard $') AS 'Витрати на медицину'
FROM mainland inner join regions on id_land=mainland_id_land inner join country on id_regions=regions_id_regions inner join economy on id_country=country_id_country
GROUP BY name_land;


-- Найбільша столиця на материку
SELECT 
    name_land AS 'Материк',
    name_capital AS 'Столиця',
    CONCAT(CONVERT( MAX(capital.area) , CHAR),
            '  KM^2') AS 'Площа'
FROM
    mainland
        INNER JOIN
    regions ON id_land = mainland_id_land
        INNER JOIN
    country ON id_regions = regions_id_regions
        INNER JOIN
    capital ON id_capital = capital_id_capital
GROUP BY name_land;

-- Рейтинг зарплат за 2000 рік
SET @row_number = 0;
SELECT 
    @row_number:=@row_number + 1 AS 'Рейтинг',
   name_country AS 'Країна',
    CONCAT(CONVERT( economy.VVP , CHAR),
            ' $ на рік') AS 'Середня зарплата'
FROM
    economy
        JOIN
    country ON id_country = country_id_country
    WHERE economy.year='2000'
ORDER BY economy.VVP DESC;

-- Витрати на Армію
SELECT 
    'За 2000 рік' AS 'Рік',
    name_country AS 'Країна',
    CONCAT(CONVERT( economy.cost_of_army , CHAR),
            ' MILION $') AS 'Витрати на армію',
    CASE
        WHEN
            economy.cost_of_army = (SELECT 
                    MAX(cost_of_army)
                FROM
                    economy
                WHERE
                    year = '2000'
                GROUP BY country_id_country
                ORDER BY MAX(cost_of_army) DESC
                LIMIT 1)
        THEN
            'Високі витрати на армію'
        WHEN
            economy.cost_of_army < (SELECT 
                    MAX(cost_of_army)
                FROM
                    economy
                WHERE
                    year = '2000'
                GROUP BY country_id_country
                ORDER BY MAX(cost_of_army) DESC
                LIMIT 1)
                AND economy.cost_of_army >= (SELECT 
                    AVG(cost_of_army)
                FROM
                    economy
                WHERE
                    year = '2000')
        THEN
            'Достатні витрати на армію'
        WHEN
            economy.cost_of_army < (SELECT 
                    AVG(cost_of_army)
                FROM
                    economy
                WHERE
                    year = '2000')
        THEN
            'Потрібне покращення'
    END AS 'Коментарій'
FROM
    economy
        JOIN
    country ON id_country = country_id_country
WHERE
    year = '2000'
ORDER BY economy.cost_of_army DESC; 