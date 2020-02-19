-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: map
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `capital`
--

DROP TABLE IF EXISTS `capital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `capital` (
  `id_capital` int(11) NOT NULL AUTO_INCREMENT,
  `name_capital` varchar(30) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `mayor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_capital`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capital`
--

LOCK TABLES `capital` WRITE;
/*!40000 ALTER TABLE `capital` DISABLE KEYS */;
INSERT INTO `capital` VALUES (1,'Абу-Дабі',972,1206000,'Халіфа Бін Заїд'),(2,'Москва',2511,11990000,'Собянін Сергій'),(3,'Лондон',1572,8136000,'Садік Хан'),(4,'Київ',1201,2884000,'Віталій Кличко'),(5,'Варшава',517,1745000,'Рафал Тжасковський'),(6,'Вашингтон',177,693000,'Муріел Боузер'),(7,'Канберра',814,356585,'Ерік Хаус'),(8,'Кейптаун',155,433688,'Патрісія де Ліль'),(9,'Каїр',528,19000000,'Эль-Кахира'),(10,'Пекін',16809,21710000,'Чен Чінінг'),(11,'Токіо',2188,9273000,'Юріко Коіке'),(12,'Мадрид',604,3166000,'Мануела Кармен'),(13,'Париж',105,2200000,'Анн Ідальго'),(14,'Берлін',891,1136000,'Міхаель Мюллер'),(15,'Бразиліа',5780,2481000,'Еліо де Олівейра Сантус'),(16,'Торонто',630,2731000,'Джон Торі'),(17,'Буенос-Айрес',203,2890000,'Гарісон Родрігес');
/*!40000 ALTER TABLE `capital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `capital_view`
--

DROP TABLE IF EXISTS `capital_view`;
/*!50001 DROP VIEW IF EXISTS `capital_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `capital_view` AS SELECT 
 1 AS `Світові стлиці`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cost_medicine`
--

DROP TABLE IF EXISTS `cost_medicine`;
/*!50001 DROP VIEW IF EXISTS `cost_medicine`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `cost_medicine` AS SELECT 
 1 AS `Витрати на медицину`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cost_of_army`
--

DROP TABLE IF EXISTS `cost_of_army`;
/*!50001 DROP VIEW IF EXISTS `cost_of_army`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `cost_of_army` AS SELECT 
 1 AS `Витрати на армію`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `name_country` varchar(45) NOT NULL,
  `Area` int(11) NOT NULL,
  `date_of_indenpedence` date NOT NULL,
  `forms_of_government` enum('Respublica','Monarhiya') DEFAULT NULL,
  `currency` varchar(25) DEFAULT '$',
  `president` varchar(25) DEFAULT NULL,
  `vice_president` varchar(25) DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `capital_id_capital` int(11) NOT NULL,
  `regions_id_regions` int(11) NOT NULL,
  `phone_cod` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_country`),
  KEY `capital_id_capital` (`capital_id_capital`),
  KEY `regions_id_regions` (`regions_id_regions`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`capital_id_capital`) REFERENCES `capital` (`id_capital`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `country_ibfk_2` FOREIGN KEY (`regions_id_regions`) REFERENCES `regions` (`id_regions`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'ОАЕ',83600,'1971-12-02','Respublica','Дирхам','Насір ель Ахлі','Саїд Джара',9400000,1,5,'+971'),(2,'Росія',17100000,'1990-06-12','Monarhiya','Рубль','Володимир Путін','Дмитро Медведєв',144500000,2,8,'+7'),(3,'Велика британія',242495,'1922-03-12','Monarhiya','Фунт стерлінгів','Єлизавета II','Тереза Мей',66020000,3,2,'+44'),(4,'Україна',603628,'1991-08-21','Monarhiya','Гривня','Володимир Зеленський','Гройсман',44830000,4,4,'+380'),(5,'Польща',312679,'1918-11-11','Respublica','Злотий','Аджей Дуда','Роберт Левандовські',37970000,5,4,'+48'),(6,'США',9826675,'1776-07-04','Respublica','Американський долар','Дональд Трамп','Майк Пенс',9230045,6,16,'+1'),(7,'Австралія',7686850,'1901-01-01','Respublica','Австралійський долар','Єлизавета II','Скотт Моррісон',21507717,7,19,'+61'),(8,'Південно-Африка́нська Респу́бліка',1221037,'1961-05-06','Monarhiya','Ранд','Матамела Сиріл Рамафоса',NULL,50586757,8,15,'+27'),(9,'Єгипет',1001450,'1922-02-28','Monarhiya','Єгипетський фунт','Абдель Фаттах Ас-Сісі',NULL,92658900,9,16,'+20'),(10,'Китай',9597000,'1949-03-01','Monarhiya','Юань Женьміньбі','Сі Цзіньпін',NULL,1386000000,10,9,'+61'),(11,'Японія',377972,'1947-05-03','Monarhiya','Єна','Його величність Акіхіто',NULL,127110047,11,9,'+81'),(12,'Іспанія',504645,'1714-08-09','Monarhiya','Євро','Філіп VI','Педро Санчес',45200737,12,3,'+34'),(13,'Франція',551595,'0874-02-02','Respublica','Євро','Еммануель Макрон','Едуар Філіпп',66842134,13,1,'+33'),(14,'Німеччина',357386,'1918-04-11','Monarhiya','Євро','Франк-Вальтер Штайнмаєр','Ангела Меркель',2887000,14,18,'+49'),(15,'Бразилія',8515767,'1825-08-29','Respublica','Реал','Жаїр Болсонару','Амілтон Моуран',210147125,15,19,'+55'),(16,'Канада',9984670,'1867-07-01','Monarhiya','Канадський долар','Єлизавета II','Джастін Трюдо',37067011,16,16,'+1'),(17,'Аргентина',2766890,'1810-05-25','Respublica','Аргентинський песо','Маурісіо Макрі','Габріела Мікетті',40117096,17,19,'+54');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_in_organization`
--

DROP TABLE IF EXISTS `country_in_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country_in_organization` (
  `id_org` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_entry` date DEFAULT NULL,
  `date_of_release` date DEFAULT NULL,
  `union_n_union_id` int(11) NOT NULL,
  `country_id_country` int(11) NOT NULL,
  PRIMARY KEY (`id_org`),
  KEY `union_n_union_id` (`union_n_union_id`),
  KEY `country_id_country` (`country_id_country`),
  CONSTRAINT `country_in_organization_ibfk_1` FOREIGN KEY (`union_n_union_id`) REFERENCES `union_n` (`union_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `country_in_organization_ibfk_2` FOREIGN KEY (`country_id_country`) REFERENCES `country` (`id_country`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_in_organization`
--

LOCK TABLES `country_in_organization` WRITE;
/*!40000 ALTER TABLE `country_in_organization` DISABLE KEYS */;
INSERT INTO `country_in_organization` VALUES (1,'1958-12-04',NULL,1,1),(2,'1974-02-12',NULL,2,2),(3,'1989-04-23',NULL,3,3),(4,'1986-12-12',NULL,4,4),(5,'2004-11-22','2019-05-13',5,5),(6,'1999-04-02',NULL,6,6),(7,'1977-07-12','2019-05-29',7,7),(8,'1995-08-08',NULL,8,8),(9,'1999-12-12',NULL,9,9),(10,'2001-11-02','2019-05-29',10,10),(11,'1979-07-12',NULL,1,11),(12,'1959-12-19','1962-12-19',2,12),(13,'1995-02-18',NULL,3,13),(14,'1999-01-17','2019-05-29',4,14),(15,'1994-12-01',NULL,5,15),(16,'1969-11-02',NULL,6,16),(17,'1991-10-22',NULL,7,17),(18,'1958-12-04','1991-10-22',10,1),(19,'1974-02-12',NULL,9,2),(20,'1989-04-23',NULL,8,3),(21,'1986-12-12','1995-08-08',7,4),(22,'2004-11-22',NULL,2,5),(23,'1999-04-02','2019-05-29',5,6),(24,'1977-07-12',NULL,4,7),(25,'1995-08-08',NULL,3,8),(26,'1999-12-12',NULL,2,9),(27,'2001-11-02',NULL,1,10),(28,'1979-07-12',NULL,10,11),(29,'1959-12-19','1962-12-19',9,12),(30,'1995-02-18','2019-05-27',8,13),(31,'1999-01-17',NULL,7,14),(32,'1994-12-01',NULL,6,15),(33,'1969-11-02','2019-05-13',5,16),(34,'1991-10-22',NULL,2,17),(35,'1999-01-22',NULL,7,12);
/*!40000 ALTER TABLE `country_in_organization` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Add_country_in_organization` BEFORE INSERT ON `country_in_organization` FOR EACH ROW begin 
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
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Add_country_in_organization_2` BEFORE INSERT ON `country_in_organization` FOR EACH ROW begin 
DECLARE exception CONDITION FOR SQLSTATE '22012';
DECLARE CONTINUE HANDLER FOR exception 
RESIGNAL SET MESSAGE_TEXT = 'Країна вже вступила у цю організацію';
if  (select date_of_release from country_in_organization where country_id_country=new.country_id_country and union_n_union_id=new.union_n_union_id) is null
then
SIGNAL exception;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_date_release` BEFORE UPDATE ON `country_in_organization` FOR EACH ROW BEGIN
DECLARE exception CONDITION FOR SQLSTATE '22012';
DECLARE CONTINUE HANDLER FOR exception RESIGNAL SET MESSAGE_TEXT = 'Ви не можете додати дату виходу.Тому що країна раніше вийшла';
if old.date_of_release is not null then
SIGNAL exception;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `economy`
--

DROP TABLE IF EXISTS `economy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `economy` (
  `id_economy` int(11) NOT NULL AUTO_INCREMENT,
  `VVP` decimal(9,2) DEFAULT NULL,
  `Cost_of_army` decimal(15,1) DEFAULT NULL,
  `Cost_of_education` decimal(15,1) DEFAULT NULL,
  `Cost_of_medicine` decimal(15,1) DEFAULT NULL,
  `Price_export` decimal(15,1) DEFAULT NULL,
  `Price_import` decimal(15,1) DEFAULT NULL,
  `milion` varchar(20) DEFAULT 'Milion $',
  `year` year(4) DEFAULT NULL,
  `country_id_country` int(11) NOT NULL,
  PRIMARY KEY (`id_economy`),
  KEY `country_id_country` (`country_id_country`),
  CONSTRAINT `economy_ibfk_1` FOREIGN KEY (`country_id_country`) REFERENCES `country` (`id_country`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economy`
--

LOCK TABLES `economy` WRITE;
/*!40000 ALTER TABLE `economy` DISABLE KEYS */;
INSERT INTO `economy` VALUES (1,13000.00,1.0,30.0,30.0,1000.0,500.0,'Milion $',2000,1),(2,4000.00,100.0,10.0,70.0,300.0,650.0,'Milion $',2000,2),(3,26000.00,50.0,50.0,90.0,80.0,40.0,'Milion $',2000,3),(4,4500.00,400.0,17.0,120.0,10.0,340.0,'Milion $',2000,4),(5,14000.00,10.0,300.0,450.0,245.0,1.0,'Milion $',2000,5),(6,60000.00,700.0,800.0,560.0,1000.0,670.0,'Milion $',2000,6),(7,35000.00,30.0,345.0,400.0,300.0,250.0,'Milion $',2000,7),(8,6000.00,150.0,10.0,10.0,300.0,1000.0,'Milion $',2000,8),(9,23000.00,10.0,350.0,1000.0,560.0,470.0,'Milion $',2000,9),(10,18000.00,100.0,345.0,560.0,1500.0,900.0,'Milion $',2000,10),(11,27000.00,14.0,750.0,440.0,700.0,560.0,'Milion $',2000,11),(12,32000.00,50.0,150.0,300.0,300.0,150.0,'Milion $',2000,12),(13,50000.00,400.0,670.0,750.0,500.0,300.0,'Milion $',2000,13),(14,45000.00,300.0,600.0,750.0,100.0,600.0,'Milion $',2000,14),(15,15000.00,10.0,80.0,100.0,150.0,400.0,'Milion $',2000,15),(16,70000.00,10.0,1000.0,900.0,100.0,5.0,'Milion $',2000,16),(17,13000.00,10.0,50.0,100.0,300.0,450.0,'Milion $',2000,16),(18,13000.00,1.0,30.0,30.0,801.0,540.0,'Milion $',2001,1),(19,4000.00,100.0,10.0,70.0,241.0,420.0,'Milion $',2001,2),(20,11100.00,40.0,34.0,96.0,801.0,463.0,'Milion $',2001,3),(21,3500.00,210.0,170.0,220.0,217.0,256.0,'Milion $',2001,4),(22,8000.00,340.0,30.0,480.0,246.0,180.0,'Milion $',2001,5),(23,6320.00,530.0,400.0,760.0,104.0,270.0,'Milion $',2001,6),(24,21012.00,21.0,345.0,200.0,126.0,250.0,'Milion $',2001,7),(25,1200.00,150.0,100.0,30.0,701.0,100.0,'Milion $',2001,8),(26,8715.00,210.0,380.0,100.0,661.0,470.0,'Milion $',2001,9),(27,5220.00,30.0,715.0,520.0,151.0,300.0,'Milion $',2001,10),(28,4022.00,80.0,550.0,380.0,701.0,520.0,'Milion $',2001,11),(29,3035.00,10.0,40.0,290.0,301.0,150.0,'Milion $',2001,12),(30,3156.00,250.0,770.0,720.0,501.0,335.0,'Milion $',2001,13),(31,3235.00,330.0,300.0,650.0,153.0,380.0,'Milion $',2001,14),(32,1997.00,139.0,830.0,170.0,141.0,400.0,'Milion $',2001,15),(33,1689.00,70.0,100.0,930.0,103.0,57.0,'Milion $',2001,16),(34,13000.00,245.0,80.0,135.0,351.0,450.0,'Milion $',2001,17),(35,15000.00,101.0,70.0,40.0,700.0,540.0,'Milion $',2002,1),(36,3800.00,100.0,20.0,30.0,240.0,420.0,'Milion $',2002,2),(37,9100.00,40.0,34.0,96.0,800.0,463.0,'Milion $',2002,3),(38,5500.00,110.0,150.0,220.0,106.0,256.0,'Milion $',2002,4),(39,7800.00,140.0,30.0,480.0,245.0,180.0,'Milion $',2002,5),(40,7320.00,330.0,600.0,760.0,503.0,270.0,'Milion $',2002,6),(41,18010.00,11.0,45.0,200.0,325.0,250.0,'Milion $',2002,7),(42,2200.00,130.0,210.0,30.0,600.0,100.0,'Milion $',2002,8),(43,9715.00,110.0,280.0,100.0,660.0,470.0,'Milion $',2002,9),(44,2220.00,70.0,415.0,520.0,150.0,300.0,'Milion $',2002,10),(45,4422.00,90.0,200.0,380.0,300.0,520.0,'Milion $',2002,11),(46,3735.00,30.0,50.0,290.0,200.0,150.0,'Milion $',2002,12),(47,3956.00,150.0,370.0,720.0,300.0,335.0,'Milion $',2002,13),(48,4235.00,430.0,300.0,650.0,152.0,380.0,'Milion $',2002,14),(49,1997.00,339.0,630.0,170.0,120.0,400.0,'Milion $',2002,15),(50,2189.00,80.0,140.0,930.0,130.0,57.0,'Milion $',2002,16),(51,12000.00,315.0,70.0,135.0,350.0,450.0,'Milion $',2002,17);
/*!40000 ALTER TABLE `economy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check1` BEFORE INSERT ON `economy` FOR EACH ROW BEGIN
  IF  (new.VVP)<=0 or (new.cost_of_army)<=0 or (new.cost_of_education)<=0 or (new.cost_of_medicine)<=0 or (new.price_export)<=0 or (new.price_import)<=0
  THEN
   SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Помилка вводу !';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `language` (
  `id_lang` int(11) NOT NULL AUTO_INCREMENT,
  `name_lang` varchar(45) DEFAULT NULL,
  `carries` int(11) DEFAULT NULL,
  `official` int(11) DEFAULT NULL,
  `language_cod` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_lang`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Англійська мова',1500000000,53,'ENG'),(2,'Німецька мова',142000000,7,'GER'),(3,'Іспанська мова ',437000000,23,'SPA'),(4,'Французька мова ',7680000,53,'FRA'),(5,'Російська мова ',154000000,22,'RUS'),(6,'Українська мова ',34710100,1,'UKR'),(7,'Китайська мова ',1200000000,4,'ZHO'),(8,'Японська мова ',130000000,1,'JPN'),(9,'Польська мова ',38000000,2,'POL'),(10,'Португальська мова ',220000000,10,'POR'),(11,'Арабська мова ',270000000,NULL,'ARA');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_in_country`
--

DROP TABLE IF EXISTS `language_in_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `language_in_country` (
  `id_lang_in_count` int(11) NOT NULL AUTO_INCREMENT,
  `country_id_country` int(11) NOT NULL,
  `language_id_lang` int(12) NOT NULL,
  PRIMARY KEY (`id_lang_in_count`),
  KEY `country_id_country` (`country_id_country`),
  KEY `language_in_country_ibfk_1` (`language_id_lang`),
  CONSTRAINT `language_in_country_ibfk_1` FOREIGN KEY (`language_id_lang`) REFERENCES `language` (`id_lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `language_in_country_ibfk_2` FOREIGN KEY (`country_id_country`) REFERENCES `country` (`id_country`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_in_country`
--

LOCK TABLES `language_in_country` WRITE;
/*!40000 ALTER TABLE `language_in_country` DISABLE KEYS */;
INSERT INTO `language_in_country` VALUES (1,1,11),(2,2,5),(3,3,1),(4,4,6),(5,5,9),(6,6,1),(7,6,3),(8,6,4),(9,7,1),(10,8,1),(11,9,11),(12,10,7),(13,11,8),(14,12,3),(15,12,10),(16,13,4),(17,14,2),(18,15,10),(19,16,1),(20,16,4),(21,17,3),(22,4,1);
/*!40000 ALTER TABLE `language_in_country` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_language_in_country` BEFORE INSERT ON `language_in_country` FOR EACH ROW begin 
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
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `language_view`
--

DROP TABLE IF EXISTS `language_view`;
/*!50001 DROP VIEW IF EXISTS `language_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `language_view` AS SELECT 
 1 AS `Світові мови`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `litle_union`
--

DROP TABLE IF EXISTS `litle_union`;
/*!50001 DROP VIEW IF EXISTS `litle_union`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `litle_union` AS SELECT 
 1 AS `Відомості про найменшу організацію`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mainland`
--

DROP TABLE IF EXISTS `mainland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mainland` (
  `id_land` int(11) NOT NULL AUTO_INCREMENT,
  `name_land` varchar(30) DEFAULT NULL,
  `area` int(15) DEFAULT NULL,
  `population` int(15) DEFAULT NULL,
  PRIMARY KEY (`id_land`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainland`
--

LOCK TABLES `mainland` WRITE;
/*!40000 ALTER TABLE `mainland` DISABLE KEYS */;
INSERT INTO `mainland` VALUES (1,'Євразія',54760000,461800000),(2,'Америка',24710000,579000000),(3,'Африка',30370000,1216000000),(4,'Антарктида',14000000,0);
/*!40000 ALTER TABLE `mainland` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pop_reg`
--

DROP TABLE IF EXISTS `pop_reg`;
/*!50001 DROP VIEW IF EXISTS `pop_reg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `pop_reg` AS SELECT 
 1 AS `Регіон`,
 1 AS `Площа`,
 1 AS `Населення`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reg_cap`
--

DROP TABLE IF EXISTS `reg_cap`;
/*!50001 DROP VIEW IF EXISTS `reg_cap`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `reg_cap` AS SELECT 
 1 AS `Регіон`,
 1 AS `Столиця`,
 1 AS `Площа`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `region`
--

DROP TABLE IF EXISTS `region`;
/*!50001 DROP VIEW IF EXISTS `region`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `region` AS SELECT 
 1 AS `name_region`,
 1 AS `Країни`,
 1 AS `Мови`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `regions` (
  `id_regions` int(11) NOT NULL AUTO_INCREMENT,
  `name_region` varchar(45) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `mainland_id_land` int(11) NOT NULL,
  PRIMARY KEY (`id_regions`),
  KEY `mainland_id_land` (`mainland_id_land`),
  CONSTRAINT `regions_ibfk_1` FOREIGN KEY (`mainland_id_land`) REFERENCES `mainland` (`id_land`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Західна Європа',15000000,1),(2,'Північна Європа',143300,1),(3,'Південна Європа',15000000,1),(4,'Східна Європа',23000000,1),(5,'Західна Азія',2823000,1),(6,'Центральна Азія',3882000,1),(7,'Південна Азія',4800000,1),(8,'Північна Азія',17075200,1),(9,'Східна Азія',11839074,1),(10,'Південно-Східна Азія',4500000,1),(11,'Північна Африка',10000000,3),(12,'Західна Африка',5100000,3),(13,'Центральна Африка',7300000,3),(14,'Східна Африка',7700000,3),(15,'Південна Африка',1220000,3),(16,'Північна Америка',24710000,2),(17,'Центральна Америка',35700000,2),(18,'Карибський басейн',244890,2),(19,'Південна Америка',17840000,2);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check2` BEFORE INSERT ON `regions` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `time_country`
--

DROP TABLE IF EXISTS `time_country`;
/*!50001 DROP VIEW IF EXISTS `time_country`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `time_country` AS SELECT 
 1 AS `Регіон`,
 1 AS `Країни`,
 1 AS `Світові годинники`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `time_zone` (
  `id_zone` int(11) NOT NULL AUTO_INCREMENT,
  `name_zone` varchar(45) DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
INSERT INTO `time_zone` VALUES (1,'UTC-12','-12:00:00'),(2,'UTC-11','-11:00:00'),(3,'UTC-10','-10:00:00'),(4,'UTC-9:30','-09:30:00'),(5,'UTC-9','-09:00:00'),(6,'UTC-8','-08:00:00'),(7,'UTC-7','-07:00:00'),(8,'UTC-6','-06:00:00'),(9,'UTC-5','-05:00:00'),(10,'UTC-4','-04:00:00'),(11,'UTC-3:30','-03:30:00'),(12,'UTC-3','-03:00:00'),(13,'UTC-2','-02:00:00'),(14,'UTC-1','-01:00:00'),(15,'UTC+0','00:00:00'),(16,'UTC+1','01:00:00'),(17,'UTC+2','02:00:00'),(18,'UTC+3','03:00:00'),(19,'UTC+3:30','03:30:00'),(20,'UTC+4','04:00:00'),(21,'UTC+4:30','04:30:00'),(22,'UTC+5','05:00:00'),(23,'UTC+5:30','05:30:00'),(24,'UTC+5:45','05:45:00'),(25,'UTC+6','06:00:00'),(26,'UTC+6:30','06:30:00'),(27,'UTC+7','07:00:00'),(28,'UTC+8','08:00:00'),(29,'UTC+8:45','08:45:00'),(30,'UTC+9','09:00:00'),(31,'UTC+9:30','09:30:00'),(32,'UTC+10','10:00:00'),(33,'UTC+10:30','10:30:00'),(34,'UTC+11','11:00:00'),(35,'UTC+11:30','11:30:00'),(36,'UTC+12','12:00:00'),(37,'UTC+12:45','12:45:00'),(38,'UTC+13','13:00:00'),(39,'UTC+14','14:00:00');
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_Time_zone` BEFORE INSERT ON `time_zone` FOR EACH ROW begin 
DECLARE exception CONDITION FOR SQLSTATE '22012';
DECLARE exception_2 CONDITION FOR SQLSTATE '22013';
DECLARE CONTINUE HANDLER FOR exception RESIGNAL SET MESSAGE_TEXT = 'Ви не можете додати такий часовий пояс. Тому що такого часового пояса не існує';
DECLARE CONTINUE HANDLER FOR exception_2 RESIGNAL SET MESSAGE_TEXT = 'Ви не можете додати такий часовий пояс. Тому що він уже існує в базі';
if new.name_zone not in(select name_zone from time_zone) then
SIGNAL exception;
else 
SIGNAL exception_2;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `times_country`
--

DROP TABLE IF EXISTS `times_country`;
/*!50001 DROP VIEW IF EXISTS `times_country`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `times_country` AS SELECT 
 1 AS `Країни`,
 1 AS `Часова зона`,
 1 AS `Кількість`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `union_n`
--

DROP TABLE IF EXISTS `union_n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `union_n` (
  `union_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_union` varchar(80) DEFAULT NULL,
  `abbrevitation` varchar(15) DEFAULT NULL,
  `date_of_foundation` date DEFAULT '0000-00-00',
  `headquartes` varchar(30) DEFAULT NULL,
  `head` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`union_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `union_n`
--

LOCK TABLES `union_n` WRITE;
/*!40000 ALTER TABLE `union_n` DISABLE KEYS */;
INSERT INTO `union_n` VALUES (1,'Всесвітня організація охорони здоров*я','ВООЗ','1948-04-07','Женева','Tedros Adhanom Ghebreyesus'),(2,'Міжнаро́дна аге́нція з а́томної ене́ргії','МАГАТЕ ','1957-02-25','Відень','Амано Юкія'),(3,'Міжнародна організація праці','МОП ','1919-12-12','Женева','Hans Böckler Preis'),(4,'Організація з безпеки і співробітництва в Європі','ОБСЄ','1975-03-17','Венна',NULL),(5,'Рада Європи','РЄ','1949-03-20','Страсбург','Едмонд Панаріті'),(6,'Організа́ція Об*є́днаних На́цій з пита́нь осві́ти, нау́ки і культу́ри','ЮНЕСКО','1945-11-16','Place de Fontenoy у Парижі','Одрі Азулай'),(7,'Всесвітня організація інтелектуальної власності','ВОІВ','1967-01-13','Женева',NULL),(8,'Організація Об*єднаних Націй','ООН','1945-12-29','Нью-Йорк','Антоніу Гутерреш'),(9,'Європейський Союз','ЄС','1993-11-01','Брюсель','Жан-Клод Юнкер'),(10,'Організа́ція Північноатланти́чного до́говору, також Північноатланти́чний алья́нс','НАТО','1949-04-04','Брюсель','Єнс Столтенберг');
/*!40000 ALTER TABLE `union_n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `сapital_in_time_zone`
--

DROP TABLE IF EXISTS `сapital_in_time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `сapital_in_time_zone` (
  `id_time_zone` int(11) NOT NULL AUTO_INCREMENT,
  `capital_id_capital` int(11) NOT NULL,
  `time_zone_id_zone` int(11) NOT NULL,
  PRIMARY KEY (`id_time_zone`),
  KEY `capital_id_capital` (`capital_id_capital`),
  KEY `time_zone_id_zone` (`time_zone_id_zone`),
  CONSTRAINT `сapital_in_time_zone_ibfk_1` FOREIGN KEY (`capital_id_capital`) REFERENCES `capital` (`id_capital`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `сapital_in_time_zone_ibfk_2` FOREIGN KEY (`time_zone_id_zone`) REFERENCES `time_zone` (`id_zone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `сapital_in_time_zone`
--

LOCK TABLES `сapital_in_time_zone` WRITE;
/*!40000 ALTER TABLE `сapital_in_time_zone` DISABLE KEYS */;
INSERT INTO `сapital_in_time_zone` VALUES (1,1,20),(2,2,18),(3,3,15),(4,4,18),(5,5,16),(6,6,9),(7,7,34),(8,8,17),(9,9,17),(10,10,28),(11,11,30),(12,12,16),(13,13,16),(14,14,16),(15,15,10),(16,16,9),(17,17,12);
/*!40000 ALTER TABLE `сapital_in_time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'map'
--

--
-- Dumping routines for database 'map'
--
/*!50003 DROP FUNCTION IF EXISTS `Cost_Country` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Cost_Country`(Countr_y varchar(50), yea_r year, W varchar(4)) RETURNS varchar(300) CHARSET utf8mb4
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Country_in_unio_n` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Country_in_unio_n`(Countr_y varchar(50), Status varchar(15)) RETURNS varchar(500) CHARSET utf8mb4
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Education` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Education`(Countr_y varchar(50), yea_r year) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Preority` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Preority`(Countr_y varchar(50), yea_r year) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Sub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Sub`(Countr_y varchar(50), country_two varchar(50)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_Country_From_Org` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Country_From_Org`(Countr_y varchar(40),abr varchar(40), param2 date)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Information_about_country` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Information_about_country`(Countr_y varchar(40))
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Information_about_economy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Information_about_economy`(countr_y varchar(40),yea_r year)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Information_time_zone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Information_time_zone`(time_zon_e varchar(15))
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_Population` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Population`(Countr_y varchar(40),new_population int(11))
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_Price_export` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Price_export`(countr_y varchar(50), Money int, yea_r year)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `capital_view`
--

/*!50001 DROP VIEW IF EXISTS `capital_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `capital_view` AS select concat(`capital`.`name_capital`,' - є найменша за площею світова столиця з площею ',`capital`.`area`,'Кв/Км з населенням ',`capital`.`population`,'. Мером ',`capital`.`name_capital`,' є ',`capital`.`mayor`) AS `Світові стлиці` from `capital` where (`capital`.`id_capital` = (select `capital`.`id_capital` from `capital` order by `capital`.`area` limit 1)) union select concat(`capital`.`name_capital`,' - є найбільша за площею світова столиця з площею ',`capital`.`area`,'Кв/Км з населенням ',`capital`.`population`,'. Мером ',`capital`.`name_capital`,' є ',`capital`.`mayor`) AS `Name_exp_2` from `capital` where (`capital`.`id_capital` = (select `capital`.`id_capital` from `capital` order by `capital`.`area` desc limit 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cost_medicine`
--

/*!50001 DROP VIEW IF EXISTS `cost_medicine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cost_medicine` AS select concat(`regions`.`name_region`,' витратила на медицину   ',sum(`economy`.`Cost_of_medicine`),'Milion $') AS `Витрати на медицину` from ((`economy` join `country` on((`country`.`id_country` = `economy`.`country_id_country`))) join `regions` on((`regions`.`id_regions` = `country`.`regions_id_regions`))) group by `regions`.`name_region` union select concat('СУМА  ',sum(`economy`.`Cost_of_medicine`),'Milion $') AS `Name_exp_2` from ((`economy` join `country` on((`country`.`id_country` = `economy`.`country_id_country`))) join `regions` on((`regions`.`id_regions` = `country`.`regions_id_regions`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cost_of_army`
--

/*!50001 DROP VIEW IF EXISTS `cost_of_army`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cost_of_army` AS select concat('2000 YEAR   ',`country`.`name_country`,' витратила на армію ',`economy`.`Cost_of_army`,'Milion $ ') AS `Витрати на армію` from (`economy` join `country` on((`country`.`id_country` = `economy`.`country_id_country`))) where (`economy`.`year` = '2000') union select concat('2001 YEAR   ',`country`.`name_country`,' витратила на армію ',`economy`.`Cost_of_army`,'Milion $ ') AS `Витрати на армію` from (`economy` join `country` on((`country`.`id_country` = `economy`.`country_id_country`))) where (`economy`.`year` = '2001') union all select concat('2002 YEAR   ',`country`.`name_country`,' витратила на армію ',`economy`.`Cost_of_army`,'Milion $ ') AS `Витрати на армію` from (`economy` join `country` on((`country`.`id_country` = `economy`.`country_id_country`))) where (`economy`.`year` = '2002') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `language_view`
--

/*!50001 DROP VIEW IF EXISTS `language_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `language_view` AS select concat(`language`.`name_lang`,' країнах світу, а також офіційна у  ',`language`.`official`,' країнах світу. Код мови - ',`language`.`language_cod`) AS `Світові мови` from (`language_in_country` join `language` on((`language`.`id_lang` = `language_in_country`.`language_id_lang`))) where (`language`.`id_lang` = (select `language`.`id_lang` from (`language_in_country` join `language` on((`language`.`id_lang` = `language_in_country`.`language_id_lang`))) group by `language`.`id_lang` order by count(`language_in_country`.`language_id_lang`) desc limit 1)) group by `language`.`id_lang` union all select concat(`language`.`name_lang`,' офіційна у  ',`language`.`official`,' країнах світу. Код мови - ',`language`.`language_cod`) AS `Найпопулярніша мова` from (`language_in_country` join `language` on((`language`.`id_lang` = `language_in_country`.`language_id_lang`))) where (`language`.`id_lang` = (select `language`.`id_lang` from (`language_in_country` join `language` on((`language`.`id_lang` = `language_in_country`.`language_id_lang`))) group by `language`.`id_lang` order by count(`language_in_country`.`language_id_lang`) asc limit 1)) group by `language`.`id_lang` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `litle_union`
--

/*!50001 DROP VIEW IF EXISTS `litle_union`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `litle_union` AS select concat('У організації ',`union_n`.`name_union`,' є ',cast(count(`country_in_organization`.`country_id_country`) as char charset utf8mb4),' країн. Штаб квартира організації - ',`union_n`.`headquartes`,'. Голова організації ',`union_n`.`head`) AS `Відомості про найменшу організацію` from (`country_in_organization` join `union_n` on((`union_n`.`union_id` = `country_in_organization`.`union_n_union_id`))) group by `union_n`.`name_union`,`union_n`.`headquartes`,`union_n`.`head` order by count(`country_in_organization`.`country_id_country`) limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pop_reg`
--

/*!50001 DROP VIEW IF EXISTS `pop_reg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pop_reg` AS select `regions`.`name_region` AS `Регіон`,concat(cast(`regions`.`area` as char charset utf8mb4),'  KM^2') AS `Площа`,sum(`country`.`population`) AS `Населення` from (`regions` join `country` on((`regions`.`id_regions` = `country`.`regions_id_regions`))) group by `regions`.`id_regions` order by `Населення` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reg_cap`
--

/*!50001 DROP VIEW IF EXISTS `reg_cap`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reg_cap` AS select `regions`.`name_region` AS `Регіон`,`capital`.`name_capital` AS `Столиця`,concat(cast(max(`capital`.`area`) as char charset utf8mb4),'  KM^2') AS `Площа` from ((`regions` join `country` on((`regions`.`id_regions` = `country`.`regions_id_regions`))) join `capital` on((`capital`.`id_capital` = `country`.`capital_id_capital`))) group by `regions`.`name_region` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `region`
--

/*!50001 DROP VIEW IF EXISTS `region`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `region` AS select `regions`.`name_region` AS `name_region`,group_concat(distinct `country`.`name_country` separator ',') AS `Країни`,group_concat(distinct `language`.`name_lang` separator ',') AS `Мови` from (((`regions` join `country` on((`regions`.`id_regions` = `country`.`regions_id_regions`))) join `language_in_country` on((`country`.`id_country` = `language_in_country`.`country_id_country`))) join `language` on((`language`.`id_lang` = `language_in_country`.`language_id_lang`))) group by `regions`.`id_regions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `time_country`
--

/*!50001 DROP VIEW IF EXISTS `time_country`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `time_country` AS select `regions`.`name_region` AS `Регіон`,group_concat(distinct `country`.`name_country` separator ',') AS `Країни`,group_concat('Час у країні <<',`country`.`name_country`,'>>  є  -',cast(cast((utc_time() + `time_zone`.`time`) as time) as char charset utf8mb4),'>>' separator ',') AS `Світові годинники` from ((((`time_zone` join `сapital_in_time_zone` on((`time_zone`.`id_zone` = `сapital_in_time_zone`.`time_zone_id_zone`))) join `capital` on((`capital`.`id_capital` = `сapital_in_time_zone`.`capital_id_capital`))) join `country` on((`capital`.`id_capital` = `country`.`capital_id_capital`))) join `regions` on((`regions`.`id_regions` = `country`.`regions_id_regions`))) group by `regions`.`id_regions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `times_country`
--

/*!50001 DROP VIEW IF EXISTS `times_country`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `times_country` AS select group_concat(`country`.`name_country` separator ',') AS `Країни`,`time_zone`.`name_zone` AS `Часова зона`,count(0) AS `Кількість` from (((`time_zone` join `сapital_in_time_zone` on((`time_zone`.`id_zone` = `сapital_in_time_zone`.`time_zone_id_zone`))) join `capital` on((`capital`.`id_capital` = `сapital_in_time_zone`.`capital_id_capital`))) join `country` on((`capital`.`id_capital` = `country`.`capital_id_capital`))) group by `time_zone`.`name_zone` having (`Кількість` > 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-30 13:37:47
